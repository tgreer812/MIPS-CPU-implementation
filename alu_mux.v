`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2018 03:48:29 PM
// Design Name: 
// Module Name: alu_mux
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


module alu_mux(qa, sa, shift, a_out);
    input [31:0] qa;
    input [4:0] sa;
    input shift;
    output wire [31:0] a_out;
    //{{16{0}}, imm}
    assign a_out = (shift == 1) ? {{27{0}},sa}: qa;
    
endmodule
