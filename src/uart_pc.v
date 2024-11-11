/*
module uart_pc(
	input                        clk,
	input                        rst_n,
	input                        uart_rx,
	output                       uart_tx,
    input  [15:0]                 tx_data,
    input  tx_data_valid,
    output reg                             rx_data_valid,
    output reg [15:0]                        rx_data
);

parameter                        CLK_FRE  = 50;//Mhz
parameter                        UART_FRE = 2_000_000;//Mhz
//parameter                        DATA_NUM = 16;
//localparam                       IDLE =  0;
//localparam                       SEND =  1;   //send 
//localparam                       WAIT =  2;   //wait 1 second and send uart received data
//reg[7:0]                         tx_data;
//reg[7:0]                         tx_str;
//reg                              tx_data_valid;
wire                             tx_data_ready;
//reg[7:0]                         tx_cnt;
wire                             rx_data_ready;
//reg[7:0]                         rx_cnt;
//reg[31:0]                        wait_cnt;
//reg[3:0]                         state;

assign rx_data_ready = 1'b1;//always can receive data,

reg cnt1;
reg [7:0] tx_data_temp;
reg tx_data_valid_temp;
reg [15:0] tx_data_fifo;
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        cnt1<=0;
    end
    else if(tx_data_ready && tx_data_valid && cnt1==0) begin
        cnt1<=!cnt1;
        tx_data_temp<=tx_data[15:8];
        tx_data_fifo<=tx_data;
        tx_data_valid_temp<=1'b1;
    end
    else if(tx_data_ready && cnt1==1) begin
        cnt1<=!cnt1;
        tx_data_temp<=tx_data_fifo[7:0];
        tx_data_valid_temp<=1'b1;
    end
    else 
        tx_data_valid_temp<=1'b0;
end

reg cnt2;
wire [7:0] rx_data_temp;
wire rx_data_valid_temp;
always@(posedge clk or negedge rst_n) begin
    if(!rst_n)
        cnt2<=1;
    else if(rx_data_valid_temp) begin
        cnt2<=!cnt2;
        if(cnt2) begin
            rx_data_valid<=1'b0;
            rx_data[15:8]<=rx_data_temp;
        end
        else begin
            rx_data_valid<=1'b1;
            rx_data[7:0]<=rx_data_temp;
        end
    end
    else rx_data_valid<=1'b0;
end

uart_rx#
(
	.CLK_FRE(CLK_FRE),
	.BAUD_RATE(UART_FRE)
) uart_rx_inst
(
	.clk                        (clk                      ),
	.rst_n                      (rst_n                    ),
	.rx_data                    (rx_data_temp                  ),
	.rx_data_valid              (rx_data_valid_temp            ),
	.rx_data_ready              (rx_data_ready            ),
	.rx_pin                     (uart_rx                  )
);

uart_tx#
(
	.CLK_FRE(CLK_FRE),
	.BAUD_RATE(UART_FRE)
) uart_tx_inst
(
	.clk                        (clk                      ),
	.rst_n                      (rst_n                    ),
	.tx_data                    (tx_data_temp                  ),
	.tx_data_valid              (tx_data_valid_temp            ),
	.tx_data_ready              (tx_data_ready            ),
	.tx_pin                     (uart_tx                  )
);
endmodule
*/

module uart_pc(
    input                       clk,
    input                       rst_n,
    input                       uart_rx,
    output                      uart_tx,
    input [15:0]                tx_data,
    input                       tx_data_valid,
    output reg                  rx_data_valid,
    output reg [15:0]           rx_data
);

parameter CLK_FRE = 50;      // 时钟频率，50MHz
parameter UART_FRE = 2_000_000; // 波特率，2M

// UART发送接收状态机的控制信号
reg cnt1;                     // 计数器，用于发送数据的控制
reg [7:0] tx_data_temp;       // 发送数据缓冲
reg tx_data_valid_temp;       // 发送数据有效标志
reg [15:0] tx_data_fifo;      // 数据FIFO，存储16bit数据

// 发送数据逻辑
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        cnt1 <= 0;
    end else if (tx_data_valid && !cnt1) begin
        // 发送高8位
        tx_data_temp <= tx_data[15:8];
        tx_data_fifo <= tx_data;
        tx_data_valid_temp <= 1'b1;
        cnt1 <= 1;
    end else if (tx_data_valid && cnt1) begin
        // 发送低8位
        tx_data_temp <= tx_data_fifo[7:0];
        tx_data_valid_temp <= 1'b1;
        cnt1 <= 0;
    end else begin
        tx_data_valid_temp <= 1'b0;
    end
end

// UART接收状态控制
reg cnt2;                     // 计数器，用于接收数据的控制
wire [7:0] rx_data_temp;      // 接收缓冲区
wire rx_data_valid_temp;      // 接收数据有效标志

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        cnt2 <= 1'b1;
        rx_data_valid <= 1'b0;
    end else if (rx_data_valid_temp) begin
        cnt2 <= !cnt2;
        if (cnt2) begin
            // 接收高8位
            rx_data[15:8] <= rx_data_temp;
        end else begin
            // 接收低8位
            rx_data[7:0] <= rx_data_temp;
            rx_data_valid <= 1'b1; // 完整接收16位数据
        end
    end else begin
        rx_data_valid <= 1'b0;
    end
end

// UART 接收模块实例化
uart_rx #
(
    .CLK_FRE(CLK_FRE),
    .BAUD_RATE(UART_FRE)
) uart_rx_inst
(
    .clk           (clk),
    .rst_n         (rst_n),
    .rx_data       (rx_data_temp),
    .rx_data_valid (rx_data_valid_temp),
    .rx_data_ready (1'b1),  // 始终准备接收数据
    .rx_pin        (uart_rx)
);

// UART 发送模块实例化
uart_tx #
(
    .CLK_FRE(CLK_FRE),
    .BAUD_RATE(UART_FRE)
) uart_tx_inst
(
    .clk           (clk),
    .rst_n         (rst_n),
    .tx_data       (tx_data_temp),
    .tx_data_valid (tx_data_valid_temp),
    .tx_data_ready (tx_data_ready),
    .tx_pin        (uart_tx)
);

endmodule
