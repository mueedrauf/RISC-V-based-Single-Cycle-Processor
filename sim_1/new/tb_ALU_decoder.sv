`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/17/2026 03:56:23 PM
// Design Name: 
// Module Name: tb_ALU_decoder
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


module tb_ALU_decoder;


    logic [1:0] ALUOp;
    logic [2:0] func3;
    logic func7_5;
    logic op5;
    logic [2:0] ALUControl;

    // DUT
    ALU_decoder dut8 (
        .ALUOp(ALUOp),
        .func3(func3),
        .func7_5(func7_5),
        .op5(op5),
        .ALUControl(ALUControl)
    );

    initial begin

        // lw/sw -> add
        ALUOp   = 2'b00;
        func3   = 3'b000;
        func7_5 = 0;
        op5     = 0;
        #10;

        // beq -> sub
        ALUOp   = 2'b01;
        func3   = 3'b000;
        func7_5 = 0;
        op5     = 0;
        #10;

        // add
        ALUOp   = 2'b10;
        func3   = 3'b000;
        func7_5 = 0;
        op5     = 0;
        #10;

        // sub
        ALUOp   = 2'b10;
        func3   = 3'b000;
        func7_5 = 1;
        op5     = 1;
        #10;

        // slt
        ALUOp   = 2'b10;
        func3   = 3'b010;
        func7_5 = 0;
        op5     = 0;
        #10;

        // or
        ALUOp   = 2'b10;
        func3   = 3'b110;
        func7_5 = 0;
        op5     = 0;
        #10;

        // and
        ALUOp   = 2'b10;
        func3   = 3'b111;
        func7_5 = 0;
        op5     = 0;
        #10;

        $finish;
    end

endmodule
