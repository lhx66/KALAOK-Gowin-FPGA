module fir_top (
    input                rstn,  // 复位，低有效
    input                clk,   // 工作频率，即采样频率
    input                en,    // 输入数据有效信号
    input       [15:0]   xin,   // 输入混合频率的信号数据，位宽改为16位
    output               valid, // 输出数据有效信号
    output      [31:0]   yout   // 输出数据，低频信号，位宽改为32位
);

    // 数据使能延迟
    reg [3:0]            en_r;
    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            en_r[3:0]      <= 'b0;
        end else begin
            en_r[3:0]      <= {en_r[2:0], en};
        end
    end

    // 16组移位寄存器
    reg [15:0]           xin_reg[15:0];
    reg [3:0]            i, j;
    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            for (i = 0; i < 15; i = i + 1) begin
                xin_reg[i]  <= 16'b0;
            end
        end else if (en) begin
            xin_reg[0] <= xin;
            for (j = 0; j < 15; j = j + 1) begin
                xin_reg[j + 1] <= xin_reg[j]; // 周期性移位操作
            end
        end
    end

    // 系数对称，16个移位寄存器数据进行首尾相加
    reg signed [15:0]           add_reg[7:0];
    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            for (i = 0; i < 8; i = i + 1) begin
                add_reg[i] <= 16'd0;
            end
        end else if (en_r[0]) begin
            for (i = 0; i < 8; i = i + 1) begin
                add_reg[i] <= xin_reg[i] + xin_reg[15 - i];
            end
        end
    end

    // 8个乘法器，滤波器系数改为12位
    wire  signed [9:0]    coe[7:0];
    assign coe[0]        = 10'sd8;
    assign coe[1]        = -10'sd37;
    assign coe[2]        = 10'sd64;
    assign coe[3]        = -10'sd57;
    assign coe[4]        = -10'sd12;
    assign coe[5]        = 10'd145;
    assign coe[6]        = -10'd309;
    assign coe[7]        = 10'd445;
    reg   signed    [23:0]     mout[7:0];

    `ifdef SAFE_DESIGN
        // 流水线式乘法器
        wire [7:0]          valid_mult;
        genvar              k;
        generate
            for (k = 0; k < 8; k = k + 1) begin
                mult_man #(16, 12)
                u_mult_paral (
                    .clk        (clk),
                    .rstn       (rstn),
                    .data_rdy   (en_r[1]),
                    .mult1      (add_reg[k]),
                    .mult2      (coe[k]),
                    .res_rdy    (valid_mult[k]), // 所有输出使能完全一致
                    .res        (mout[k])
                );
            end
        endgenerate
        wire valid_mult7     = valid_mult[7];

    `else
        // 如果对时序要求不高，可以直接用乘号
        always @(posedge clk or negedge rstn) begin
            if (!rstn) begin
                for (i = 0; i < 8; i = i + 1) begin
                    mout[i]     <= 24'b0;
                end
            end else if (en_r[1]) begin
                for (i = 0; i < 8; i = i + 1) begin
                    mout[i]     <= coe[i] * add_reg[i];
                end
            end
        end
        wire valid_mult7 = en_r[2];
    `endif

    // 积分累加，8组24bit数据 -> 1组32bit数据
    reg [3:0]            valid_mult_r;
    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            valid_mult_r[3:0]  <= 'b0;
        end else begin
            valid_mult_r[3:0]  <= {valid_mult_r[2:0], valid_mult7};
        end
    end

    `ifdef SAFE_DESIGN
        // 加法运算时，分多个周期进行流水，优化时序
        reg        [31:0]   sum1;
        reg        [31:0]   sum2;
        reg        [31:0]   yout_t;
        always @(posedge clk or negedge rstn) begin
            if (!rstn) begin
                sum1   <= 32'd0;
                sum2   <= 32'd0;
                yout_t <= 32'd0;
            end else if (valid_mult7) begin
                sum1   <= mout[0] + mout[1] + mout[2] + mout[3];
                sum2   <= mout[4] + mout[5] + mout[6] + mout[7];
                yout_t <= sum1 + sum2;
            end
        end

    `else
        // 一步计算累加结果，但是实际中时序非常危险
        reg signed [31:0]   sum;
        reg signed [31:0]   yout_t;
        always @(posedge clk or negedge rstn) begin
            if (!rstn) begin
                sum    <= 32'd0;
                yout_t <= 32'd0;
            end else if (valid_mult7) begin
                sum    <= mout[0] + mout[1] + mout[2] + mout[3] + mout[4] + mout[5] + mout[6] + mout[7];
                yout_t <= sum;
            end
        end
    `endif
    assign yout  = yout_t;
    assign valid = valid_mult_r[0];

endmodule

