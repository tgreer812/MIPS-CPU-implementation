`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2018 12:05:08 PM
// Design Name: 
// Module Name: PC
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


module PC(clk, npc, pc, clrn);
//module PC(clk, npc, pc);
    input clk;
    input clrn;
    input [31:0] npc; //where the program counter should change to on the next clock edge
    output reg [31:0] pc; //current value of the program counter

    initial
    begin
        pc = 0;
        //npc = 4;
    end
    
    always @ (posedge clk)
    begin
        
        if(clrn)
            pc <= npc;
        
        else
        
            pc <= 0;
        
    end
    
endmodule
