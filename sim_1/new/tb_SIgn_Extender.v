`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/17/2026 03:02:21 PM
// Design Name: 
// Module Name: tb_Sign_Extender
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


module tb_Sign_Extender(

    );
    
    logic [1:0] ImmSrc;
    logic [11:0] imm;
    logic [19:0] imm_j;
    logic [31:0] ImmExt;
    
    sign_extender dut7(
    .ImmSrc(ImmSrc),
    .imm(imm),
    .imm_j(imm_j),
    .ImmExt(ImmExt)
    );
    
    initial begin
        ImmSrc = 2'b00;
        imm = 12'b111111111111;
        #10;
        ImmSrc = 2'b01;
        imm = 12'b011111111111;
        #10;
        ImmSrc = 2'b10;
        imm = 12'b011111111111;
        #10;
        $finish;
    end
    
    
endmodule
