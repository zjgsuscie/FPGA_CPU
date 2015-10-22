module ir(clk,load,din,dout);
  input clk,load;
  input [1:0] din;
  output [1:0] dout;
  
  reg [1:0] d;
  
  assign dout = d;
  
  always @(posedge clk)
  begin
    if(load)
      d = din;
  end
  
endmodule

