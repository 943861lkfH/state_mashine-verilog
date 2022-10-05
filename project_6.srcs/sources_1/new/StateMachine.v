`timescale 1ns / 1ps

module StateMachine (input clk, input wire [1:0] a, output reg [3:0] state, reg [15:0] value);
reg n, m;
initial
begin
    state = 4'd0;
    value = 16'h3590;
end
always@(posedge clk)
begin
n=a[0];
m=a[1];
    case (state)
    4'd0: begin 
        state <= 4'd1;
        value <= 16'h4171;
    end
    4'd1: begin
        if(m) begin
            state <= 4'd3;
            value <= 16'h5147;
            end
        else begin
            state <= 4'd2;
            value <= 16'h4292;
            end
    end
    4'd2: begin
        if(m) begin
            state <= 4'd4;
            value <= 16'h4324;
            end
        else begin
            if (n) begin
                state <= 4'd5;
                value <= 16'h4163;
                end
            else begin
                state <= 4'd2;
                value <= 16'h4292;
                end
        end
    end
    4'd3: begin
        if(~m) begin
            state <= 4'd3;
            value <= 16'h5147;
            end
        else begin
            if (n) begin
                state <= 4'd5;
                value <= 16'h4163;
                end
            else begin
                state <= 4'd6;
                value <= 16'h6320;
                end
        end
    end
    4'd4: begin
        if(~m) begin
            state <= 4'd4;
            value <= 16'h4324;
            end
        else begin
            state <= 4'd5;
            value <= 16'h4163;
            end
    end
    4'd5: begin
        if(~m) begin
            state <= 4'd7;
            value <= 16'h8483;
            end
        else begin
            state <= 4'd8;
            value <= 16'h5672;
            end
    end
    4'd6: begin
        if(n) begin
            state <= 4'd5;
            value <= 16'h4163;
            end
        else begin
            if (m) begin
                state <= 4'd6;
                value <= 16'h6320;
                end
            else begin
                state <= 4'd10;
                value <= 16'h809;
                end
        end
    end
    4'd7: begin
        if(~m) begin
            state <= 4'd8;
            value <= 16'h5672;
            end
        else begin
            state <= 4'd2;
            value <= 16'h4292;
            end
    end
    4'd8: begin
        if(~m) begin
            state <= 4'd9;
            value <= 16'h8789;
            end
        else begin
            if (n) begin
                state <= 4'd6;
                value <= 16'h6320;
                end
            else begin
                state <= 4'd10;
                value <= 16'h809;
                end
        end
    end
    4'd9: begin
        state <= 4'd7;
        value <= 16'h8483;
    end
    4'd10: begin
        state <= 4'd0;
        value = 16'h3590;
    end
    default: state <= state;
    endcase
end
endmodule