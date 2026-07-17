`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/17/2026 04:03:38 PM
// Design Name: 
// Module Name: Processor
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


module Processor(
    input logic clk,
    input logic rst
    );
    
    //////////// wires for connections
    
    logic [31:0] pcOut;    // coming out of PC
    logic [31:0] PCin;     // for starting initialization
    logic [31:0] pcTarget; // out of pc + imm target
    logic [31:0] out_4pc;  // output wire from pc + 4, input to mux
    
    //////////// wires for instruction mem and decoding
    
    logic [31:0] Instr;     //instruction get stored here
    // wires for output of decoder
    
    logic [4:0] rs1, rs2, rd;
    logic [6:0] opcode;
    logic [2:0] func3;
    logic [6:0] func7;
    logic [11:0] imm;
    
    ////////////control unit signals

    logic       RegWrite;
    logic [1:0] ImmSrc;
    logic       ALUSrc;
    logic       MemWrite;
    logic [1:0] ResultSrc;
    logic       Branch;    // same as pc source
    logic [1:0] ALUOp;
    logic jump;
    
    logic flag_j;
    
    //////////// wire for reg file
    
    logic [31:0] writeData;
    logic [31:0] readData1, readData2;
   
    //////////// wire for sign extension
    
    logic [19:0] imm_j;     // wire for jump imm field
    logic [31:0] ImmExt;    //output of sign extension
 
    //////////// wire for alu decoder and mux out for alusrcB
    
    logic [2:0] ALUControl;
    logic [31:0] SrcB;
     
     //////////// wire for ALU 
     
    logic [31:0] ALUResult;
    logic zero_flag;   
    
    //////////// wire for Data memory
    logic [31:0] ReadData;
        
    // initial value for proper instantiation and testing
    
    

    
   
    
    ///////////////////////////////Instansiating PC
    
    
    Program_Counter i1 (
    .PCin(PCin),
    .clk(clk),
    .rst(rst),
    .pcOut(pcOut)
    );
    
    adder i2(
    .a(pcOut), .b(32'd4),
    .out(out_4pc)
    );
    
    

    
    mux2_1 i3(
    .a(pcTarget), .b(out_4pc),
    .flag((Branch && zero_flag) | jump),
    .mux_out(PCin)
    );
    
    //Instruction memory and decoding

    
    inst_Mem i4( 
        .PC(pcOut),
        .Instr(Instr)
    );
 
    Decoder i5(
    .Instr(Instr),
    .rs1(rs1), .rs2(rs2), .rd(rd),
    .opcode(opcode),
    .func3(func3), 
    .func7(func7),
    .imm(imm),
    .imm_j(imm_j)
    );
    
    
    // Register file & Sign extender & control unit
    
    
    
    Control_Unit i7(
    .Op(opcode),
    .zero(zero_flag),
    .RegWrite(RegWrite),
    .ImmSrc(ImmSrc),
    .ALUSrc(ALUSrc),
    .MemWrite(MemWrite),
    .ResultSrc(ResultSrc),
    .Branch(Branch),
    .jump(jump),
    .ALUOp(ALUOp)
    );
    
    Reg_file i6( 
    .clk(clk),
    .rst(rst),
    .RegWrite(RegWrite),
    .readReg1(rs1), .readReg2(rs2), .writeReg(rd),
    .writeData(writeData),
    .readData1(readData1),
    .readData2(readData2)
    );
    
    
    sign_extender i8(
    .ImmSrc(ImmSrc),
    .imm(imm),
    .imm_j(imm_j),
    .ImmExt(ImmExt)
    );
    
    adder i9(
    .a(pcOut), .b(ImmExt),
    .out(pcTarget)
    );
    
    ///////////ALU and muxes

    ALU_decoder i10 (
    .ALUOp(ALUOp),
    .func3(func3),
    .func7_5(func7[5]),
    .op5(opcode[5]),
    .ALUControl(ALUControl)
    );
    
    mux2_1 i11(
    .a(ImmExt), .b(readData2),
    .flag(ALUSrc),
    .mux_out(SrcB)
    );

    ALU i12(
    .SrcA(readData1), .SrcB(SrcB),
    .ALUControl(ALUControl),
    .ALUResult(ALUResult),
    .zero_flag(zero_flag)
    );
    
    // data memory instantiation
    assign MemRead = ~MemWrite;
    
    Data_Mem i13(
    .clk(clk), .MemWrite(MemWrite), .MemRead(MemRead), .rst(rst),
    .ALUResult(ALUResult), .WriteData(readData2),
    .ReadData(ReadData)
    );
    
    mux4_1 i14(
    .a(ALUResult), .b(ReadData), .c(PCin),
    .sel(ResultSrc),
    .mux_out(writeData)
    );
    
    
    
endmodule
