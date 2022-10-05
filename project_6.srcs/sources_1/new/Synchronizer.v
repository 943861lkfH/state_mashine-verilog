`timescale 1ns / 1ps

module Synchronizer(
    input clk,
    input in,
    output out);
    
wire w1;
    
D_trigger D1(.clk(clk), .d(in), .en(1), .q(w1));
D_trigger D2(.clk(clk), .d(w1), .en(1), .q(out));

endmodule
