`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/16/2026 02:49:12 PM
// Design Name: 
// Module Name: inst_Mem
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


module inst_Mem( 
    input logic [31:0] PC,
    output logic [31:0] Instr
    );
    
    logic [7:0] instFile [31:0];
    
    
    // loops are not synthesizable in Verilog, this just define the file with 0's.   
    integer i;
	initial begin
	    // Instruction 0: add t1 s0 s1
	    instFile[0] = 8'h33;
	    instFile[1] = 8'h03;
	    instFile[2] = 8'h94;
	    instFile[3] = 8'h00;
	    
	    // Instuction 1: sub t2, s3, s4
	    instFile[4] = 8'hb3;
	    instFile[5] = 8'h83;
	    instFile[6] = 8'h49;
	    instFile[7] = 8'h41;
	    
	    // Instruction 6: lw x6 4(x9)
	    instFile[8] = 8'h03;
	    instFile[9] = 8'ha3;
	    instFile[10] = 8'h44;
	    instFile[11] = 8'h00;
	    
	    //Instruction 7: sw x2 5(x1)
	    instFile[12] = 8'ha3;
	    instFile[13] = 8'ha2;
	    instFile[14] = 8'h20;
	    instFile[15] = 8'h00;
	    
	    // Instruction 8: beq x1 x1 label
	    instFile[16] = 8'h63;
	    instFile[17] = 8'h84;
	    instFile[18] = 8'h10;
	    instFile[19] = 8'h00;
	    
	    // all are add
	    instFile[20] = 8'h0;
	    instFile[21] = 8'h0;
	    instFile[22] = 8'h0;
	    instFile[23] = 8'h0;
	    
	    // jump instruction
	    instFile[24] = 8'hef;
	    instFile[25] = 8'hf0;
	    instFile[26] = 8'h9f;
	    instFile[27] = 8'hff;
	    
	    
	    instFile[28] = 8'h33;
	    instFile[29] = 8'h00;
	    instFile[30] = 8'h94;
	    instFile[31] = 8'h00;
	    

	    
	    
	end
	
	assign Instr = {instFile[PC+3], instFile[PC+2], instFile[PC+1], instFile[PC] };

endmodule
