`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/16/2026 05:20:08 PM
// Design Name: 
// Module Name: tb_Reg_file
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


module tb_Reg_file(

    );
    
    logic clk;
    logic rst;
    logic RegWrite;
    logic [4:0] readReg1, readReg2, writeReg;
    logic [31:0] writeData;
    logic [31:0] readData1, readData2;
    
    Reg_file dut4( 
    .clk(clk),
    .rst(rst),
    .RegWrite(RegWrite),
    .readReg1(readReg1), .readReg2(readReg2), .writeReg(writeReg),
    .writeData(writeData),
    .readData1(readData1),
    .readData2(readData2)
    );
    
    always #5 clk = ~clk;
    initial begin 
    rst = 1;
    clk = 0;
    #5;
    rst = 0;
    readReg1 = 5'd1;
    readReg2 = 5'd2;
    writeReg = 5'd3;
    RegWrite = 1'b0;
    #10;
    RegWrite = 1'b1;
    writeData = 32'hFFFFFFFF;
    #5
    $finish;
    end
    
endmodule
