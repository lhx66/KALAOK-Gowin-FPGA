module top(
	input                        sys_clk,//27MHz 20k
	input                        rst_n,
//sd card port
    output                      sd_clk,
    inout                       sd_cmd,
    input                       sd_dat0,
    output                      sd_dat1,
    output                      sd_dat2,
    output                      sd_dat3,
//uart port
    input                        uart_rx,
	output                       uart_tx,
//uart to PC
    input                        uart_rx_PC,
	output                       uart_tx_PC,
//wm8960 port
    inout iic_0_scl,              
	inout iic_0_sda,   
	input I2S_ADCDAT,
	input I2S_ADCLRC,
	input I2S_BCLK,
	output I2S_DACDAT,
	input I2S_DACLRC,  
	output I2S_MCLK
);

parameter                       CLK_FRE  = 50;//Mhz
parameter                       DATA_NUM = 16;
parameter                       DATA_WIDTH = 32;
localparam                      START = 0;
localparam                      READ  = 1;
localparam                      OK    = 2;
localparam                      PAUSE = 3;

reg [1:0]                        sd_reader_state;
reg [DATA_NUM * 8 - 1:0]         send_data;

wire [7:0]                       cd_stat;
wire [7:0]                       cd_type;
wire [7:0] filesystem_type;
//wire [7:0] file_found;
wire [7:0] filesystem_state;
wire        sd_sec_read;
wire        sd_sec_read_end;
wire        wav_data_wr_en;


wire          sd_outen;
wire [ 7:0]   sd_outbyte;
reg  sd_go;
wire [31:0]        sd_sec_read_addr;
wire [7:0] wav_data;


reg [15:0] fifo_datain; //输入到fifo中的数据
wire [15:0] fifo_dataout;
reg cnt1;
wire Almost_Empty_o;

reg adcfifo_read;
wire [DATA_WIDTH - 1:0] adcfifo_readdata;
wire adcfifo_empty;

reg dacfifo_write;
reg [DATA_WIDTH - 1:0] dacfifo_writedata;
wire dacfifo_full;

assign sd_dat1 = 1'b1;
assign sd_dat2 = 1'b1;
assign sd_dat3 = 1'b1;

//sd卡状态机
//always@(negedge sd_clk or negedge rst_n)
//begin
//    if(~rst_n)begin
//        sd_reader_state <= START;
//    end
//    else begin
//        case(sd_reader_state)
//            START:begin
//                if(sd_outen == 1'b1)
//                    sd_reader_state <= READ;
//            end
//            READ:begin
//                if(sd_outen == 1'b1)
//                    sd_reader_state <= READ;
//                else
//                    sd_reader_state <= PAUSE;
//            end
//            PAUSE:begin
//                if(sd_outen == 1'b1)
//                    sd_reader_state <= READ;
//                else
//                    sd_reader_state <= PAUSE;
//            end

//            default:
//                sd_reader_state <= START;

//        endcase
//    end
//end

sd_reader # (
    .CLK_DIV(3'd2),
    .SIMULATE(0)
) sd_reader_u1(
    .rstn(rst_n),
    .clk(sys_clk),
    .sdclk(sd_clk),
    .sdcmd(sd_cmd),
    .sddat0( sd_dat0       ),   
    .card_stat( cd_stat ),         // show the sdcard initialize status

    .rstart(sd_sec_read ), 
    .rsector(sd_sec_read_addr),
    .rbusy(),
    .rdone(sd_sec_read_end),
    // sector data output interface (sync with clk)
    .outen(sd_outen),             // when outen=1, a byte of sector content is read out from outbyte
    .outaddr(),           // outaddr from 0 to 511, because the sector size is 512
    .outbyte(sd_outbyte)            // a byte of sector content
);

