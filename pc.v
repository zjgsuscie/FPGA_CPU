module pc(clk,rst,load,inc,din,dout);
  input clk,rst,load,inc;
  input [5:0] din;
  output [5:0] dout;
  
  reg [5:0] d;
  
  assign dout = d;
  
  always @(posedge clk)
  begin
    if(rst)
      d = 6'd0;
    else if(load)
      d = din;
    else if(inc)
      d = d + 1;
  end
  
endmodule

