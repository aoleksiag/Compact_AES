`timescale 1ns / 100ps
module Wh_key(
        input  wire [127:0] WH_key_inx,
        input  wire [3:0]   count,
        input  wire         reset,
        input  wire         clk,
        input  wire         first_round_enable,
        output reg  [127:0] key_out_WH
    );

    reg [31:0]   key_out_WH_temp;
    reg [7:0]    T1 [0:255];
    reg [7:0]    RC [9:0];

    wire [31:0]  key_part_in;

    always @(reset)
    begin
        T1[0] = 8'd99; T1[1] = 8'd124; T1[2] = 8'd119; T1[3] = 8'd123; T1[4] = 8'd242; T1[5] = 8'd107; T1[6] = 8'd111; T1[7] = 8'd197; T1[8] = 8'd48; T1[9] = 8'd1; T1[10] = 8'd103; T1[11] = 8'd43; T1[12] = 8'd254; T1[13] = 8'd215; T1[14] = 8'd171; T1[15] = 8'd118; T1[16] = 8'd202; T1[17] = 8'd130; T1[18] = 8'd201; T1[19] = 8'd125; T1[20] = 8'd250; T1[21] = 8'd89; T1[22] = 8'd71; T1[23] = 8'd240; T1[24] = 8'd173; T1[25] = 8'd212; T1[26] = 8'd162; T1[27] = 8'd175; T1[28] = 8'd156; T1[29] = 8'd164; T1[30] = 8'd114; T1[31] = 8'd192; T1[32] = 8'd183; T1[33] = 8'd253; T1[34] = 8'd147; T1[35] = 8'd38; T1[36] = 8'd54; T1[37] = 8'd63; T1[38] = 8'd247; T1[39] = 8'd204; T1[40] = 8'd52; T1[41] = 8'd165; T1[42] = 8'd229; T1[43] = 8'd241; T1[44] = 8'd113; T1[45] = 8'd216; T1[46] = 8'd49; T1[47] = 8'd21; T1[48] = 8'd4; T1[49] = 8'd199; T1[50] = 8'd35; T1[51] = 8'd195; T1[52] = 8'd24; T1[53] = 8'd150; T1[54] = 8'd5; T1[55] = 8'd154; T1[56] = 8'd7; T1[57] = 8'd18; T1[58] = 8'd128; T1[59] = 8'd226; T1[60] = 8'd235; T1[61] = 8'd39; T1[62] = 8'd178; T1[63] = 8'd117; T1[64] = 8'd9; T1[65] = 8'd131; T1[66] = 8'd44; T1[67] = 8'd26; T1[68] = 8'd27; T1[69] = 8'd110; T1[70] = 8'd90; T1[71] = 8'd160; T1[72] = 8'd82; T1[73] = 8'd59; T1[74] = 8'd214; T1[75] = 8'd179; T1[76] = 8'd41; T1[77] = 8'd227; T1[78] = 8'd47; T1[79] = 8'd132; T1[80] = 8'd83; T1[81] = 8'd209; T1[82] = 8'd0; T1[83] = 8'd237; T1[84] = 8'd32; T1[85] = 8'd252; T1[86] = 8'd177; T1[87] = 8'd91; T1[88] = 8'd106; T1[89] = 8'd203; T1[90] = 8'd190; T1[91] = 8'd57; T1[92] = 8'd74; T1[93] = 8'd76; T1[94] = 8'd88; T1[95] = 8'd207; T1[96] = 8'd208; T1[97] = 8'd239; T1[98] = 8'd170; T1[99] = 8'd251; T1[100] = 8'd67; T1[101] = 8'd77; T1[102] = 8'd51; T1[103] = 8'd133; T1[104] = 8'd69; T1[105] = 8'd249; T1[106] = 8'd2; T1[107] = 8'd127; T1[108] = 8'd80; T1[109] = 8'd60; T1[110] = 8'd159; T1[111] = 8'd168; T1[112] = 8'd81; T1[113] = 8'd163; T1[114] = 8'd64; T1[115] = 8'd143; T1[116] = 8'd146; T1[117] = 8'd157; T1[118] = 8'd56; T1[119] = 8'd245; T1[120] = 8'd188; T1[121] = 8'd182; T1[122] = 8'd218; T1[123] = 8'd33; T1[124] = 8'd16; T1[125] = 8'd255; T1[126] = 8'd243; T1[127] = 8'd210; T1[128] = 8'd205; T1[129] = 8'd12; T1[130] = 8'd19; T1[131] = 8'd236; T1[132] = 8'd95; T1[133] = 8'd151; T1[134] = 8'd68; T1[135] = 8'd23; T1[136] = 8'd196; T1[137] = 8'd167; T1[138] = 8'd126; T1[139] = 8'd61; T1[140] = 8'd100; T1[141] = 8'd93; T1[142] = 8'd25; T1[143] = 8'd115; T1[144] = 8'd96; T1[145] = 8'd129; T1[146] = 8'd79; T1[147] = 8'd220; T1[148] = 8'd34; T1[149] = 8'd42; T1[150] = 8'd144; T1[151] = 8'd136; T1[152] = 8'd70; T1[153] = 8'd238; T1[154] = 8'd184; T1[155] = 8'd20; T1[156] = 8'd222; T1[157] = 8'd94; T1[158] = 8'd11; T1[159] = 8'd219; T1[160] = 8'd224; T1[161] = 8'd50; T1[162] = 8'd58; T1[163] = 8'd10; T1[164] = 8'd73; T1[165] = 8'd6; T1[166] = 8'd36; T1[167] = 8'd92; T1[168] = 8'd194; T1[169] = 8'd211; T1[170] = 8'd172; T1[171] = 8'd98; T1[172] = 8'd145; T1[173] = 8'd149; T1[174] = 8'd228; T1[175] = 8'd121; T1[176] = 8'd231; T1[177] = 8'd200; T1[178] = 8'd55; T1[179] = 8'd109; T1[180] = 8'd141; T1[181] = 8'd213; T1[182] = 8'd78; T1[183] = 8'd169; T1[184] = 8'd108; T1[185] = 8'd86; T1[186] = 8'd244; T1[187] = 8'd234; T1[188] = 8'd101; T1[189] = 8'd122; T1[190] = 8'd174; T1[191] = 8'd8; T1[192] = 8'd186; T1[193] = 8'd120; T1[194] = 8'd37; T1[195] = 8'd46; T1[196] = 8'd28; T1[197] = 8'd166; T1[198] = 8'd180; T1[199] = 8'd198; T1[200] = 8'd232; T1[201] = 8'd221; T1[202] = 8'd116; T1[203] = 8'd31; T1[204] = 8'd75; T1[205] = 8'd189; T1[206] = 8'd139; T1[207] = 8'd138; T1[208] = 8'd112; T1[209] = 8'd62; T1[210] = 8'd181; T1[211] = 8'd102; T1[212] = 8'd72; T1[213] = 8'd3; T1[214] = 8'd246; T1[215] = 8'd14; T1[216] = 8'd97; T1[217] = 8'd53; T1[218] = 8'd87; T1[219] = 8'd185; T1[220] = 8'd134; T1[221] = 8'd193; T1[222] = 8'd29; T1[223] = 8'd158; T1[224] = 8'd225; T1[225] = 8'd248; T1[226] = 8'd152; T1[227] = 8'd17; T1[228] = 8'd105; T1[229] = 8'd217; T1[230] = 8'd142; T1[231] = 8'd148; T1[232] = 8'd155; T1[233] = 8'd30; T1[234] = 8'd135; T1[235] = 8'd233; T1[236] = 8'd206; T1[237] = 8'd85; T1[238] = 8'd40; T1[239] = 8'd223; T1[240] = 8'd140; T1[241] = 8'd161; T1[242] = 8'd137; T1[243] = 8'd13; T1[244] = 8'd191; T1[245] = 8'd230; T1[246] = 8'd66; T1[247] = 8'd104; T1[248] = 8'd65; T1[249] = 8'd153; T1[250] = 8'd45; T1[251] = 8'd15; T1[252] = 8'd176; T1[253] = 8'd84; T1[254] = 8'd187; T1[255] = 8'd22;
        RC[0] = 8'b00000001; RC[1] = 8'b00000010; RC[2] = 8'b00000100; RC[3] = 8'b00001000; RC[4] = 8'b00010000; RC[5] = 8'b00100000; RC[6] = 8'b01000000; RC[7] = 8'b10000000; RC[8] = 8'b00011011; RC[9] = 8'b00110110;
    end
    assign key_part_in = WH_key_inx[31:0];
    
    always @(posedge clk)begin
        if(reset)
            key_out_WH_temp <= 0;
        else begin
           //////////////////g_func//////////////////////////////////////
            key_out_WH_temp[31:24] <= T1[key_part_in[23:16]]^RC[count];
            key_out_WH_temp[23:16] <= T1[key_part_in[15:8]];
            key_out_WH_temp[15:8]  <= T1[key_part_in[7:0]];
            key_out_WH_temp[7: 0]  <= T1[key_part_in[31:24]];
            /////////////////////////////////////////////////////////////
        end
    end
    always @(*) begin
        if(first_round_enable) begin
            key_out_WH = WH_key_inx;
       end else begin
            key_out_WH[127:96] = WH_key_inx[127:96] ^ key_out_WH_temp[31:0];
            key_out_WH[95:64]  = WH_key_inx[95:64]  ^ key_out_WH[127:96];
            key_out_WH[63:32]  = WH_key_inx[63:32]  ^ key_out_WH[95:64];
            key_out_WH[31:0]   = WH_key_inx[31:0]   ^ key_out_WH[63:32];
       end
    end
 
endmodule
