`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2018 06:13:25 PM
// Design Name: 
// Module Name: imm_leftshift
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


module imm_leftshift(imm, imm_out);
    input [31:0] imm;
    output [31:0] imm_out;
    assign imm_out = imm << 2;
endmodule
