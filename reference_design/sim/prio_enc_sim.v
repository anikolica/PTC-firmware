`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// This file is a simulation for the WIB, already implemented.
// There are two versions of backplane and PTC.
// This code selects, vis register, the mappins for priority encode lines.
//////////////////////////////////////////////////////////////////////////////////

module tb_test2();
    
    reg clk_tb = 1'b0;
    
    reg sfp_dis = 1'b1;
    reg [7:0] sfp_dis_od = 8'h00;
    reg [2:0] bp_slot_addr = 3'b000;
    reg [1:0] prio_enc_decramble = 2'b00;
    
    wire [7:0] sfp_dis_od_descrambled;
    
    assign sfp_dis_od_descrambled[1] = (prio_enc_decramble==2'b00) ? sfp_dis_od[5] : 
                                       (prio_enc_decramble==2'b01) ? sfp_dis_od[0] :
                                       (prio_enc_decramble==2'b10) ? sfp_dis_od[1] :
                                                                     1'b1 ;
    assign sfp_dis_od_descrambled[0] = (prio_enc_decramble==2'b00) ? sfp_dis_od[4] : 
                                       (prio_enc_decramble==2'b01) ? sfp_dis_od[1] :
                                       (prio_enc_decramble==2'b10) ? sfp_dis_od[0] :
                                                                     1'b1 ;
    assign sfp_dis_od_descrambled[3] = (prio_enc_decramble==2'b00) ? sfp_dis_od[1] : 
                                       (prio_enc_decramble==2'b01) ? sfp_dis_od[2] :
                                       (prio_enc_decramble==2'b10) ? sfp_dis_od[3] :
                                                                     1'b1 ;
    assign sfp_dis_od_descrambled[2] = (prio_enc_decramble==2'b00) ? sfp_dis_od[0] : 
                                       (prio_enc_decramble==2'b01) ? sfp_dis_od[3] :
                                       (prio_enc_decramble==2'b10) ? sfp_dis_od[2] :
                                                                     1'b1 ;
    assign sfp_dis_od_descrambled[4] = (prio_enc_decramble==2'b00) ? sfp_dis_od[3] : 
                                       (prio_enc_decramble==2'b01) ? sfp_dis_od[4] :
                                       (prio_enc_decramble==2'b10) ? sfp_dis_od[4] :
                                                                     1'b1 ;
    assign sfp_dis_od_descrambled[5] = (prio_enc_decramble==2'b00) ? sfp_dis_od[2] : 
                                       (prio_enc_decramble==2'b01) ? sfp_dis_od[5] :
                                       (prio_enc_decramble==2'b10) ? sfp_dis_od[5] :
                                                                     1'b1 ;
    assign sfp_dis_od_descrambled[6] = sfp_dis_od[7]; // SPARE in PTCv3B, will be reassigned in PTCv4
    assign sfp_dis_od_descrambled[7] = sfp_dis_od[6]; // SPARE in PTCv3B, will be reassigned in PTCv4
    
    
    always @(*)
    begin
        sfp_dis_od = 8'hff;
        sfp_dis_od [bp_slot_addr[2:0]] = sfp_dis; // drive the pin matching the slot number
    end
    
    always #10 clk_tb = ~clk_tb;
   
    initial begin
        #10 sfp_dis = 1'b0;
        #0  prio_enc_decramble = 2'b00;
        #12 bp_slot_addr = 3'b001;
        #14 bp_slot_addr = 3'b010;
        #16 bp_slot_addr = 3'b011;
        #18 bp_slot_addr = 3'b100;
        #20 bp_slot_addr = 3'b101;
        #22 bp_slot_addr = 3'b110;
        #24 bp_slot_addr = 3'b111;
        
        #10 bp_slot_addr = 3'b000;
        #20 prio_enc_decramble = 2'b01;
        #12 bp_slot_addr = 3'b001;
        #14 bp_slot_addr = 3'b010;
        #16 bp_slot_addr = 3'b011;
        #18 bp_slot_addr = 3'b100;
        #20 bp_slot_addr = 3'b101;
        #22 bp_slot_addr = 3'b110;
        #24 bp_slot_addr = 3'b111;
        
        #10 bp_slot_addr = 3'b000;
        #20 prio_enc_decramble = 2'b10;
        #12 bp_slot_addr = 3'b001;
        #14 bp_slot_addr = 3'b010;
        #16 bp_slot_addr = 3'b011;
        #18 bp_slot_addr = 3'b100;
        #20 bp_slot_addr = 3'b101;
        #22 bp_slot_addr = 3'b110;
        #24 bp_slot_addr = 3'b111;
        
        #10 bp_slot_addr = 3'b000;
        #20 prio_enc_decramble = 2'b11;
        #12 bp_slot_addr = 3'b001;
        #14 bp_slot_addr = 3'b010;
        #16 bp_slot_addr = 3'b011;
        #18 bp_slot_addr = 3'b100;
        #20 bp_slot_addr = 3'b101;
        #22 bp_slot_addr = 3'b110;
        #24 bp_slot_addr = 3'b111;
        
        #10 bp_slot_addr = 3'b000;
        #10 sfp_dis = 1'b1;
        #0  prio_enc_decramble = 2'b00;
        #12 bp_slot_addr = 3'b001;
        #14 bp_slot_addr = 3'b010;
        #16 bp_slot_addr = 3'b011;
        #18 bp_slot_addr = 3'b100;
        #20 bp_slot_addr = 3'b101;
        #22 bp_slot_addr = 3'b110;
        #24 bp_slot_addr = 3'b111;
    end
endmodule
