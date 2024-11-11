module Reverb
(  
    input wire clk,  
    input wire rst_n,  
    input wire [15:0] audio_in,  
    input datain_valid,
    input [2:0] a,
    input reverb_switch,
    output wire [15:0] audio_out,
    output wire dataout_valid
);   

    reg [15:0] y_out_temp;
    reg dataout_valid_temp;
  
    // Shift register to store past output values  
    reg [15:0] y_shift_reg [0:9];  
  
    // Index to manage shift registers  
    integer i;  
  
    always @(posedge clk or negedge rst_n) begin  
        if (!rst_n) begin  
            // Reset shift registers  
            for (i = 0; i < 10; i = i + 1) begin  
                y_shift_reg[i] <= 16'd0;  
            end  
            y_out_temp <= 16'd0;  
            dataout_valid_temp <= 1'b0;
        end else if(datain_valid) begin  
            // Shift values in shift register  
            for (i = 9; i > 0; i = i - 1) begin  
                y_shift_reg[i] <= y_shift_reg[i-1];  
            end  
  
            // Load new output based on current input and delayed output  
            y_shift_reg[0] <= $signed(audio_in) + ($signed(y_shift_reg[9]) >>> a);
  
            // Compute output using the filter equation  
            y_out_temp <= $signed(audio_in) + ($signed(y_shift_reg[9]) >>> a);
            dataout_valid_temp <= 1'b1;
        end else begin
            dataout_valid_temp <= 1'b0;
        end
    end  
  
    assign audio_out = (reverb_switch) ? y_out_temp : audio_in;
    assign dataout_valid = (reverb_switch) ? dataout_valid_temp : datain_valid;

endmodule


//module Reverb
//(  
//    input wire clk,  
//    input wire rst_n,  
//    input wire [15:0] audio_in,  
//    input datain_valid,
//    input [1:0] a,
//    input reverb_switch,
//    output wire [15:0] audio_out,
//    output wire dataout_valid
//);   

//    reg [15:0] y_out_temp;
//    reg dataout_valid_temp;
//  
//     Shift registers to store past input and output values  
//    reg [15:0] x_shift_reg [0:9];  
//    reg [15:0] y_shift_reg [0:9];  
//  
//     Index to manage shift registers  
//    integer i;  
//  
//    always @(posedge clk or negedge rst_n) begin  
//        if (!rst_n) begin  
//             Reset shift registers  
//            for (i = 0; i < 10; i = i + 1) begin  
//                x_shift_reg[i] <= 0;  
//                y_shift_reg[i] <= 0;  
//            end  
//            y_out_temp <= 0;  
//        end else if(datain_valid) begin  
//             Shift values in shift registers  
//            for (i = 9; i > 0; i = i - 1) begin  
//                x_shift_reg[i] <= x_shift_reg[i-1];  
//                y_shift_reg[i] <= y_shift_reg[i-1];  
//            end  
//  
//            Load new input into the first_n position of the shift register  
//            x_shift_reg[0] <= audio_in;  
//            y_shift_reg[0] <= $signed(x_shift_reg[9]) + $signed(y_shift_reg[9])>>>a;
//  
//            Compute output using the filter equation  
//            y_out_temp <= $signed(x_shift_reg[9]) + $signed(y_shift_reg[9])>>>a;

//            dataout_valid_temp <= 1'b1;
//        end else begin
//            dataout_valid_temp <= 1'b0;
//        end
//    end  
//  
//assign audio_out = (reverb_switch)?y_out_temp:audio_in;
//assign dataout_valid = (reverb_switch)?dataout_valid_temp:datain_valid;

//endmodule

//module Reverb (
//    input wire clk,               // 时钟信号
//    input wire rst_n,             // 复位信号
//    input wire [15:0] audio_in,   // 输入音频信号（16-bit，带符号）
//    input wire datain_valid,      // 输入数据有效信号
//    output wire [15:0] audio_out, // 输出音频信号（16-bit，带符号）
//    input wire reverb_switch,     // 混响开关，用于启用/禁用混响效果
//    input wire [1:0] a,           // 控制反馈系数的参数（例如，控制混响衰减）
//    output wire dataout_valid     // 输出数据有效信号
//);

//    reg [15:0] audio_out_temp;        // 临时输出信号（带混响）
//    reg dataout_valid_temp;           // 临时数据有效标志
//    reg [15:0] prev_outputs[0:9];     // 存储过去 10 个时刻的输出信号

//    integer i;

//     初始化输出寄存器
//    always @(posedge clk or negedge rst_n) begin
//        if (~rst_n) begin
 //            复位时将所有延迟寄存器清零
//            for (i = 0; i < 10; i = i + 1) begin
//                prev_outputs[i] <= 16'd0;
//            end
//            audio_out_temp <= 16'd0;   // 输出初始化为0
//            dataout_valid_temp <= 1'b0;
//        end else if (datain_valid) begin
 //            计算当前输出信号，输入信号与10个时刻前的输出信号加权混合
 //            使用符号扩展和右移操作
//            audio_out_temp <= audio_in + ($signed(prev_outputs[9]) >>> a);  // y[n] = x[n] + alpha * y[n-10]
//            dataout_valid_temp <= 1'b1;  // 数据有效
 //            更新延迟寄存器
//            for (i = 9; i > 0; i = i - 1) begin
//                prev_outputs[i] <= prev_outputs[i-1];  // 将输出信号向右移动
//            end
//            prev_outputs[0] <= audio_out_temp;  // 将当前输出存入 prev_outputs[0]
//        end else begin
//            dataout_valid_temp <= 1'b0;  // 输入无效时，输出无效标志
//        end
//    end

//     输出信号和有效信号的选择
//    assign audio_out = (reverb_switch) ? audio_out_temp : audio_in;
//    assign dataout_valid = (reverb_switch) ? dataout_valid_temp : datain_valid;

//endmodule
//module Reverb (
//    input wire clk,
//    input wire rst_n,
//    input wire [15:0] audio_in,
//    input wire datain_valid,
//    output wire [15:0] audio_out,
//    input wire reverb_switch,
//    input wire [3:0] a,  // 控制反馈系数
//    output wire dataout_valid
//);

//    reg [15:0] audio_out_temp;
//    reg dataout_valid_temp;
//    reg [15:0] prev_outputs[0:9];

//    integer i;

//    always @(posedge clk or negedge rst_n) begin
//        if (~rst_n) begin
//            for (i = 0; i < 10; i = i + 1) begin
//                prev_outputs[i] <= 16'd0;
//            end
//            audio_out_temp <= 16'd0;
//            dataout_valid_temp <= 1'b0;
//        end else if (datain_valid && reverb_switch) begin
            // 混响计算
//            audio_out_temp <= audio_in + (prev_outputs[9] * a) >> 4; // 控制反馈
//            dataout_valid_temp <= 1'b1;

//            for (i = 9; i > 0; i = i - 1) begin
//                prev_outputs[i] <= prev_outputs[i-1];
//            end
//            prev_outputs[0] <= audio_out_temp;
//        end else if (!datain_valid) begin
//            dataout_valid_temp <= 1'b0;
//        end
//    end

//    assign audio_out = (reverb_switch) ? audio_out_temp : audio_in;
//    assign dataout_valid = (reverb_switch) ? dataout_valid_temp : datain_valid;

//endmodule
 

