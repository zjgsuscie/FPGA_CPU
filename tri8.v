module tri8(on,din,dout);
  input on;
  input [7:0] din;
  output [7:0] dout;
  
  assign dout = (on == 1)?din:8'bzzzz_zzzz;
  
endmodule

