`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2018 03:51:52 PM
// Design Name: 
// Module Name: pc_mux
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


module pc_mux(pc4, pcsrc, npc, branch_in, register_in, jump_in);
    input [31:0] pc4; //pc +4
    //the next 3 are the addresses to go to
    input [31:0] branch_in;
    input [31:0] register_in;
    input [31:0] jump_in;
    input [1:0] pcsrc;
    output reg [31:0] npc;
    
    //for now the next program counter will always be sequential
    //this will change when we start adding branches and jumps
    always @(*)
    begin
        case(pcsrc)
            2'b00: npc = pc4;
            2'b01: npc = branch_in;
            2'b10: npc = register_in;
            2'b11: npc = jump_in;
        endcase
    end
endmodule
