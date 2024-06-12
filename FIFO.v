module FIFO#(parameter data_size = 8 , parameter address_bits = 3)(input clk,reset,WEN,REN
                                                                  ,input [data_size-1:0]input_data
                                                                  ,output[data_size-1:0]output_data
                                                                  ,output empty,full);
reg [data_size-1:0] memory [0:2**address_bits-1];
reg [data_size-1:0]out;
reg [address_bits-1:0]wptr,rptr;
reg empty_reg,full_reg;
integer i;
//---------------------MEMORY----------------------------------
always @(posedge clk , posedge reset)
begin
  if(reset)
    begin
    for(i=0;i<data_size;i=i+1)
       memory[i] <= 'bz;
    end
  else if(WEN&&!full_reg)
      memory[wptr] <= input_data;
end
always @(posedge clk)
begin
  if(REN&&!empty_reg)
    out <= memory[rptr];
  else
    out='bzz;
end
assign output_data = out;
//---------------------READ_pointer----------------------------------
always @(posedge clk , posedge reset)
begin
  if(reset)
    rptr <= 'b00;
  else if(REN&&!empty_reg)
    rptr<=rptr+'b01;
  else
    rptr<=rptr;
  
end
//---------------------WRITE_pointer----------------------------------
always @(posedge clk , posedge reset)
begin
   if(reset)
      wptr <= 'b00;
   else if(WEN&&!full_reg)
      wptr <= wptr + 'b01;
   else
     wptr<=wptr;
end
//---------------------Status_signal-------------------------------------
always @(posedge clk , posedge reset)
begin
  if(reset)
    begin
    empty_reg <= 1'b1;
    full_reg <= 1'b0;  
    end
  else
    begin
      if(WEN&&wptr==rptr-1||(WEN&&wptr==(2**address_bits-1)&&rptr==0))
        full_reg<=1'b1;
      else if(REN)
        full_reg<=1'b0;
      if(REN&&rptr==wptr-1||(REN&&rptr==(2**address_bits-1)&&wptr==0))
        empty_reg<=1'b1;
      else if(WEN)
        empty_reg<=1'b0;
    end
end
assign empty = empty_reg;
assign full = full_reg;
//-------------------------------------------------------------------------
endmodule