`timescale 1 ns / 100 ps   // module timescale_check2;

module tb;
    reg clk, rst ,sample_trig_top;
    reg  [127:0] data_in ;
    reg  [127:0] key;
    wire [127:0] data_out;
    wire busy;
    
    AES_top u_top (
        .clk(clk),
        .rst(rst),
        .TOP_DATA(data_in),
        .data_out_TOP(data_out),
        .TOP_key(key),
        .busy_TOP(busy), 
        .sample_trig_top(sample_trig_top)
    );
    
    always 
        #5000  clk =  ! clk;   

    initial
    begin
        clk=0;
        rst=1;
        #15000
        rst=0;
        data_in = 128'h54776f204f6e65204e696e652054776f;
        key =     128'h5468617473206d79206d756e67204675;
        sample_trig_top=1;
        #10000
        sample_trig_top=0;
        #500000
        wait (busy == 0)
        $display("DATA_OUT = %h", data_out);
            
        
    end
endmodule
    


