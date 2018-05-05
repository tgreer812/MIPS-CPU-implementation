`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2018 06:56:16 PM
// Design Name: 
// Module Name: addr_leftshift
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


module addr_leftshift(addr, addr_ls);
    input [25:0] addr;
    output [27:0] addr_ls;
    assign addr_ls[27:2] = addr; //test this
    assign addr_ls[1:0] = 0;
endmodule
