`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2018 05:44:36 PM
// Design Name: 
// Module Name: instruction_decoder
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

//NOTE: this currently works ONLY for R-types. No other logic has been created yet

module instruction_decoder(instruction, op, func, rs, rt, rd, sa, imm, addr);
    input [31:0] instruction; //do from instr_mem
    output wire [5:0] op;
    output wire [5:0] func;
    output wire [4:0] rs;
    output wire [4:0] rt;
    output wire [4:0] rd;
    output wire [4:0] sa;
    output wire [15:0] imm;
    output wire [25:0] addr;
        
    assign op = instruction[31:26];
    assign func = instruction[5:0];
    assign rs = instruction[25:21];
    assign rt = instruction[20:16];
    assign rd = instruction[15:11];
    assign sa = instruction[10:6];
    assign addr = instruction[25:0];
    assign imm = instruction[15:0];
    
endmodule
