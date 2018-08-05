`timescale 1 ns / 100 ps   // module timescale_check2;
module Aes_block_top(
        input  wire     clk,rst,AES_BLOCK_sample_trig,end_round_enable,first_round,
        input  wire     [127:0] AES_BLOCK_data_in,
        input  wire     [127:0] AES_BLOCK_key,
        input  wire     [3:0] count,
        output reg      [127:0] data_out_block,
        output reg      busy_AES_BLOCK
        );
    
    localparam size     = 3 ; 
    localparam IDLE_top = 3'd1 ;
    localparam S1_top   = 3'd2 ;
    localparam S2_top   = 3'd3 ;
    localparam S3_top   = 3'd4 ;
    localparam S4_top   = 3'd5 ;


    reg  [size-1:0] state_aes_block ;
    reg  [2:0] i;
    reg  sample_trig_AES_BLOCK;
    reg  [31:0] temp_key;
    reg  [127:0]  test,WH_key_temp;
    wire [127:0] key_temp_WH;
    wire end_mod_top;
    wire [7:0] SR_out_1,SR_out_2,SR_out_3,SR_out_4;
    wire [7:0] SB_MC_out_1,SB_MC_out_2,SB_MC_out_3,SB_MC_out_4;
    wire [127:0] data_out_temp;
    
    Wh_key  key_block (
            .WH_key_inx(WH_key_temp),
            .rst(rst),
            .count(count),
            .first_round(first_round),
            .clk(clk),
            .key_out_WH(key_temp_WH)
        );
    
        SR_mod    u1 (
            .rst(rst),
            .SR_data(AES_BLOCK_data_in),
            .i(i),
            .first_round(first_round),
            .out_1_SR(SR_out_1),
            .out_2_SR(SR_out_2),
            .out_3_SR(SR_out_3),
            .out_4_SR(SR_out_4)
        );
    
        SB_MC_mod u2 (
            .clk(clk),
            .rst(rst),
            .first_round(first_round),
            .SB_MC_sample_trig(sample_trig_AES_BLOCK),
            .end_round_enable(end_round_enable),
            .SB_MC_in_1(SR_out_1),
            .SB_MC_in_2(SR_out_2),
            .SB_MC_in_3(SR_out_3),
            .SB_MC_in_4(SR_out_4),
            .out_1_SB_MC(SB_MC_out_1),
            .out_2_SB_MC(SB_MC_out_2),
            .out_3_SB_MC(SB_MC_out_3),
            .out_4_SB_MC(SB_MC_out_4),
            .end_mod_SB_MC(end_mod_top)
        );
        
        xor_mod  u3 (
            .i(i),
            .clk(clk),
            .rst(rst),
            .XOR_MOD_key(temp_key),
            .XOR_MOD_in_1(SB_MC_out_1),
            .XOR_MOD_in_2(SB_MC_out_2),
            .XOR_MOD_in_3(SB_MC_out_3),
            .XOR_MOD_in_4(SB_MC_out_4),
            .data_out_XOR_MOD(data_out_temp)
        );
    
        
    always @(*) begin
        if(first_round) begin
            WH_key_temp <= AES_BLOCK_key;
        end else begin
            WH_key_temp <= test;
        end
    end
    
    always @(posedge clk) begin
        if(rst) begin
            state_aes_block   <= IDLE_top;
            sample_trig_AES_BLOCK <= 0;
            i           <= 0;
            temp_key    <= 0;
        end else
         case(state_aes_block)
            IDLE_top: begin
                i         <= 0;
                if (AES_BLOCK_sample_trig) begin
                    state_aes_block <= S1_top;
                    busy_AES_BLOCK      <= 1;
                end else begin
                    state_aes_block <= IDLE_top;
                    busy_AES_BLOCK      <= 0;
                end
            end
           
            S1_top:  begin 
                state_aes_block   <= S2_top;
                sample_trig_AES_BLOCK <= 1;
            end
           
            S2_top: begin
                sample_trig_AES_BLOCK <= 0;
              if (i ==0) 
                  temp_key <= key_temp_WH[127:96];
              else if (i==1)
                  temp_key <= key_temp_WH[95:64]; 
              else if (i==2)
                  temp_key <= key_temp_WH[63:32];
              else   
                 temp_key  <= key_temp_WH[31:0]; 

              if (end_mod_top) begin
                    state_aes_block <= S3_top;
                    
              end else 
               state_aes_block <= S2_top;
               
            end
            
            S3_top: begin
                i  <= i+1;
                if (i==3) begin
                    state_aes_block  <= S4_top;
                    busy_AES_BLOCK <= 1;
                    
                    test <= key_temp_WH;  ////
                end else
                    state_aes_block  <= S1_top;             
            end
            
            S4_top: begin
                data_out_block<= data_out_temp;
                state_aes_block <= IDLE_top;
            end
            default: state_aes_block <= IDLE_top;        
        endcase
    end
endmodule


