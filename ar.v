module ar(clk,load,din,dout);
  input clk,load;
  input [5:0] din;
  output [5:0] dout;
  
  reg [5:0] d;
  
  assign dout = d;
  
  always @(posedge clk)
  begin
    if(load)
      d = din;
  end
  
endmodule
