`timescale 1ns / 1ps
module Module(
        input clk,
        input btn_c, // утсановка значений
        input btn_u, // ресет
        input [1:0] SW, // 5,4 за параметр для автомта, то шо на индикатор
        
        output reg [7:0] ANODES, // аноды
        output reg [7:0] SEG//, // катоды
        //output reg [15:0] out_value_prev,
        //output reg [15:0] out_value_temp,
        //output reg n_clk,
        //output reg [3:0] out_state
    );
    
    reg[31:0] memory; // регистр памяти
    wire[7:0] CATHODES; // катоды
    
    reg [1:0] for_a;
    
    initial begin
        memory = 32'b0; // установка мусора в память
        ANODES = ~1'b1; // установка 1
        for_a = 2'b00;
        SEG = ~8'b0; // включаем 
    end
    
    wire new_clk; // делитель нужен щобы цифры видно было
    Div_clk div(.clk(clk), .new_clk(new_clk));
    
    wire[3:0] state; // знач со счетчика для выбора сегментов
    
    wire reset_signal_enable;
    wire reset_signal;
    
    Counter #(.mod(9)) ctr(.clk(new_clk), .ce(1'b1), .rst(reset_signal_enable), .f(state));
    reg CLOCK_ENABLE = 0;
    
    Indicator indicator(.clk(new_clk), .SWITCHER(memory[((state+1)*4-1)-:4]), .SEG(CATHODES));
    
    wire set_signal;
    wire set_signal_enable;
    Contact_bounce_destroyer but_set(.ce(CLOCK_ENABLE), .clk(new_clk), .in_signal(btn_c), .OUT_SIGNAL(set_signal), .OUT_SIGNAL_ENABLE(set_signal_enable));
    
    Contact_bounce_destroyer but_reset(.ce(CLOCK_ENABLE), .clk(new_clk), .in_signal(btn_u), .OUT_SIGNAL(reset_signal), .OUT_SIGNAL_ENABLE(reset_signal_enable));
    
    //для 10 лабы
    
    wire [15:0] out_value;
    wire [3:0] out_state;
    
    StateMachine st_machine(.clk(set_signal_enable), .a(for_a), .value(out_value), .state(out_state));
    
    always@ (posedge new_clk) begin
        CLOCK_ENABLE <= ~CLOCK_ENABLE;
        ANODES <= ~(1'd1 << (state-1));
        SEG <= CATHODES;
        if (set_signal_enable == 1) begin
            memory <= {memory[15:0], out_value[15:0]};
            //memory <= memory << 16;
        end
        if (reset_signal_enable == 1) begin
            for_a<=SW[1:0];
        end
     end
       
    /*always @(posedge btn_u) begin
        //for_a<=SW[1:0];
    end
    always @(posedge clk)begin
        n_clk = new_clk;
        end
        
    always @(posedge btn_c) begin
        out_value_prev = memory[31:16];
        out_value_temp = memory[15:0];
    end*/
        
endmodule
