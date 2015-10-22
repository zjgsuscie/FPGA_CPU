module cpu(clk,rst,mem_addr,mem_data,ac_out);
  input clk,rst;
  input [7:0] mem_data;
  output [5:0] mem_addr;
  output [7:0] ac_out;
  
  wire [7:0] bus;
  wire [7:0] dr_out;
  
  //?????
  ar ar(clk,arload,bus[5:0],mem_addr);
  
  //PC???
  wire [5:0] pc_out;
  pc pc(clk,rst,pcload,pcinc,bus[5:0],pc_out);
  tri6 tri6(pcbus,pc_out,bus[5:0]);
  
  //DR???
  dr dr(clk,drload,bus,dr_out);
  tri8 tri8(drbus,dr_out,bus);
  
  //mem
  tri8 tri8_m(membus,mem_data,bus);  
  
  //AC???
  wire [7:0] alu_out;
  wire [7:0] ac_out;
  
  ac ac(clk,rst,acload,acinc,alu_out,ac_out);
  //alu
  alu alu(alusel,ac_out,bus,alu_out);
  
  //IR???
  wire [1:0] ir_out;
  ir ir(clk,irload,bus[7:6],ir_out);
  
  
  //controller??
  controller controller(clk,rst,bus[7:6],
  membus,
  arload,
  pcload,pcinc,pcbus,
  drload,drbus,
  alusel,
  acload,acinc,
  irload  );
 
endmodule
