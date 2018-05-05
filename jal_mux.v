`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/28/2018 07:18:33 PM
// Design Name: 
// Module Name: jal_mux
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


module jal_mux(jal, p4, di, d);
    input jal;
    input [31:0] p4;
    input [31:0] di;
    output [31:0] d;

    assign d = (jal == 1) ? p4:di;

endmodule
