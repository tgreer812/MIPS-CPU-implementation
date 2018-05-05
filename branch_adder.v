`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2018 06:19:05 PM
// Design Name: 
// Module Name: branch_adder
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


module branch_adder(p4, ls_imm, branch_address);
    input [31:0] p4;
    input [31:0] ls_imm;
    output wire [31:0] branch_address;
    
    assign branch_address = p4 + ls_imm;
endmodule
