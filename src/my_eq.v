module my_eq(
    input clk,
    input rst,
    input ce,
    input datain_valid,
    input [15:0] din,
    input [79:0] allgain,
    input gain_change,
    input eq_switch,
    output out_valid,
    output [18:0] dout,
    output in_ready,
    output reg [7:0] eq_debug
);

//更改增益gain
reg [7:0] gain;
reg gainwe;
reg gainset;
reg [3:0] filter_cnt;
reg eq_rst;
wire [18:0] dout_temp;
wire out_valid_temp;

wire [2:0] gain0, gain1, gain2, gain3;//0-16对应-8-8dB
assign {gain0,gain1,gain2,gain3} = (gain==0)?{3'd0,3'd4,3'd0,3'd4}://-8dB 00   -8dB对应着发00
                                   (gain==1)?{3'd0,3'd3,3'd0,3'd4}://-7dB 01
                                   (gain==2)?{3'd0,3'd2,3'd0,3'd4}://-6dB 02
                                   (gain==3)?{3'd0,3'd1,3'd0,3'd4}://-5dB 03
                                   (gain==4)?{3'd0,3'd0,3'd0,3'd4}://-4dB 04
                                   (gain==5)?{3'd0,3'd0,3'd0,3'd3}://-3dB 05
                                   (gain==6)?{3'd0,3'd0,3'd0,3'd2}://-2dB 06
                                   (gain==7)?{3'd0,3'd0,3'd0,3'd1}://-1dB 07
                                   (gain==8)?{3'd0,3'd0,3'd0,3'd0}://0dB 08
                                   (gain==9)?{3'd0,3'd0,3'd1,3'd0}://1dB 09
                                   (gain==10)?{3'd0,3'd0,3'd2,3'd0}://2dB 0A
                                   (gain==11)?{3'd0,3'd0,3'd3,3'd0}://3dB 0B
                                   (gain==12)?{3'd0,3'd0,3'd4,3'd0}://4dB 0C
                                   (gain==13)?{3'd1,3'd0,3'd4,3'd0}://5dB 0D
                                   (gain==14)?{3'd2,3'd0,3'd4,3'd0}://6dB 0E
                                   (gain==15)?{3'd3,3'd0,3'd4,3'd0}://7dB 0F
                                              {3'd4,3'd0,3'd4,3'd0};//gain==16 8dB 10

always @(posedge clk or negedge rst) begin
    if(!rst) begin
        gain<=0;
        gainwe<=0;
        gainset<=0;
        filter_cnt<=0;
        eq_rst<=1'b1;
        eq_debug<=0;
    end    
    else if(gain_change) begin
        eq_rst<=1'b0;
    end
    else if(!eq_rst && filter_cnt==0) begin
        eq_rst <= 1'b1;
        gainwe <= 1;
        gainset <= 0;
        gain <= allgain[7:0];
        filter_cnt <= filter_cnt + 1;

    end
    else if(gainwe && filter_cnt==1) begin
        gainwe <= 1;
        gainset <= 0;
        gain <= allgain[15:8];
        filter_cnt <= filter_cnt + 1;

    end
    else if(gainwe && filter_cnt==2) begin
        gainwe <= 1;
        gainset <= 0;
        gain <= allgain[23:16];
        filter_cnt <= filter_cnt + 1;

    end
    else if(gainwe && filter_cnt==3) begin
        gainwe <= 1;
        gainset <= 0;
        gain <= allgain[31:24];
        filter_cnt <= filter_cnt + 1;

    end
    else if(gainwe && filter_cnt==4) begin
        gainwe <= 1;
        gainset <= 0;
        gain <= allgain[39:32];
        filter_cnt <= filter_cnt + 1;

    end
    else if(gainwe && filter_cnt==5) begin
        gainwe <= 1;
        gainset <= 0;
        gain <= allgain[47:40];
        filter_cnt <= filter_cnt + 1;

    end
    else if(gainwe && filter_cnt==6) begin
        gainwe <= 1;
        gainset <= 0;
        gain <= allgain[55:48];
        filter_cnt <= filter_cnt + 1;

    end
    else if(gainwe && filter_cnt==7) begin
        gainwe <= 1;
        gainset <= 0;
        gain <= allgain[63:56];
        filter_cnt <= filter_cnt + 1;

    end
    else if(gainwe && filter_cnt==8) begin
        gainwe <= 1;
        gainset <= 0;
        gain <= allgain[71:64];
        filter_cnt <= filter_cnt + 1;

    end
    else if(gainwe && filter_cnt==9) begin
        gainwe <= 1;
        gainset <= 0;
        gain <= allgain[79:72];
        filter_cnt <= filter_cnt + 1;

    end
    else if(gainwe && filter_cnt==10) begin
        gainwe <= 0;
        gainset <= 1;
        gain <= 0;
        filter_cnt <= 0;
      
    end
    else begin
        gainset <= 0;
    end
