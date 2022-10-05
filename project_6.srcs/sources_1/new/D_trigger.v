`timescale 1ns / 1ps

module D_trigger(
    input clk,
    input d,
    input en,
    output reg q);
 
initial
begin
    q = 0;
end
    
always @(posedge clk)
begin
    if(en)
        q = d;
end

endmodule