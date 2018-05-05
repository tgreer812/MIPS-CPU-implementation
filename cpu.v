`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2018 04:00:44 PM
// Design Name: 
// Module Name: cpu
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


//module cpu(clk, clrn, pc_out_output, pc_in_output, enable, light);
module cpu(clock, clrn, light);
    //input clk;
    input clrn;
    output reg light;
    //
    //output 
    //output reg [31:0] pc_out_output; //the wire coming out of PC
    //output reg [31:0] pc_in_output;
    input clock;
    wire [31:0] pc_out;
    wire [31:0] pc_in;
    //reg [31:0] light_check;
    wire [31:0] p4; //output of the PC adder
    wire [31:0] instr_mem_out; //data output of instr_mem (the full instruction)
    
    initial begin
        light = 0;
    end
    
    //assign clrn = 0;
    
    //cpu outputs
    always @ (*)
            begin
                //light_check = pc_out;
                //if(light_check == 8'h0000005c)
                if(!clrn)
                    light=0;
                //else
                else if(pc_in == 8'h5c)
                    light = 1;
            end
    
    //module  pc_mux(pc4, pcsrc, npc);
    //fetch stage
    PC pc_inst(.clk(clock),.npc(pc_in),.pc(pc_out), .clrn(clrn));
    //PC pc_inst(.clk(clock), .npc(pc_in),.pc(pc_out));
    pc_increment pc_incr(.pc(pc_out), .pc4(p4), .clrn(clrn));
    //pc_increment pc_incr(.pc(pc_out), .pc4(p4));
    //instr_mem mem_inst(.pc(pc_out), .do(instr_mem_out), .clrn(clrn));
    instr_mem mem_inst(.pc(pc_out), .do(instr_mem_out)); 
    
    //end fetch stage
    
   
    
    wire [5:0] op;
    wire [5:0] func;
    wire [4:0] rs;
    wire [4:0] rt;
    wire [4:0] rd;
    wire [4:0] sa;
    wire [15:0] imm;
    wire [25:0] addr;
    
    //module instruction_decoder(instruction, op, func, rs, rt, rd, sa);
    //decode stage
    instruction_decoder decoder_inst(.instruction(instr_mem_out), 
            .op(op), .func(func), .rs(rs), 
        .rt(rt), .rd(rd), .sa(sa), .imm(imm), .addr(addr));
    //end decode stage
    
    wire wreg;          //write yes or no
    wire [31:0] qa;
    wire [31:0] qb;
    wire [1:0] pcsrc;   //determines the next pc (add, or a jump, etc...)
    wire [3:0] aluc;
    wire shift;    //boolean shift
    wire [31:0] a; //input 1 (alu)
   // wire [31:0] b; //input 2 (alu)
    wire z; //status (not used)
    wire [31:0] r; //result
    wire [4:0] wn; //picks rd or rt
    wire sext;
    wire m2reg;
    wire wmem;
    wire regrt;
    wire aluimm;
    wire [31:0] d;
    wire [31:0] seimm;
    wire [31:0] b;
    wire [27:0] addr_ls;
    wire [31:0] jump_addr;
    wire [31:0] branch_addr;
    wire [31:0] ls_imm;
    wire [31:0] mem_data_out;
    wire [31:0] mem_mux_data_out;
    wire [4:0] f_in;
    wire jal;
    
    //assign b = qb;
    //execute stage
    //module control_unit(op, func, pcsrc, aluc, shift, wreg, sext, m2reg, wmem, aluimm, z, regrt);
     control_unit cu_inst(.op(op), .func(func), .pcsrc(pcsrc),
               .aluc(aluc), .shift(shift), .wreg(wreg),
               .sext(sext), .m2reg(m2reg), .wmem(wmem), .aluimm(aluimm),
               .z(z), .regrt(regrt), .jal(jal));
               
    reg_file_mux rfm_inst(.rd(rd), .rt(rt), .regrt(regrt), .f_in(f_in));
    
    f f_inst(.f_in(f_in), .jal(jal), .wn(wn));
    
    
        
    jal_mux jal_mux_inst(.jal(jal), .p4(p4), .di(mem_mux_data_out), .d(d)); 
        
    regfile regfile_inst(.rna(rs), .rnb(rt), .data(d),
                .wn(wn), .we(wreg), .clk(clock), .clrn(clrn),
            .qa(qa), .qb(qb));
              
    addr_leftshift a_ls_inst(.addr(addr), .addr_ls(addr_ls));    
        
    sign_extender se_inst(.sext(sext), .imm(imm), .seimm(seimm));
    alu_mux_b alu_mux_b_inst(.qb(qb), .se_imm(seimm), .aluimm(aluimm), .b_out(b));
    alu_mux alu_mux_inst(.qa(qa), .sa(sa), .shift(shift), .a_out(a));
    alu alu_inst(.a(a), .b(b), .aluc(aluc), .z(z), .r(r));
    

    data_memory dm_inst(.a(r), .di(qb), 
        .we(wmem), .clk(clock), .do(mem_data_out));
    
    mem_mux mm_inst(.r(r), .di(mem_data_out), .m2reg(m2reg), .do(mem_mux_data_out));
    
    imm_leftshift imm_ls_inst(.imm(seimm), .imm_out(ls_imm));
    branch_adder ba_inst(.p4(p4), .ls_imm(ls_imm), .branch_address(branch_addr));
    jump_target_concat jtc_inst(.p4(p4), .addr_ls(addr_ls), .jump_addr(jump_addr));
    
    pc_mux pc_mux_inst(.pc4(p4), .pcsrc(pcsrc), .npc(pc_in), .branch_in(branch_addr), .register_in(qa), .jump_in(jump_addr)); //not sure if this should go in the execute stage or in the fetch stage
    //end execute
    
endmodule