//wav read
wav_read wav_read_m0(
	.clk                       (sys_clk                        ),
	.rst                       (~rst_n                     ),
	.ready                     (                           ),
	.find                      (1'b1             ),
	.sd_init_done              (1'b1    ),
	.state_code                (                 ),
	.sd_sec_read               (sd_sec_read                ),
	.sd_sec_read_addr          (sd_sec_read_addr           ),
	.sd_sec_read_data          (sd_outbyte           ),
	.sd_sec_read_data_valid    (sd_outen                ),
	.sd_sec_read_end           (sd_sec_read_end            ),
	.fifo_al_empty             (Almost_Empty_o                    ),
	.wav_data_wr_en            (wav_data_wr_en             ),
	.wav_data                  (wav_data                   )
);

//sd to fifo
always@(posedge sys_clk or negedge rst_n) begin
    if(!rst_n) begin
        fifo_datain <= 16'd0;
        cnt1 <= 1'b0;
    end
    else if(wav_data_wr_en) begin
        if(cnt1 == 1'b0) begin
            fifo_datain[7:0] <= wav_data;
            cnt1 <=  ~cnt1;
        end
        else if(cnt1 == 1'b1) begin
            fifo_datain[15:8] <= wav_data;
            cnt1 <= ~cnt1;
        end else;
    end
    else begin
        {fifo_datain,cnt1} <= {fifo_datain,cnt1};
    end
end

sd2fifo sd2fifo_u1(
		.Data(fifo_datain), //input [15:0] Data
		.WrClk(cnt1), //input WrClk
		.RdClk(~dacfifo_full && (~adcfifo_empty)), //input RdClk
		.WrEn(1'b1), //input WrEn
		.RdEn(1'b1), //input RdEn
		.Almost_Empty(Almost_Empty_o), //output Almost_Empty
		.Q(fifo_dataout), //output [15:0] Q
		.Empty(), //output Empty
		.Full() //output Full
	);



Gowin_PLL clk_12MHz_gen(
        .clkout0(I2S_MCLK), //output clkout
        .clkin(sys_clk) //input clkin
    );

//wm8960
wire Init_Done;
WM8960_Init WM8960_Init(
    .Clk(sys_clk),
    .Rst_n(rst_n),
    .I2C_Init_Done(Init_Done),
    .i2c_sclk(iic_0_scl),
    .i2c_sdat(iic_0_sda)
);


always @ (posedge sys_clk or negedge rst_n)
	begin
		if (~rst_n)
		begin
			adcfifo_read <= 1'b0;
		end
		else if (~adcfifo_empty)
		begin
			adcfifo_read <= 1'b1;
		end
		else
		begin
			adcfifo_read <= 1'b0;
		end
	end

//声音合成
wire [15:0] dac_data;
assign dac_data = $signed(fifo_dataout) + $signed(adcfifo_readdata<<<3);
//assign dac_data = $signed(adcfifo_readdata<<<7);
//assign dac_data = $signed(adcfifo_readdata<<<3);

//datavalid
reg adclrc_r0;
reg adclrc_r1;
always @(posedge sys_clk) begin
    adclrc_r0 <= I2S_ADCLRC;
    adclrc_r1 <= adclrc_r0;
end
wire datain_valid = (~adclrc_r1) && adclrc_r0;

//添加回声
reg [7:0] relay1;//回声(s)*100
reg [7:0] echo_gain1;
wire [15:0] echo_data1;
wire echo_valid;
reg echo_switch;
my_echo my_echo_u1(
    .clk(sys_clk),
    .rst(rst_n),
    .din(dac_data),
    .datain_valid(datain_valid),
    .relay1(relay1),
    .echo_gain1(echo_gain1[1:0]),
    .echo_switch(echo_switch),
    .dout(echo_data1),
    .dataout_valid(echo_valid)
);

//添加混响
wire [15:0] reverb_data;
wire reverb_data_valid;
reg [2:0] drya;//干湿分离度 
reg reverb_switch;
Reverb reverb_u1 (  
    .clk(sys_clk),  
    .rst_n(rst_n),  
    .a(drya),
    .audio_in(echo_data1),  
    .datain_valid(echo_valid),
    .reverb_switch(reverb_switch),
    .audio_out(reverb_data),
    .dataout_valid(reverb_data_valid)
);   

//均衡器
reg [79:0] all_gain; 
wire out_valid;
wire [18:0] dout;
reg [15:0] sound_data;
reg gain_change;
reg eq_switch;
wire [7:0] eq_debug;
my_eq my_eq_u1(
    .clk(sys_clk),
    .rst(rst_n),
    .ce(1'b1),
    .datain_valid(reverb_data_valid),//可能要在暂停键用
    .din(reverb_data),
    .allgain(all_gain),
    .gain_change(gain_change),
    .eq_switch(eq_switch),
    .out_valid(out_valid),
    .dout(dout),
    .in_ready(),
    .eq_debug(eq_debug)
);

//FIR滤波
wire fir_valid_o;
wire [31:0] fir_data_o;
//Advanced_FIR_Filter_Top FIR_Lowpass(
//		.clk(sys_clk), //input clk
//		.rstn(rst_n), //input rstn
//		.fir_rfi_o(), //output fir_rfi_o  ready to input
//		.fir_valid_i(out_valid), //input fir_valid_i
//		.fir_sync_i(out_valid), //input fir_sync_i
//		.fir_data_i(dout[18:3]), //input [15:0] fir_data_i
//		.fir_valid_o(fir_valid_o), //output fir_valid_o
//		.fir_sync_o(), //output fir_sync_o
//		.fir_data_o(fir_data_o) //output [15:0] fir_data_o
//	);
fir_inst FIR_Lowpass(
        .clk(sys_clk),
        .rst(~rst_n),
        .data_in_vld(out_valid),
        .data_in(dout[15:0]),
        .data_out(fir_data_o),
        .data_out_vld(fir_valid_o)
    );

reg [3:0] factor;
wire [15:0] interleaver_data;
wire interleaver_valid;
interleaver interleaver_u1(
	.clk(sys_clk),
	.rst_n(rst_n),
	.datain(fir_data_o[26:11]),
    .datain_valid(fir_valid_o),
    .factor(factor),
    .dataout(interleaver_data),
    .dataout_valid(interleaver_valid)
);

always @(posedge sys_clk or negedge rst_n) begin //这里调输出
    if(!rst_n) 
        sound_data <= 0;
    else if(interleaver_valid)
//    else if(out_valid)
        sound_data <= interleaver_data;
//        sound_data <= reverb_data;
//        sound_data <= dout[15:0];
    else;
end

//dac输出
always @ (posedge sys_clk or negedge rst_n)
begin
    if(~rst_n) begin
        dacfifo_write <= 1'd0;
    end else if(~dacfifo_full && (~adcfifo_empty)) begin
        dacfifo_write <= 1'd1;
        dacfifo_writedata <= {sound_data,sound_data};   
//        dacfifo_writedata <= {echo_data1[15:0],echo_data1[15:0]};
//        dacfifo_writedata <= {dac_data[15:0],dac_data[15:0]};
    end 
    else begin
        dacfifo_write <= 1'd0;
    end
end

i2s_rx 
#(
    .DATA_WIDTH(DATA_WIDTH) 
)i2s_rx
(
    .reset_n(rst_n),
    .bclk(I2S_BCLK),
    .adclrc(I2S_ADCLRC),
    .adcdat(I2S_ADCDAT),
    .adcfifo_rdclk(sys_clk),
    .adcfifo_read(adcfifo_read),
    .adcfifo_empty(adcfifo_empty),
//    .adcdata_valid(datain_valid),
    .adcfifo_readdata(adcfifo_readdata)
);

i2s_tx
#(
     .DATA_WIDTH(DATA_WIDTH)
)i2s_tx
(
     .reset_n(rst_n),
     .dacfifo_wrclk(sys_clk),
     .dacfifo_wren(dacfifo_write),
     .dacfifo_wrdata(dacfifo_writedata),
     .dacfifo_full(dacfifo_full),
     .bclk(I2S_BCLK),
     .daclrc(I2S_DACLRC),
     .dacdat(I2S_DACDAT)
);

//fft
//wire [16*8-1:0] fftout;
//my_fft my_fft_u1(
//    .fft_clk(I2S_ADCLRC),
//	.rst_n(rst_n), 
//    .datain(sound_data),
//    .fftout(fftout)
//);

//uart to PC
uart_pc uart_pc_u1(
	.clk(sys_clk),
	.rst_n(rst_n),
	.uart_rx(uart_rx_PC),
	.uart_tx(uart_tx_PC),
    .tx_data(sound_data),
    .tx_data_valid(out_valid),
    .rx_data_valid(),
    .rx_data()
);

//uart debug
wire rx_data_valid;
wire [7:0] rx_data;
uart_test uart_debug(
	.clk(sys_clk),
	.rst_n(rst_n),
	.uart_rx(uart_rx),
	.uart_tx(uart_tx),
    .send_data(send_data),
    .rx_data_valid(rx_data_valid),
    .rx_data(rx_data)
);

//cmd parse
reg [2:0] cmd_type;
reg cmd_done;
reg [14*8-1:0] receive_data;
always @ (posedge sys_clk or negedge rst_n) begin
    if (~rst_n) begin
        all_gain <= {8'd4,8'd4,8'd4,8'd0,8'd0,8'd0,8'd0,8'd0,8'd0,8'd0};
        cmd_type <= 3'd0;
        receive_data <= 0;
        gain_change <= 0;
        relay1 <= 40;
        echo_gain1 <= 8'd2;
        drya <= 3'd3;
        eq_switch <= 0;
        echo_switch <= 0;
        reverb_switch <= 0;
        factor<=1;
    end
    else if(gain_change==1) begin
        gain_change <= 1'b0;
//        receive_data <= 0;
    end
    else  begin
        if(rx_data_valid)
            receive_data <= {receive_data[13*8-1:0], rx_data};
        else 
            case({receive_data[14*8-1:14*8-16], receive_data[15:0]}) //每次发命令都是14字节，包含两字节帧头和两字节帧尾
                32'hFEFE_0D0A:begin all_gain<=receive_data[(14*8-17):16];gain_change<=1'b1;cmd_type<=3'd4;receive_data<=0; end //均衡器。出去帧头帧尾，中间的十字节是十个频段的增益
                32'h0A0B_0D0A:begin relay1<=receive_data[23:16];echo_gain1<=receive_data[31:24];receive_data<=0;end //回声 延迟是第三个字节(以秒为单位，乘100的值，比如0.4s增益就是40。延迟最大是0.5s)，增益第四个字节(只能是0,1,2,3，对应实际增益0,0.5,0.25,0.125)
                32'h0C0D_0D0A:begin relay1<=receive_data[23:16];drya<=receive_data[31:24];receive_data<=0;end //混响 延迟第三字节，干湿分离度第四字节(同上。设为几,就相当于将声音右移几位。比如3就是0.125倍)
                32'h0B0C_0D0A:begin factor<=receive_data[23:16];receive_data<=0;end
                //音频播放、混响、回声、均衡器都有使能开关
                32'h1231_0D0A:begin eq_switch<=~eq_switch;receive_data<=0; end//均衡器开关(命令的第三个字节：01代表开,00代表关。命令一个十四个字节，其他地方补零)
                32'h1342_0D0A:begin echo_switch<=~echo_switch;receive_data<=0; end//回声开关(同上)
                32'h3132_0D0A:begin reverb_switch<=~reverb_switch;receive_data<=0; end//混响开关(同上)
                default;       
            endcase
    end
end

//wire [7:0] al_mo = Almost_Empty_o;
//wire [7:0] sdo = sd_outen;
always @(posedge sys_clk or negedge rst_n) begin
    if(!rst_n)
        send_data <= {"你好 GOWIN",16'h0d0a};
    else 
        send_data <= {relay1,echo_gain1,16'h0d0a};
//        send_data <= fftout;
end

endmodule