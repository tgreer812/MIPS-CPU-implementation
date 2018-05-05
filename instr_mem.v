`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2018 03:28:27 PM
// Design Name: 
// Module Name: instr_mem
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


//module instr_mem(pc, do, clrn);
module instr_mem(pc, do);
    input [31:0] pc;
    //input clrn;
    output [31:0] do; //data out (the instruction to be ran)
    //reg [7:0] memory [0:127]; //allows space for 12 bytes of instructions (3 instructions) (will need to be expanded)
    reg [7:0] memory [0:127];
    
    //always @(posedge clrn)
    initial
    begin
        
        $readmemh("instr.txt", memory);
            
        /*
            memory[0] = 8'h3c;
            memory[1] = 8'h01;
            memory[2] = 8'h00;
            memory[3] = 8'h00;    // (00) main:   lui  $1, 0
            memory[4] = 8'h34;
            memory[5] = 8'h24;
            memory[6] = 8'h00;
            memory[7] = 8'h50;    // (04)       ori  $4, $1, 80
            memory[8] = 8'h20;
            memory[9] = 8'h05;
            memory[10] = 8'h00;
            memory[11] = 8'h04;    // (08)         addi $5, $0,  4
            memory[12] = 8'h0c;
            memory[13] = 8'h00;
            memory[14] = 8'h00;
            memory[15] = 8'h18;    // (0c) call:   jal  sum
            memory[16] = 8'hac;
            memory[17] = 8'h82;
            memory[18] = 8'h00;
            memory[19] = 8'h00;    // (10)         sw   $2, 0($4)
            memory[20] = 8'h8c;
            memory[21] = 8'h89;
            memory[22] = 8'h00;
            memory[23] = 8'h00;    // (14)         lw   $9, 0($4)
            memory[24] = 8'h01;
            memory[25] = 8'h24;
            memory[26] = 8'h40;
            memory[27] = 8'h22;    // (18)         sub  $8, $9, $4
            memory[28] = 8'h20;
            memory[29] = 8'h05;
            memory[30] = 8'h00;
            memory[31] = 8'h03;    // (1c)         addi $5, $0,  3
            memory[32] = 8'h20;
            memory[33] = 8'ha5;
            memory[34] = 8'hff;
            memory[35] = 8'hff;    // (20) loop2:  addi $5, $5, -1
            memory[36] = 8'h34;
            memory[37] = 8'ha8;
            memory[38] = 8'hff;
            memory[39] = 8'hff;    // (24)         ori  $8, $5, 0xffff
            memory[40] = 8'h39;
            memory[41] = 8'h08;
            memory[42] = 8'h55;
            memory[43] = 8'h55;    // (28)         xori $8, $8, 0x5555
            memory[44] = 8'h20;
            memory[45] = 8'h09;
            memory[46] = 8'hff;
            memory[47] = 8'hff;    // (2c)         addi $9, $0, -1
            memory[48] = 8'h31;
            memory[49] = 8'h2a;
            memory[50] = 8'hff;
            memory[51] = 8'hff;    // (30)         andi $10,$9, 0xffff
            memory[52] = 8'h01;
            memory[53] = 8'h49;
            memory[54] = 8'h30;
            memory[55] = 8'h25;    // (34)         or   $6, $10, $9
            memory[56] = 8'h01;
            memory[57] = 8'h49;
            memory[58] = 8'h40;
            memory[59] = 8'h26;    // (38)         xor  $8, $10, $9
            memory[60] = 8'h01;
            memory[61] = 8'h46;
            memory[62] = 8'h38;
            memory[63] = 8'h24;    // (3c)         and  $7, $10, $6
            memory[64] = 8'h10;
            memory[65] = 8'ha0;
            memory[66] = 8'h00;
            memory[67] = 8'h01;    // (40)         beq  $5, $0, shift
            memory[68] = 8'h08;
            memory[69] = 8'h00;
            memory[70] = 8'h00;
            memory[71] = 8'h08;    // (44)         j    loop2
            memory[72] = 8'h20;
            memory[73] = 8'h05;
            memory[74] = 8'hff;
            memory[75] = 8'hff;    // (48) shift:  addi $5, $0, -1
            memory[76] = 8'h00;
            memory[77] = 8'h05;
            memory[78] = 8'h43;
            memory[79] = 8'hc0;    // (4c)         sll  $8, $5, 15
            memory[80] = 8'h00;
            memory[81] = 8'h08;
            memory[82] = 8'h44;
            memory[83] = 8'h00;    // (50)         sll  $8, $8, 16
            memory[84] = 8'h00;
            memory[85] = 8'h08;
            memory[86] = 8'h44;
            memory[87] = 8'h03;    // (54)         sra  $8, $8, 16
            memory[88] = 8'h00;
            memory[89] = 8'h08;
            memory[90] = 8'h43;
            memory[91] = 8'hc2;    // (58)         srl  $8, $8, 15
            memory[92] = 8'h08;
            memory[93] = 8'h00;
            memory[94] = 8'h00;
            memory[95] = 8'h17;    // (5c) finish: j    finish
            memory[96] = 8'h00;
            memory[97] = 8'h00;
            memory[98] = 8'h40;
            memory[99] = 8'h20;    // (60) sum:    add  $8, $0, $0
            memory[100] = 8'h8c;
            memory[101] = 8'h89;
            memory[102] = 8'h00;
            memory[103] = 8'h00;    // (64) loop:   lw   $9, 0($4)
            memory[104] = 8'h20;
            memory[105] = 8'h84;
            memory[106] = 8'h00;
            memory[107] = 8'h04;    // (68)         addi $4, $4,  4
            memory[108] = 8'h01;
            memory[109] = 8'h09;
            memory[110] = 8'h40;
            memory[111] = 8'h20;    // (6c)         add  $8, $8, $9
            memory[112] = 8'h20;
            memory[113] = 8'ha5;
            memory[114] = 8'hff;
            memory[115] = 8'hff;    // (70)         addi $5, $5, -1
            memory[116] = 8'h14;
            memory[117] = 8'ha0;
            memory[118] = 8'hff;
            memory[119] = 8'hfb;    // (74)         bne  $5, $0, loop
            memory[120] = 8'h00;
            memory[121] = 8'h08;
            memory[122] = 8'h10;
            memory[123] = 8'h00;    // (78)         sll  $2, $8, 0
            memory[124] = 8'h03;
            memory[125] = 8'he0;
            memory[126] = 8'h00;
            memory[127] = 8'h08;
            */
    end

        
        assign do[31:24] = memory[pc[7:0]];
        assign do[23:16] = memory[pc[7:0]+1];
        assign do[15:8] = memory[pc[7:0]+2];
        assign do[7:0] = memory[pc[7:0]+3];
        
        //assign do = (clrn == 1) ? memory[pc]:0;
    
endmodule

