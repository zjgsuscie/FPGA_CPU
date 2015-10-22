module top;

wire [5:0] addr;
wire [7:0] data;
wire [7:0] ac_out;

reg clk,rst;

initial
begin
  clk = 0;
  rst = 1;
  
  #15 rst = 0;
  
  #1000 $stop();
  
end

always #10 clk = ~clk;


mem m(addr,data);
cpu cpu(clk,rst,addr,data,ac_out);

endmodule
