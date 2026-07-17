`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/17/2026 04:08:44 PM
// Design Name: 
// Module Name: tb_processor
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


module tb_processor(

    );
    
    
    logic clk;
    logic rst;
    
    Processor dut10(
    .clk(clk),
    .rst(rst)
    );
    
    always #5 clk = ~clk;
    
    
    initial begin
        clk=0;
        rst=1;
        #1;
        rst=0;
    
        #60
        
        $finish;
        
    end
    

    
endmodule
