`timescale 1ns / 1ps
module teasst();

reg clk;
reg b_c;
reg b_u;
reg[1:0] ctrl;
wire[7:0] anodes;
wire[7:0] cathodes;
//wire [15:0] value_prev;
//wire [15:0] value_temp;
//wire new_clk;
//wire [3:0] state;
always #10 clk = ~clk;

Module my_device(.clk(clk), .btn_c(b_c), .btn_u(b_u), .SW(ctrl), .ANODES(anodes), .SEG(cathodes)/*, .out_value_prev(value_prev), .out_value_temp(value_temp), .n_clk(new_clk), .out_state(state)*/);

initial begin
//
clk = 0;
b_c = 0;
b_u = 0;
#100
//

//
ctrl =2'b00;
#100
b_c = 1;
#100
b_c = 0;
//

//
ctrl =2'b00;
b_u = 1;
#100
b_u = 0;
b_c = 1;
#100
b_c = 0;
//

//
#100
b_c = 1;
#100
b_c = 0;
//

//
ctrl =2'b01;
b_u = 1;
#100
b_u = 0;
b_c = 1;
#100
b_c = 0;
//

//
#100
b_c = 1;
#100
b_c = 0;
//

//
#100
b_c = 1;
#100
b_c = 0;
//

//
ctrl =2'b10;
b_u = 1;
#100
b_u = 0;
b_c = 1;
#100
b_c = 0;
//

//
#100
b_c = 1;
#100
b_c = 0;
//

$finish;
end

endmodule
