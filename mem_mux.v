`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2018 03:20:03 PM
// Design Name: 
// Module Name: mem_mux
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


module mem_mux(r, di, m2reg, do);
    input [31:0] r;
    input [31:0] di;
    input m2reg;
    output [31:0] do;

    assign do = (m2reg == 1) ? di : r;
    
endmodule
