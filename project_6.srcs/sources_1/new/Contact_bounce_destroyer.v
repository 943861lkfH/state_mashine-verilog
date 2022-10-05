`timescale 1ns / 1ps

module Contact_bounce_destroyer(
    input clk,
    input in_signal,
    input ce,
    output OUT_SIGNAL,
    output OUT_SIGNAL_ENABLE);

wire sync_out, xnor_out, and_out0, and_out1, and_out2;
wire [3:0] cnt_out;
    
Synchronizer sync(.clk(clk), .in(in_signal), .out(sync_out));
Counter #(.mod(8)) count(.clk(clk), .rst(xnor_out), .ce(ce), .f(cnt_out));
D_trigger OUT_SIGNAL_reg(.clk(clk), .d(sync_out), .en(and_out1), .q(OUT_SIGNAL));
D_trigger OUT_SIGNAL_ENABLE_reg(.clk(clk), .d(and_out2), .en(1), .q(OUT_SIGNAL_ENABLE));

assign and_out0 = cnt_out[0] && cnt_out[1] && cnt_out[2];
assign and_out1 = and_out0 && ce;
assign and_out2 = and_out1 && sync_out;
assign xnor_out = OUT_SIGNAL ~^ sync_out;

endmodule
