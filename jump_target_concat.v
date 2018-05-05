`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2018 07:58:47 PM
// Design Name: 
// Module Name: jump_target_concat
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


module jump_target_concat(p4, addr_ls, jump_addr);
    input [31:0] p4;
    input [27:0] addr_ls;
    output wire [31:0] jump_addr;
    
    assign jump_addr[31:28] = p4[31:28];
    assign jump_addr[27:0] = addr_ls;

endmodule
