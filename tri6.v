module tri6(on,din,dout);
  input on;
  input [5:0] din;
  output [5:0] dout;
  
  assign dout = (on == 1)?din:6'bzzz_zzz;
  
endmodule
