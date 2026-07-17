`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/16/2026 06:03:51 PM
// Design Name: 
// Module Name: Data_Mem
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


module Data_Mem(
    input logic clk, MemWrite, MemRead, rst,
    input logic [31:0] ALUResult, WriteData,
    output logic [31:0] ReadData
    );
    
    logic [7:0] DataMem [1023:0];
    initial begin
        integer i;
        for (i=0; i<1024; i++)begin
            DataMem[i] = i;
        end
    end
    
    assign ReadData = (MemRead) ? DataMem[ALUResult] : 32'b0;
        
    
    always_ff @(posedge clk or posedge rst) begin
        
        if (rst) begin
        integer i;
        for (i=0; i<1024; i++)begin
            DataMem[i] = i;
        end
        end
        
        else if (MemWrite) begin
            DataMem[ALUResult]= WriteData; 
        end
        

    
    end
endmodule
