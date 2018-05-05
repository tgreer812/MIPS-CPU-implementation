`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/14/2018 04:35:30 PM
// Design Name: 
// Module Name: sign_extender
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


module sign_extender(sext, imm, seimm);
    input [15:0] imm;
    input sext;
    output wire [31:0] seimm;
    
    //this line needs to be tested
    assign seimm = (sext == 1) ? {{16{imm[15]}}, imm} : {{16{0}}, imm};

endmodule
