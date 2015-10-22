module alu(op,a,b,c);
  input op;
  input [7:0] a,b;
  output [7:0] c;
  
  assign c  = (op == 0)?a+b:a & b;
endmodule
