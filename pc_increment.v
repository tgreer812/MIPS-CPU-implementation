`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2018 06:08:15 PM
// Design Name: 
// Module Name: pc_increment
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

//this is the + module that adds 4 to the pc
module pc_increment(pc, pc4, clrn);
//module pc_increment(pc, pc4);
    input [31:0] pc;
    output[31:0] pc4;
    input clrn;
    assign pc4 = (clrn == 1)? pc + 4: 0;
    //assign pc4 = pc+4;
endmodule
