`timescale 1 ns / 100 ps   // module timescale_check2;
module xor_mod(
        input clk,rst,
        input [31:0] XOR_MOD_key,
        input [7:0] XOR_MOD_in_1, XOR_MOD_in_2, XOR_MOD_in_3, XOR_MOD_in_4,
        input [2:0] i,
        output reg [127:0] data_out_XOR_MOD
        );
    always@(posedge clk) begin
        if(rst)
            data_out_XOR_MOD <= 127'b0;
        else 
            case(i)
                2'b00:       data_out_XOR_MOD[127:96] <= {XOR_MOD_in_1, XOR_MOD_in_2, XOR_MOD_in_3, XOR_MOD_in_4} ^ XOR_MOD_key;
                2'b01:       data_out_XOR_MOD[95:64]  <= {XOR_MOD_in_1, XOR_MOD_in_2, XOR_MOD_in_3, XOR_MOD_in_4} ^ XOR_MOD_key;
                2'b10:       data_out_XOR_MOD[63:32]  <= {XOR_MOD_in_1, XOR_MOD_in_2, XOR_MOD_in_3, XOR_MOD_in_4} ^ XOR_MOD_key;
                2'b11:       data_out_XOR_MOD[31:0]   <= {XOR_MOD_in_1, XOR_MOD_in_2, XOR_MOD_in_3, XOR_MOD_in_4} ^ XOR_MOD_key;
                default:     data_out_XOR_MOD         <= 127'b0;
            endcase
    end
endmodule
