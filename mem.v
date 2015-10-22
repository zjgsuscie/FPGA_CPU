module mem(input [5:0] addr,output [7:0] data);
  reg [7:0] d;

  assign data = d;
    
  always @(addr)
  begin
      case(addr)
        6'd0:d = 8'b00_111111;//add ac+m[63]
        6'd1:d = 8'b01_111110;//and ac | m[62]
        6'd2:d = 8'b11_000000;//inc ac
        6'd3:d = 8'b10_000010;//jmp 2

        6'd62:d = 8'b00_100000;
        6'd63:d = 8'b00_111111; 
        default:d = 0;       
      endcase
  end
endmodule
