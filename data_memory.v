`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2018 04:26:44 PM
// Design Name: 
// Module Name: data_memory
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


module data_memory(a, di, we, clk, do);
    input [31:0] a; //addr
    input [31:0] di;
    input clk;
    input we;
    output [31:0] do;
    
    reg [31:0] memory [0:31];
    assign do = memory[a[6:2]];
    always @(posedge clk)
    begin
        if(we == 1)
        begin
            memory[a[6:2]] = di;
        end
    end
    
    integer i;
    initial begin
        for(i = 0; i < 32; i = i + 1)
            memory[i] = 0;
        memory[5'h14] = 32'h000000a3;
        memory[5'h15] = 32'h00000027;
        memory[5'h16] = 32'h00000079;
        memory[5'h17] = 32'h00000115;
    end
        
    
   
    
endmodule
