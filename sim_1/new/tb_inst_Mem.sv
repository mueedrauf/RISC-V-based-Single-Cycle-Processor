`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/16/2026 03:04:14 PM
// Design Name: 
// Module Name: tb_inst_Mem
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_inst_Mem(

    );
    
    logic [31:0] PC;
    logic [31:0] Instr;
    
    inst_Mem dut2( 
        .PC(PC),
        .Instr(Instr)
    );
    
    initial begin
        PC = 0;
        #10;
        PC = 4;
        #10;
        PC = 8;
        #10;
        PC = 12;
        #10;
        PC = 16;
        #10;
        PC = 20;
        #10;
        PC = 24;
        #10;
        PC = 28;
        #10;
        
        
        $finish;
    end
    
endmodule
