module chorus_effect (
    input wire clk,              // FPGA主时钟（50MHz）
    input wire rst,              // 复位信号
    input wire [15:0] audio_in, // 输入音频数据（16位）
    output wire [15:0] audio_out, // 输出音频数据（16位）
    input wire clka_i,           // RAM时钟（与FPGA时钟同步）
    output wire [15:0] dout_o,   // RAM输出
    output wire [9:0] ada_i,     // RAM写地址
    input wire cea_i,            // RAM使能信号
    input wire oce_i,            // RAM输出使能
    output wire [15:0] din_i,    // RAM输入
    output wire [9:0] adb_i,     // RAM读地址
    input wire reset_i           // RAM重置信号
);

    // 参数设置
    parameter DELAY_LENGTH = 1024;  // 延迟长度
    parameter MODULATION_DEPTH = 8; // 调制深度（可调）
    parameter LFO_FREQUENCY = 50;   // LFO频率（50Hz）
    parameter MAX_LFO_VALUE = 16'h0F00; // LFO最大增益值

    // 信号声明
    reg [15:0] lfo_signal;         // LFO调制信号
    reg [9:0] delay_ptr;           // 延迟缓冲区指针
    reg [9:0] write_ptr;           // 写入地址指针
    reg [9:0] read_ptr;            // 读取地址指针
    reg [15:0] lfo_up_counter;     // LFO上升计数器
    reg [15:0] lfo_down_counter;   // LFO下降计数器
    reg [15:0] lfo_phase;          // LFO信号的阶段

    // 计算延迟地址
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            delay_ptr <= 0;
        end else begin
            // 更新延迟指针（可以设置固定延迟时间）
            delay_ptr <= delay_ptr + 1;
        end
    end

    // 三角波LFO（低频振荡器）
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            lfo_up_counter <= 0;
            lfo_down_counter <= MAX_LFO_VALUE;
            lfo_signal <= 0;
        end else begin
            // 三角波生成：先上升再下降
            if (lfo_up_counter < MAX_LFO_VALUE) begin
                lfo_up_counter <= lfo_up_counter + 1;
                lfo_signal <= lfo_up_counter;
            end else if (lfo_down_counter > 0) begin
                lfo_down_counter <= lfo_down_counter - 1;
                lfo_signal <= lfo_down_counter;
            end else begin
                lfo_up_counter <= 0;
                lfo_down_counter <= MAX_LFO_VALUE;
            end
        end
    end

    // 计算RAM的写入和读取地址
    assign ada_i = write_ptr;
    assign adb_i = delay_ptr;  // 读取地址是延迟指针
    assign din_i = audio_in;   // 输入数据

    // 将音频信号存入RAM，并通过延迟读取信号
    always @(posedge clka_i or posedge rst) begin
        if (rst) begin
            write_ptr <= 0;
        end else begin
            if (cea_i) begin
                // 写入音频数据到RAM
                write_ptr <= write_ptr + 1;
            end
        end
    end

    // 输出处理：混合延迟信号与原始信号
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            audio_out <= 16'b0;
        end else begin
            // 根据LFO调节增益
            audio_out <= audio_in + (dout_o * lfo_signal >> 8);  // 适当缩放LFO值
        end
    end

    // RAM模块实例化
    chorus_ram your_instance_name (
        .dout(dout_o),            // RAM输出数据
        .clka(clka_i),            // 输入时钟（与音频同步）
        .cea(cea_i),              // RAM使能信号
        .clkb(clka_i),            // 输出时钟（与音频同步）
        .ceb(1'b0),               // 禁用读取使能（只进行读取）
        .oce(oce_i),              // 输出使能
        .reset(reset_i),          // 重置信号
        .ada(ada_i),              // 写地址
        .din(din_i),              // 写入数据
        .adb(adb_i)               // 读取地址
    );

endmodule
