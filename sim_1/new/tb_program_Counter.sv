`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/16/2026 02:37:52 PM
// Design Name: 
// Module Name: tb_program_Counter
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


module tb_program_Counter(

    );
    
    logic clk, rst;
    logic [15:0] pcOut;
    
    Program_Counter dut1 (
    .clk(clk),
    .rst(rst),
    .pcOut(pcOut)
    );
    
    always #5 clk = ~clk;
    
    initial begin
    
    pcOut = 0;
    clk = 1; 
    rst = 1;
    #10;
    rst = 0;
    #50;
    
    end

endmodule
