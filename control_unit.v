`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2018 03:26:53 PM
// Design Name: 
// Module Name: control_unit
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


module control_unit(op, func, pcsrc, aluc, shift, wreg, sext, m2reg, wmem, aluimm, z, regrt, jal);
    input [5:0] op;
    input [5:0] func;
    input z;
    output reg [1:0] pcsrc;
    output reg [3:0] aluc; //controls which operation the alu does
    output reg wreg; //1 or 0, determines whether the alu writes to a register
    output reg shift; //boolean shift yes or no
    output reg sext;
    output reg m2reg;
    output reg wmem;
    output reg aluimm;
    output reg regrt;
    output reg jal;
    
    always @(*)
    begin
        if(op == 0)
        begin
            if(func == 6'b100000)
            begin
                //it's an add
                aluc = 3'b000;
                pcsrc = 2'b00; //sequential instruction
                wreg = 1;
                shift = 0;
                //sext = 1'bx;
                aluimm = 0;
                m2reg = 0;
                wmem = 0;
                regrt = 0;
                jal = 0;
            end
            else if(func == 6'b100010)
            begin
                //it's a sub
                aluc = 3'b100;
                pcsrc = 2'b00;
                wreg = 1;
                shift = 0;
               // sext = 1'bx;
                aluimm = 0;
                m2reg = 0;
                wmem = 0;
                regrt = 0;
                jal = 0;
            end
            else if(func == 6'b100100)
            begin
                //it's an and
                aluc = 3'b001;
                pcsrc = 2'b00;
                wreg = 1;
                shift = 0;
               // sext = 1'bx;
                aluimm = 0;
                m2reg = 0;
                wmem = 0;
                regrt = 0;
                jal = 0;
            end
            else if(func == 6'b100101)
            begin
                //it's an or
                aluc = 3'b101;
                pcsrc = 2'b00;
                wreg = 1;
                shift = 0;
               // sext = 1'bx;
                aluimm = 0;
                m2reg = 0;
                wmem = 0;
                regrt = 0;
                jal = 0;
            end
            else if(func == 6'b100110)
            begin
                //it's an xor
                aluc = 3'b010;
                pcsrc = 2'b00;
                wreg = 1;
                shift = 0;
               // sext = 1'bx;
                aluimm = 0;
                m2reg = 0;
                wmem = 0;
                regrt = 0;
                jal = 0;
            end
            else if(func == 6'b000000)
            begin
                //it's a sll
                aluc = 4'b0011;
                pcsrc = 2'b00;
                wreg = 1;
                shift = 1;
                //sext = 1'bx;
                aluimm = 0;
                m2reg = 0;
                wmem = 0;
                regrt = 0;
                jal = 0;
            end
            else if(func == 6'b000010)
            begin
                //it's a srl
                aluc = 4'b0111;
                pcsrc = 2'b00;
                wreg = 1;
                shift = 1;
                //sext = 1'bx;
                aluimm = 0;
                m2reg = 0;
                wmem = 0;
                regrt = 0;
                jal = 0;
            end
            else if(func == 6'b000011)
            begin
                //sra
                 aluc = 4'b1111;
                 pcsrc = 2'b00;
                 wreg = 1;
                 shift = 1;
                 //sext = 1'bx;
                 aluimm = 0;
                 m2reg = 0;
                 wmem = 0;
                 regrt = 0;
                 jal = 0;    
            end
            else
            begin
                //don't do anything
                //this is for jr (register jump)
                wreg = 0;
             //   regrt = 1'bx;
               // jal = 1'bx;
               // m2reg = 1'bx;
               // shift = 1'bx;
               // aluimm = 1'bx;
               // sext = 1'bx;
                //aluc = 4'bxxxx;
                wmem = 0;
                pcsrc = 2'b10;
            end
        end
        else if(op == 6'b001000)
        begin
            //addi (first one not verified)
            aluc = 3'b000;
            pcsrc = 2'b00;
            wreg = 1;
            shift = 0;
            sext = 1;
            aluimm = 1;
            m2reg = 0;
            wmem = 0;
            regrt = 1;
            jal = 0;
        end
        else if(op == 6'b001100)
        begin
            //andi
            aluc = 3'b001;
            pcsrc = 2'b00;
            wreg = 1;
            shift = 0;
            sext = 0;
            aluimm = 1;
            m2reg = 0;
            wmem = 0;
            regrt = 1;
            jal = 0;
        end
        else if(op == 6'b001101)
        begin
            //ori
            aluc = 3'b101;
            pcsrc = 2'b00;
            wreg = 1;
            shift = 0;
            sext = 0;
            aluimm = 1;
            m2reg = 0;
            wmem = 0;
            regrt = 1;
            jal = 0;
        end
        else if(op == 6'b001110)
        begin
            //xori
            aluc = 3'b010;
            pcsrc = 2'b00;
            wreg = 1;
            shift = 0;
            sext = 0;
            aluimm = 1;
            m2reg = 0;
            wmem = 0;
            regrt = 1;
            jal = 0;
        end
        else if(op == 6'b100011)
        begin
            //lw
            aluc = 3'b000;
            pcsrc = 2'b00;
            wreg = 1;
            shift = 0;
            sext = 1;
            aluimm = 1;
            m2reg = 1;
            wmem = 0;
            regrt = 1;
        end
        else if(op == 6'b101011)
        begin
            //sw
            aluc = 3'b000;
            pcsrc = 2'b00;
            wreg = 0;
            shift = 0;
            sext = 1;
            aluimm = 1;
           // m2reg = 1;
            wmem = 1;
            //regrt = x;
           // jal = 0;
        end
        else if(op == 6'b000100)
        begin
            //beq
            aluc = 3'b010;
            if(z == 1)
            begin
                pcsrc = 2'b01;
            end
            else
            begin
                pcsrc = 2'b00;
            end
            wreg = 0;
            shift = 0;
            sext = 1;
            aluimm = 0;
            //m2reg = 1; don't care
            wmem = 0;
            //regrt = x;
            //jal = x;
        end
        else if(op == 6'b000101)
        begin
            //bne
            aluc = 3'b010;
            if(z == 1)
            begin
                pcsrc = 2'b00;
            end
            else
            begin
                pcsrc = 2'b01;
            end
            wreg = 0;
            shift = 0;
            sext = 1;
            aluimm = 0;
            //m2reg = 1; don't care
            wmem = 0;
            //regrt = x;
            //jal = x;    
        end
      
        else if(op == 6'b001111)
        begin
            //lui
            $display("Got here");
            aluc = 3'b110;
            pcsrc = 2'b00;
            wreg = 1;
           // shift = 1'bx; //don't care
            aluimm = 1;
            m2reg = 0;
            wmem = 0;
            regrt = 1;
            jal = 0;
        end
        else if(op == 6'b000010)
        begin
            //j
            //aluc = 4'bxxxx;
            pcsrc = 2'b11;
            wreg = 0;
            //shift = x; don't care
            //aluimm = x; don't care
            //m2reg = x; don't care
            wmem = 0;
            //regrt = x;
            //jal = x;
        end
        else if(op == 6'b000011)
        begin
            //jal
            wreg = 1;
            //regrt = x;
            jal = 1;
            //m2reg = x;
            //shift = x;
            //aluimm = x;
            //sext = x;
            //aluc = xxxx;
            wmem = 0;
            pcsrc = 2'b11;
        end
    end 

endmodule
