`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/16/2026 05:52:56 PM
// Design Name: 
// Module Name: tb_ALU
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


module tb_ALU(

    );
    
   
    logic [31:0] SrcA, SrcB;
    logic [2:0] ALUControl;
    logic [31:0] ALUResult;
    logic zero_flag;
    
    ALU dut5(
    .SrcA(SrcA), .SrcB(SrcB),
    .ALUControl(ALUControl),
    .ALUResult(ALUResult),
    .zero_flag(zero_flag)
    );
    
    initial begin  
    SrcA = 2;
    SrcB = 3;
    ALUControl = 3'b000;
    
    #10;
    $finish;
    
    end
endmodule
