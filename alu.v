`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2018 03:27:40 PM
// Design Name: 
// Module Name: alu
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


module alu(a, b, aluc, z, r);
    input [31:0] a;
    input [31:0] b;
    input [3:0] aluc;
    output reg z;
    output reg [31:0] r;
    
    integer temp;
    
    always @*
    begin
        if(aluc[2:0] == 3'b000)
        begin
            //add them
            r = a + b;
        end
        else if(aluc[2:0] == 4'b100)
        begin
            //subtract them
            r = a - b;
        end
        else if(aluc[2:0] == 3'b001)
        begin
            //and them
            r = a & b;
        end
        else if(aluc[2:0] == 3'b101)
        begin
            //or them
            r = a | b;
        end
        else if(aluc[2:0] == 3'b010)
        begin
            //xor them
            r = a ^ b;
            if(a == b)
                z = 1;
            else
                z = 0;
        end
        else if(aluc[2:0] == 3'b110)
        begin
            //load upper immediate
            r = b << 16;
        end
        else if(aluc == 4'b0011)
        begin
            //shift left logical
            r = b << a[4:0]; //shifts b left by the number specified in the low 5 bits of a and stores in r
        end
        else if(aluc == 4'b0111)
        begin
            //shift right logical
            r = b >> a[4:0]; //same as sll but right
        end
        else if(aluc == 4'b1111)
        begin
            //shift right arithmetic
            //temp = b[31];
            r = b >>> a[4:0];
            //r[31] = temp;
        end
        
    end

endmodule
