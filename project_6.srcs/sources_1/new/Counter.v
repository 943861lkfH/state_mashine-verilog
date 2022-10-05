`timescale 1ns / 1ps

module Counter # (mod = 4)(
    input clk,
    input rst,
    input ce,
    output wire [3:0] f);
    
reg [3:0] cnt;

initial
begin
    cnt = 0;
end
    
assign f = cnt;
    
always@(posedge clk)
begin
    if (rst)
        cnt = 1'b0;
    
    else if (ce)
        cnt = (cnt + 1)%mod;
        /*
        if (cnt != mod-1)
            cnt = cnt + 1;
        */
end

endmodule
