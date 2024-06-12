module FIFO_tb(input clk);
reg reset,WEN,REN;
reg [7:0]input_data;
wire[7:0]output_data;
wire empty,full;

initial
begin
#20 reset = 1 ; #20 ; reset = 0 ; #20 ;
WEN = 1 ; REN = 0 ; input_data = 8'b00000001 ; #100 ;
WEN = 1 ; REN = 0 ; input_data = 8'b00000011 ; #100 ;
WEN = 1 ; REN = 0 ; input_data = 8'b00000111 ; #100 ;
WEN = 1 ; REN = 0 ; input_data = 8'b00001111 ; #100 ;
WEN = 1 ; REN = 0 ; input_data = 8'b00011111 ; #100 ;
WEN = 1 ; REN = 0 ; input_data = 8'b00111111 ; #100 ;
WEN = 1 ; REN = 0 ; input_data = 8'b01111111 ; #100 ;
WEN = 1 ; REN = 0 ; input_data = 8'b11111111 ; #100 ;

WEN = 0 ; REN = 1 ; input_data = 8'b11111110 ; #100 ;
WEN = 0 ; REN = 1 ; input_data = 8'b11111110 ; #100 ;
WEN = 0 ; REN = 1 ; input_data = 8'b11111110 ; #100 ;
WEN = 0 ; REN = 1 ; input_data = 8'b11111110 ; #100 ;
WEN = 0 ; REN = 1 ; input_data = 8'b11111110 ; #100 ;
WEN = 0 ; REN = 1 ; input_data = 8'b11111110 ; #100 ;
WEN = 0 ; REN = 1 ; input_data = 8'b11111110 ; #100 ;
WEN = 0 ; REN = 1 ; input_data = 8'b11111110 ; #100 ;


WEN = 1 ; REN = 0 ; input_data = 8'b11111111 ; #100 ;
WEN = 1 ; REN = 0 ; input_data = 8'b11111110 ; #100 ;
WEN = 1 ; REN = 0 ; input_data = 8'b11111100 ; #100 ;
WEN = 1 ; REN = 0 ; input_data = 8'b11111000 ; #100 ;
WEN = 1 ; REN = 0 ; input_data = 8'b11110000 ; #100 ;
WEN = 1 ; REN = 0 ; input_data = 8'b11100000 ; #100 ;
WEN = 1 ; REN = 0 ; input_data = 8'b11000000 ; #100 ;
WEN = 1 ; REN = 0 ; input_data = 8'b10000000 ; #100 ;

WEN = 0 ; REN = 1 ; input_data = 8'b11111110 ; #100 ;
WEN = 0 ; REN = 1 ; input_data = 8'b11111110 ; #100 ;
WEN = 0 ; REN = 1 ; input_data = 8'b11111110 ; #100 ;
WEN = 0 ; REN = 1 ; input_data = 8'b11111110 ; #100 ;
WEN = 0 ; REN = 1 ; input_data = 8'b11111110 ; #100 ;
WEN = 0 ; REN = 1 ; input_data = 8'b11111110 ; #100 ;
WEN = 0 ; REN = 1 ; input_data = 8'b11111110 ; #100 ;
WEN = 0 ; REN = 1 ; input_data = 8'b11111110 ; #100 ;

WEN = 0 ; REN = 0 ;                            #100 ;

end

FIFO G0(.clk(clk),.reset(reset),.WEN(WEN),.REN(REN),.input_data(input_data),.output_data(output_data),.empty(empty),.full(full));

endmodule