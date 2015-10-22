module dr(clk,load,din,dout);
  input clk,load;
  input [7:0] din;
  output [7:0] dout;
  
  reg [7:0] d;
  
  assign dout = d;
  
  always @(posedge clk)
  begin
    if(load)
      d = din;
  end
  
endmodule
