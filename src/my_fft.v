module my_fft(
    input                        fft_clk,
	input                        rst_n,
    input [15:0] datain,
//    input sample_clk,
    output reg [8*16-1:0] fftout
);

wire sod,ipd,eod,busy,soud,eoud;
wire [11:0] idx;
wire [15:0] xk_re;wire [15:0] xk_im;
FFT_Top fft_u1(
		.idx(idx), //output [11:0] idx
		.xk_re(xk_re), //output [15:0] xk_re
		.xk_im(xk_im), //output [15:0] xk_im
		.sod(sod), //output sod 高电平表示下个周期开始采样
		.ipd(ipd), //output ipd 高电平表示正在采样输入数据
		.eod(eod), //output eod 高电平表示数据输入完成
		.busy(busy), //output busy 表示在进行变换计算
		.soud(soud), //output soud 高电平表示输出数据第一个数据
		.opd(opd), //output opd 输出数据有效
		.eoud(eoud), //output eoud 高电平表示数据卸载完成
		.xn_re(datain), //input [15:0] xn_re
		.xn_im(16'd0), //input [15:0] xn_im
		.start(1'b1), //input start
		.clk(fft_clk), //input clk
		.rst(rst_n) //input rst
	);

//reg start;
//always @(posedge sys_clk or negedge rst_n) begin
//    if(!rst_n)
//        start<=0;
//    else if((!busy)&&eoud)
//        start<=1;
//    else if(sod)
//        start<=0; else;
//end

//wire fft_clk = (ipd)?sample_clk:sys_clk;
always@(posedge fft_clk or negedge rst_n) begin
    if(!rst_n)
        fftout<=128'd0;
    else if(opd)
        if(idx < 512)
            fftout[15:0] <= (xk_re>fftout[15:0])?xk_re:fftout[15:0];
        else if(idx < 1024)
            fftout[31:16] <= (xk_re>fftout[31:16])?xk_re:fftout[31:16];
        else if(idx < 1536)
            fftout[47:32] <= (xk_re>fftout[47:32])?xk_re:fftout[47:32];
        else if(idx < 2048)
            fftout[63:48] <= (xk_re>fftout[63:48])?xk_re:fftout[63:48];
        else if(idx < 2560)
            fftout[79:64] <= (xk_re>fftout[79:64])?xk_re:fftout[79:64];
        else if(idx < 3072)
            fftout[95:80] <= (xk_re>fftout[95:80])?xk_re:fftout[95:80];
        else if(idx < 3584)
            fftout[111:96] <= (xk_re>fftout[111:96])?xk_re:fftout[111:96];
        else 
            fftout[127:112] <= (xk_re>fftout[127:112])?xk_re:fftout[127:112];

end

endmodule