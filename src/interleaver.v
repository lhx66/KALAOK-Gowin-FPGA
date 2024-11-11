module interleaver(
	input                        clk,
	input                        rst_n,
	input   [15:0]               datain,
    input  datain_valid,
    input  [3:0] factor,
    output reg  [15:0]      dataout,
    output reg             dataout_valid
);

reg [3:0] cnt;
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        dataout<=0;
        dataout_valid<=0;
        cnt<=0;
    end
    else if(datain_valid) begin
        if(cnt<factor-1) begin
            cnt<=cnt+1'b1;
            dataout_valid<=0;
        end
        else begin
            cnt<=0;
            dataout_valid<=1;
            dataout<=datain;
        end
    end
end

endmodule
