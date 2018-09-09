`timescale 1 ns / 100 ps   // module timescale_check2;
module SR_mod(
        input reset,first_round_enable,
        input [127:0] SR_data,
        input [2:0] i,
        output reg [7:0] out_1_SR,out_2_SR,out_3_SR,out_4_SR
        );
        
    always@(*)begin
        if(reset)  begin
            out_1_SR <= 0;
            out_2_SR <= 0;
            out_3_SR <= 0;
            out_4_SR <= 0;
        end else begin
            case (i)
                2'b00: begin
                    if(first_round_enable) begin
                        out_4_SR <= SR_data[103:96];
                        out_3_SR <= SR_data[111:104];
                        out_2_SR <= SR_data[119:112];
                        out_1_SR <= SR_data[127:120];
                        
                    end else begin
                        out_1_SR <= SR_data[127:120];
                        out_2_SR <= SR_data[87:80];
                        out_3_SR <= SR_data[47:40];
                        out_4_SR <= SR_data[7:0];
                    end
                end
                        
                2'b01: begin
                    if(first_round_enable) begin
                        out_4_SR <= SR_data[71:64];
                        out_3_SR <= SR_data[79:72];
                        out_2_SR <= SR_data[87:80];
                        out_1_SR <= SR_data[95:88];
                    end else begin
                        out_1_SR <= SR_data[95:88];
                        out_2_SR <= SR_data[55:48];
                        out_3_SR <= SR_data[15:8];
                        out_4_SR <= SR_data[103:96];
                    end
                end
                
                
                2'b10: begin
                    if(first_round_enable) begin
                        out_4_SR <= SR_data[39:32];
                        out_3_SR <= SR_data[47:40];
                        out_2_SR <= SR_data[55:48];
                        out_1_SR <= SR_data[63:56];
                    end else begin
                        out_1_SR <= SR_data[63:56];
                        out_2_SR <= SR_data[23:16];
                        out_3_SR <= SR_data [111:104];
                        out_4_SR <= SR_data[71:64];
                    end
                end
                
                2'b11: begin
                    if(first_round_enable) begin
                        out_4_SR <= SR_data[7:0];
                        out_3_SR <= SR_data[15:8];
                        out_2_SR <= SR_data[23:16];
                        out_1_SR <= SR_data[31:24];
                    end else begin
                        out_1_SR <= SR_data[31:24];
                        out_2_SR <= SR_data[119:112];
                        out_3_SR <= SR_data[79:72];
                        out_4_SR <= SR_data[39:32];
                    end
                end
                
                default: begin
                    out_1_SR <= 0;
                    out_2_SR <= 0;
                    out_3_SR <= 0;
                    out_4_SR <= 0;
                end
            endcase
       end
  end //always
      
endmodule


