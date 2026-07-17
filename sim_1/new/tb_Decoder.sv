`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/16/2026 04:17:29 PM
// Design Name: 
// Module Name: tb_Decoder
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


module tb_Decoder(

    );
    
    logic [31:0] Instr;
    logic [4:0] rs1, rs2, rd;
    logic [6:0] opcode;
    logic [2:0] func3;
    logic [6:0] func7;
    logic [11:0] imm; 
    
    Decoder dut3(
    .Instr(Instr),
    .rs1(rs1), .rs2(rs2), .rd(rd),
    .opcode(opcode),
    .func3(func3), 
    .func7(func7),
    .imm(imm)
    );
    
//    ASSEMBLY CODE FILE
//    add x6,  x8,  x9      # add t1, s0, s1
//    sub x7,  x18, x19     # sub t2, s2, s3
//    mul x5,  x20, x21     # mul t0, s4, s5
//    xor x28, x22, x23     # xor t3, s6, s7
//    sll x29, x24, x25     # sll t4, s8, s9
//    srl x30, x26, x27     # srl t5, s10, s11
//    lw  x6, -4(x9)        # lw x6, -4(x9)
//    sw  x6, 8(x9)         # sw x6, 8(x9)


    initial begin
    
    Instr = 32'h00940333;
    #10;
    Instr = 32'h413903B3;
    #10;
    Instr = 32'h035A02B3;
    #10;
    Instr = 32'h017B4E33;
    #10;
    Instr = 32'h019C1EB3;
    #10;
    Instr = 32'h01BD5F33;
    #10;
    Instr = 32'hFFC4A303;
    #10;
    Instr = 32'h0064A423;
    #10;
    $finish;
    end
    
endmodule