end

//wire gain_temp = gain - 8'd48;

//数据状态机
wire in_valid;
assign in_valid = (datain_valid&&!gainwe&&!gainset) ? 1'b1 : 1'b0;

wire [18:0] dout0;
wire [18:0] dout1;
wire [18:0] dout2;
wire [18:0] dout3;
wire out_valid0,out_valid1,out_valid2,out_valid3;


Equalizer_Po EQ_u0(
		.clk(clk), //input clk
		.rstn(rst), //input rstn
		.ce(ce), //input ce
		.in_valid(in_valid), //input in_valid
		.din(din), //input [15:0] din
		.gainwe(gainwe), //input gainwe
		.gainset(gainset), //input gainset
		.gain(gain0), //input [2:0] gain
		.in_ready(in_ready), //output in_ready
		.out_valid(out_valid0), //output out_valid
		.dout(dout0) //output [18:0] dout
	);

Equalizer_Ne EQ_u1(
		.clk(clk), //input clk
		.rstn(rst), //input rstn
		.ce(ce), //input ce
		.in_valid(out_valid0), //input in_valid
		.din(dout0), //input [15:0] din
		.gainwe(gainwe), //input gainwe
		.gainset(gainset), //input gainset
		.gain(gain1), //input [2:0] gain
		.in_ready(in_ready), //output in_ready
		.out_valid(out_valid1), //output out_valid
		.dout(dout1) //output [18:0] dout
	);

Equalizer_Po EQ_u2(
		.clk(clk), //input clk
		.rstn(rst), //input rstn
		.ce(ce), //input ce
		.in_valid(out_valid1), //input in_valid
		.din(dout1), //input [15:0] din
		.gainwe(gainwe), //input gainwe
		.gainset(gainset), //input gainset
		.gain(gain2), //input [2:0] gain
		.in_ready(in_ready), //output in_ready
		.out_valid(out_valid2), //output out_valid
		.dout(dout2) //output [18:0] dout
	);

Equalizer_Ne EQ_u3(
		.clk(clk), //input clk
		.rstn(rst), //input rstn
		.ce(ce), //input ce
		.in_valid(out_valid2), //input in_valid
		.din(dout2), //input [15:0] din
		.gainwe(gainwe), //input gainwe
		.gainset(gainset), //input gainset
		.gain(gain3), //input [2:0] gain
		.in_ready(in_ready), //output in_ready
		.out_valid(out_valid_temp), //output out_valid
		.dout(dout_temp) //output [18:0] dout
	);

//Equalizer_Top EQ_Test(
//		.clk(clk), //input clk
//		.rstn(rst), //input rstn
//		.ce(ce), //input ce
//		.in_valid(in_valid), //input in_valid
//		.din(din), //input [15:0] din
//		.gainwe(gainwe), //input gainwe
//		.gainset(gainset), //input gainset
//		.gain(gain[2:0]), //input [2:0] gain
//		.in_ready(in_ready), //output in_ready
//		.out_valid(out_valid), //output out_valid
//		.dout(dout) //output [18:0] dout
//	);

assign dout = (eq_switch)?dout_temp:{3'd0,din};
assign out_valid = (eq_switch)?out_valid_temp:datain_valid;

endmodule