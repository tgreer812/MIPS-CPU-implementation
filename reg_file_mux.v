`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2018 03:01:42 PM
// Design Name: 
// Module Name: reg_file_mux
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


module reg_file_mux(rd, rt, regrt, f_in);
    input [4:0] rd;
    input [4:0] rt;
    input regrt;
    output [4:0] f_in;
    
    assign f_in = (regrt == 1) ? rt: rd;
endmodule
