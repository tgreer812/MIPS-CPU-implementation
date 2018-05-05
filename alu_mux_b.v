`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2018 06:35:56 PM
// Design Name: 
// Module Name: alu_mux_b
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


module alu_mux_b(qb, se_imm, aluimm, b_out);
    input [31:0] qb;
    input [31:0] se_imm;
    input aluimm;
    output [31:0] b_out;
    assign b_out = aluimm? se_imm : qb;
//assign b_out = se_imm;
    
endmodule
