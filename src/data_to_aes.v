module data_to_aes(
     input  wire         clk,
     input  wire         reset,
     output reg  [127:0]  data_out,
     output reg  [127:0]  key_out,
     output reg           trig
     ); 

     reg [127:0] data_rom[0:4];
     reg [127:0] key_rom[0:4];
     reg [15:0] i;
     reg [15:0] counter;//5000 * 2000próbek = 10 000 000 ; zegar 10mhz => 1hz

     always @(reset)     // fs = 2kHz; f1 = 1Hz; A1 = 3000000; f2 = 50Hz; A2 = 90000
         begin 
         data_rom[0] = 128'h205B1175E79D33AADE05CE92B7A8CDC7;
         key_rom[0]  = 128'h5C9D5DDD1448A9F58A8E7BBC0273C007;
         data_rom[1] = 128'h13228AFC500B41F21F5C867EB928DCA2;
         key_rom[1]  = 128'h91409012404D8768EA97B743DA335EAF; 
         data_rom[2] = 128'h146B7545E59A99E4899D3A035256FD8A; 
         key_rom[2]  = 128'h24DF7C833BE85DAA166D8F1B0FC79EA5; 
         data_rom[3] = 128'hBDDBA76EA19FFE9BB71116868A852647; 
         key_rom[3]  = 128'h3BE398E94A4B0C355907EC553FC7EE6A; 
         end 

     always @(posedge(clk))
         begin 
             if(reset) 
                 begin 
                     data_out <= 127'b0; 
                     i <= 16'b0; 
                     counter <= 16'b0; 
                 end 
             else 
                 begin 
                     if(counter == 16'd399) 
                         begin 
                             data_out <= rom[i]; 
                             counter <=16'b0; 
                             trig=1;
                             if(i == 3) i <= 0; 
                             else i <= i + 1; 
                         end 
                     else if(counter==3) trig=0;
                     else
                         counter <= counter + 16'd1; 
                 end 
         end 

endmodule