`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2018 04:17:30 PM
// Design Name: 
// Module Name: cpu_testbench
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


module cpu_testbench;
    reg clk;
    reg clrn;
    wire light;
    
    
    initial begin
        clk = 0;
        clrn = 1;
    end
   cpu cpu_inst(.clock(clk), .clrn(clrn), .light(light));
    //cpu cpu_inst(.clock(clk), .clrn(clrn), .pc_out_output(pc_out), .pc_in_output(pc_in));
    always #20 clk = !clk;

endmodule
