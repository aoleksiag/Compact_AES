`timescale 1ns / 100ps

module AES_top(
        input  wire     clk,rst,sample_trig_top,
        input  wire     [127:0]TOP_DATA,
        input  wire     [127:0]TOP_key,
        output reg      [127:0]data_out_TOP,
        output reg      busy_TOP
    );
    reg sample_trig;
    reg end_round_enable;
    reg first_round;
    wire AES_BLOCK_busy;
    reg [3:0] count,count2;
    
    reg [127:0] data_in_temp;
    
    wire [127:0] data_out_temp;
    
    localparam size        = 3 ; 
    localparam IDLE_top    = 3'd1 ;
    localparam S1_top      = 3'd2 ;
    localparam S2_top      = 3'd3 ;
    localparam S3_top      = 3'd4 ;
    localparam S4_top      = 3'd5 ;
    localparam S5_top      = 3'd6 ;
    localparam final_round = 3'd7;
    reg  [size-1:0] state;
    
    Aes_block_top    aes_block (
            .clk(clk),
            .rst(rst),
            .AES_BLOCK_sample_trig(sample_trig),
            .end_round_enable(end_round_enable),
            .first_round(first_round),
            .AES_BLOCK_data_in(data_in_temp),
            .AES_BLOCK_key(TOP_key),
            .data_out_block(data_out_temp),
            .busy_AES_BLOCK(AES_BLOCK_busy),
            .count(count)
    );
    


    always @(posedge clk) begin
        if(rst) begin
            state   <= IDLE_top;
            count   <= 0;
            count2   <= 0;
        end else
            end_round_enable=0;
            case(state)
                IDLE_top: begin
                    count  <= 0;
                    count2 <= 0;
                    if (sample_trig_top) begin
                        state <= S1_top;
                        busy_TOP         <= 1;
                        sample_trig  <= 1;
                        first_round  <= 1;
                        data_in_temp <= TOP_DATA;
                   end else begin
                       state <= IDLE_top;
                       busy_TOP      <= 0;
                       sample_trig   <= 0;
                   end
                end
           
                S1_top:  begin              
                    state   <= S2_top;
                    
                    
                end
           
                S2_top: begin
                    
                    if (AES_BLOCK_busy) begin
                        state <= S2_top;
                        sample_trig <= 0;
                    end else begin 
                        
                        data_in_temp <= data_out_temp;
                        sample_trig  <= 1;
                        state        <= S3_top;
                        first_round  <= 0;
                    end
                end
                
                S3_top:  begin              
                    state   <= S4_top;
                    
                    
                end
                
                S4_top: begin
                    if (count2==9) 
                        end_round_enable=1;
                    else
                        end_round_enable=0;
                    
                    if (AES_BLOCK_busy) begin
                        state <= S4_top;
                        sample_trig <= 0;
                    end else begin 
                        count <= count+1;
                        data_in_temp <= data_out_temp;
                        sample_trig  <= 1;
                        state        <= S5_top;
                    end
                end
                
                S5_top:  begin  
                  if (count2<=8) begin
                    state   <= S4_top;
                    
                    count2 <= count2+1;
                 end else if (count2==9) begin
                     data_out_TOP <= data_out_temp;
                     state <= IDLE_top; 
                     busy_TOP      <= 0;
                 end else
                     state <= IDLE_top; 
                 busy_TOP      <= 0;
                end
                

                default: state <= IDLE_top;        
            endcase
    end
endmodule
