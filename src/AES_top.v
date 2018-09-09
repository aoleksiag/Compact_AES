`timescale 1ns / 100ps

module AES_top#(parameter WIDTH=128)(
        input  wire     clk,
        input  wire     reset,
        input  wire	    sample_trig_top,
        input  wire     [WIDTH-1:0]TOP_DATA,
        input  wire     [WIDTH-1:0]TOP_key,
        output reg      [WIDTH-1:0]data_out_TOP,
        output reg      busy_TOP
    );

    reg [WIDTH-1:0] data_in_temp;
    reg [3:0]       round_count;
    reg             sample_trig;
    reg             end_round_enable;
    reg             first_round_enable;

    wire [WIDTH-1:0] data_out_temp;
    wire       AES_BLOCK_busy;

    localparam size        = 3 ; 
    localparam IDLE_top    = 3'd1 ;
    localparam S1_top      = 3'd2 ;
    localparam S2_top      = 3'd3 ;
    localparam S3_top      = 3'd4 ;
    localparam S4_top      = 3'd5 ;
    localparam S5_top      = 3'd6 ;
    localparam final_round = 3'd7;
    reg  [size-1:0] state_AES_TOP;
    
    Aes_block_top    aes_block (
            .clk(clk),
            .reset(reset),
            .AES_BLOCK_sample_trig(sample_trig),
            .end_round(end_round_enable),
            .first_round_enable(first_round_enable),
            .AES_BLOCK_data_in(data_in_temp),
            .AES_BLOCK_key(TOP_key),
            .data_out_AES_BLOCK(data_out_temp),
            .busy_AES_BLOCK(AES_BLOCK_busy),
            .count(count)
    );
    


    always @(posedge clk) begin
        if(reset) begin
            state_AES_TOP                   <= IDLE_top;
            count                           <= 0;
            round_count                     <= 0;
        end else
            end_round_enable=0;
            case(state_AES_TOP)
                IDLE_top: begin
                    count                   <= 0;
                    round_count             <= 0;
                    if (sample_trig_top) begin
                        state_AES_TOP       <= S1_top;				// pierwsza runda rozpoczyna się
                        busy_TOP            <= 1;
                        sample_trig         <= 1;
                        first_round_enable  <= 1;
                        data_in_temp        <= TOP_DATA;
                   end else begin
                       state_AES_TOP        <= IDLE_top;
                       busy_TOP             <= 0;
                       sample_trig          <= 0;
                   end
                end
           
                S1_top:  begin              
                    state_AES_TOP           <= S2_top;
                    
                    
                end
           
                S2_top: begin
                    
                    if (AES_BLOCK_busy) begin
                        state_AES_TOP        <= S2_top;
                        sample_trig          <= 0;
                    end else begin 
                        data_in_temp         <= data_out_temp;
                        sample_trig          <= 1;
                        state_AES_TOP        <= S3_top;
                        first_round_enable   <= 0;
                    end
                end
                
                S3_top:  begin
                    state_AES_TOP            <= S4_top;       // te puste stany sa poto aby trig wszedł odpowiednio chyba
                end

                S4_top: begin
                    if (round_count==9) 
                        end_round_enable=1;
                    else
                        end_round_enable=0;

                    if (AES_BLOCK_busy) begin
                        state_AES_TOP        <= S4_top;
                        sample_trig          <= 0;           //???
                    end else begin 
                        count                <= count+1;
                        data_in_temp         <= data_out_temp;
                        sample_trig          <= 1;
                        state_AES_TOP        <= S5_top;
                    end
                end

                S5_top:  begin  
                  if (round_count<=8) begin
                    state_AES_TOP            <= S4_top;
                    round_count              <= round_count+1;
                 end else if (round_count==9) begin
                     data_out_TOP            <= data_out_temp;
                     state_AES_TOP           <= IDLE_top; 
                     busy_TOP                <= 0;
                 end else
                     state_AES_TOP           <= IDLE_top; 
                     busy_TOP                <= 0;
                end
                

                default: state_AES_TOP       <= IDLE_top;
            endcase
    end
endmodule
