`timescale 1ns / 1ps
module Div_clk(
    input clk,
    output new_clk
    );
    
    reg [11:0] cnt;
    initial cnt = 0;
    
    always@(posedge clk) begin
        cnt <= cnt + 1'b1; 
    end
    
    assign new_clk = cnt[8]; // при заливке поставить cnt[11]
endmodule
