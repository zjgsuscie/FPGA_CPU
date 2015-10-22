`define FETCH1 1
`define FETCH2 2
`define FETCH3 3
`define ADD1 4
`define ADD2 5
`define AND1 6
`define AND2 7
`define JMP1 8
`define INC1 9
`define OP_ADD 2'd0
`define OP_AND 2'd1
`define OP_JMP 2'd2
`define OP_INC 2'd3

module controller(clk,rst,op,
  membus,
  arload,
  pcload,pcinc,pcbus,
  drload,drbus,
  alusel,
  acload,acinc,
  irload);
  
  input clk,rst;
  input [1:0] op;
  
  output membus,
  arload,
  pcload,pcinc,pcbus,
  drload,drbus,
  alusel,
  acload,acinc,
  irload;
 
  
  reg [3:0] state,nstate;
  
  assign membus = (state == `FETCH2 || state == `AND1 || state == `ADD1)?1:0;
  assign arload = (state == `FETCH1 || state == `FETCH3 )?1:0;
  assign pcload = (state == `JMP1 )?1:0;
  assign pcinc = (state == `FETCH2 )?1:0;
  assign pcbus= (state == `FETCH1 )?1:0;
  assign drload= (state == `FETCH2 || state == `AND1 || state == `ADD1)?1:0;
  assign drbus = (state == `FETCH3 || state == `ADD2 || state == `AND2|| state == `JMP1)?1:0;
  assign alusel = (state == `ADD2 )?0:1;
  assign acload = (state == `ADD2 || state == `AND2)?1:0;
  assign acinc = (state == `INC1)?1:0;
  assign irload = (state == `FETCH3 )?1:0;
  
  always @(posedge clk)
  begin
    if(rst)
      state = `FETCH1;
    else
      state = nstate;
  end
  
  always @(state )
  begin
    case(state)
      `FETCH1:  nstate = `FETCH2;
      `FETCH2:  nstate = `FETCH3;
      `FETCH3:  
        begin
          case(op)
            `OP_ADD:  nstate = `ADD1;
            `OP_AND:  nstate = `AND1;
            `OP_JMP:  nstate = `JMP1;
            `OP_INC:  nstate = `INC1;
            default: nstate = `FETCH1;
          endcase
         end

      `ADD1:  nstate = `ADD2;
      `ADD2:  nstate = `FETCH1;
      `AND1:  nstate = `AND2;
      `AND2:  nstate = `FETCH1;
      `JMP1:  nstate = `FETCH1;
      `INC1:  nstate = `FETCH1;
      default:  nstate = `FETCH1;
    endcase
  end
    
endmodule
