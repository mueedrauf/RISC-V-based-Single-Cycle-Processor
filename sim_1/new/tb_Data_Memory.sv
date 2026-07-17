`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/16/2026 06:14:23 PM
// Design Name: 
// Module Name: tb_Data_Memory
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


module tb_Data_Memory(

    );
    
    
    logic clk, MemWrite, MemRead, rst;
    logic [31:0] ALUResult, WriteData;
    logic [31:0] ReadData;
    
    Data_Mem dut6(
    .clk(clk), .MemWrite(MemWrite), .MemRead(MemRead), .rst(rst),
    .ALUResult(ALUResult), .WriteData(WriteData),
    .ReadData(ReadData)
    );
    
    always #5 clk = ~clk;
    
    initial begin
        clk = 0;
        rst = 1;
        #10;
        
        rst=0;
        MemWrite = 1;
        ALUResult = 32'd10;
        WriteData = 32'h69;
        
        #10
        MemWrite = 0;
        MemRead = 1;
        ALUResult = 32'd5;
        #10
        $finish;
        
   
    end
endmodule
