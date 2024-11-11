module my_echo(
    input clk,
    input rst,
    input [15:0] din,
    input datain_valid,
    input [7:0] relay1,
    input [1:0] echo_gain1,//0,0.25,0.50,0.75
    input echo_switch,
    output wire signed [15:0] dout,
    output wire dataout_valid
);

reg signed [15:0] dout_temp;
reg dataout_valid_temp;
localparam EchoRam_Length = 15'd24_000;

wire [15:0] echo_data1;
reg [14:0] now_ptr;
reg [14:0] echo_ptr1;
reg [14:0] echo_length1;
//assign echo_length1 = (relay1<50)?(relay1*(EchoRam_Length/50)) : (EchoRam_Length>>1);//延迟不大于500ms
//assign echo_ptr1 = (echo_length1<=now_ptr)?(now_ptr-echo_length1) :(EchoRam_Length-(echo_length1-now_ptr));

always @(*) begin
    if(!rst) begin
        echo_length1=15'd0;
        echo_ptr1=15'd0;
    end else begin
//        echo_length1 = (relay1<10)?(2400) : 
//                       (relay1<20)?(7200) :
//                       (relay1<30)?(12000) :
//                       (relay1<40)?(16800) : 21600;
        echo_length1 = (relay1<50)?(relay1*(EchoRam_Length/50)) : (EchoRam_Length>>1);//延迟不大于500ms
        echo_ptr1 = (echo_length1<=now_ptr)?(now_ptr-echo_length1) :(EchoRam_Length-(echo_length1-now_ptr));
    end
end

//wire [15:0] dout_temp;
//assign dout_temp = (($signed(din)+((echo_gain1==2'b00)?$signed(0):
//                                (echo_gain1==2'b01)?$signed(echo_data1>>>3):
//                                (echo_gain1==2'b10)?$signed(echo_data1>>>1):($signed(echo_data1>>>2)+$signed(echo_data1>>>1))))<65535)?
//                   ($signed(din)+((echo_gain1==2'b00)?$signed(0):
//                                (echo_gain1==2'b01)?$signed(echo_data1>>>3):
//                                (echo_gain1==2'b10)?$signed(echo_data1>>>1):($signed(echo_data1>>>2)+$signed(echo_data1>>>1)))):65535;

always @(posedge clk or negedge rst) begin
    if(!rst) begin
        now_ptr <= 0;
        dataout_valid_temp <= 0;
    end
    else begin
        if(datain_valid) begin
            dataout_valid_temp <= 1'b1;
            now_ptr <= (now_ptr<EchoRam_Length-1)?(now_ptr+1'b1) : 15'd0;
            dout_temp <= $signed(din)+((echo_gain1==2'b00)?$signed(0):
                                (echo_gain1==2'b01)?$signed(echo_data1)>>>2:
                                (echo_gain1==2'b10)?$signed(echo_data1)>>>1:($signed(echo_data1)>>>2+$signed(echo_data1)>>>1));

//            dout_temp <= (echo_gain1==2'b00)?din:
//                                (echo_gain1==2'b01)?din+echo_data1>>>2:
//                                (echo_gain1==2'b10)?din+echo_data1>>>1:(din+echo_data1>>>2+echo_data1>>>1);
        end
        else dataout_valid_temp <= 1'b0;
    end
end

Gowin_SDPB ECHO_BRAM(
        .dout(echo_data1), //output [15:0] dout
        .clka(clk), //input clka
        .cea(1'b1), //input cea
        .clkb(clk), //input clkb
        .ceb(1'b1), //input ceb
        .oce(1'b1), //input oce
        .reset(~rst), //input reset
        .ada(now_ptr), //input [14:0] ada
        .din(din), //input [15:0] din
        .adb(echo_ptr1) //input [14:0] adb
    );

assign dout = (echo_switch)?dout_temp:din;
assign dataout_valid = (echo_switch)?dataout_valid_temp:datain_valid;

endmodule