`timescale 1 ns / 100 ps   // module timescale_check2;

module tb;
    reg clk, rst ,sample_trig_top;
    reg  [127:0] data_in ;
    reg  [127:0] key;
    wire [127:0] data_out;
    wire busy;
    integer f;
    AES_top u_top (
        .clk(clk),
        .reset(rst),
        .TOP_DATA(data_in),
        .data_out_TOP(data_out),
        .TOP_key(key),
        .busy_TOP(busy), 
        .sample_trig_top(sample_trig_top)
    );
    
    always 
        #5  clk =  ! clk;   

    initial
    begin
        f = $fopen("output.txt","w");
        clk=0;
        rst=1;
        #30
        rst=0;
        #100
            data_in = 128'h205B1175E79D33AADE05CE92B7A8CDC7; 
        key     = 128'h5C9D5DDD1448A9F58A8E7BBC0273C007; 
        sample_trig_top=1;
        #100
            sample_trig_top=0;
        wait (busy == 0) 
            #100
            if (data_out ==128'h1FEFBD5FEDEF8ACE57AF64996F2B4D3C) begin 
            $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'h13228AFC500B41F21F5C867EB928DCA2; 
    key     = 128'h91409012404D8768EA97B743DA335EAF; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'hF161B99847DB5E22BEA44C11E8187DB3) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'h146B7545E59A99E4899D3A035256FD8A; 
    key     = 128'h24DF7C833BE85DAA166D8F1B0FC79EA5; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'h373ACC96DB581F2CCCA368AA0583D5E4) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'hBDDBA76EA19FFE9BB71116868A852647; 
    key     = 128'h3BE398E94A4B0C355907EC553FC7EE6A; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'hEF1EA7AE1A23412CF97510224A528CAE) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'h09522B0AA41076DE06741BDD07769273; 
    key     = 128'h9910195FB52C683498E50FFF9D521953; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'hF04C90D144D1E2EE582AAF8B4F4F912E) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'h134D8FE97193CF4024F89D93606C7188; 
    key     = 128'h930F853ED3FA3C73F483A578E83A46A0; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'h14F55DB3C44DC14B45B5674C2DE9075A) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'hDF66101EE3D61D99F97643543E82FD50; 
    key     = 128'h624D843B1909817D17A7DCD2F0F490C5; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'h9B924A58EC47858938CE9CC529C59724) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'h0B69856818256137CCE58990DB50D60D; 
    key     = 128'h0FCF62E39A563E45A235BEF738DC537E; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'h78C7C8ADF0497E00C18C7AACF9116B71) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'h6D55CBB9493B139C089A81EABBD0C667; 
    key     = 128'hC6475E0ADFA79FF762DBD8026927E8C1; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'h27A4F8A03CADE0951B8FE7651CE31D7C) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'h9058298F8CEDE6EC57892E19C7C4E42D; 
    key     = 128'hB395B4008BB1F19A1E09BC6D4D89A30F; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'h7B8AFE261F9548D70BBBC05FC6BEB719) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'hBD076C862B9EBD21312D04CD9084310D; 
    key     = 128'h6AE423C3C0AC02FD5CB6FC0ADBC09580; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'h1C68A8364F911F742162562B12F8001A) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'h55E3AFCC85EE82418959ED1A463AE493; 
    key     = 128'h0EA1ACB1A8553FBDD8E8EF965E440074; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'hCCC79A6AA3FB175F787D62C403EE2396) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'hFDF6B985B71534B9057857C2AC0DF660; 
    key     = 128'h50FBAA5546C6399FD5346010678D4EEE; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'h30A0454C2C1F0445961A3F34248734AE) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'h8FF4E232B496942A25A32ACCC1A3351D; 
    key     = 128'h9ED4138F3898F7191AAB5F63664BE27A; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'h7F6B6ABD28FDAECF0D48D70334638089) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'h10A0A3C3C7BCB7C551C5F3E749768C71; 
    key     = 128'h221469DAF9EF41B1BF82922CC0A021F7; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'h6D4AD70757FC001CC7603AEECCAFD10B) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'h1C2A465BFF635DEC9B96A8D35049184E; 
    key     = 128'h9733093B228340667E01C687F5CB0454; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'h393BA81C26AFEBCD085A28466038B431) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'h29C4B6EAEEE79AD8A9A7551A5AFDB5DD; 
    key     = 128'h0571AE75FC76638F499A4F30498907E7; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'h192B7125B6183844A6718BC47A234B19) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'hF4DF5BDC1426C7D0ACC15C441674A22B; 
    key     = 128'h1E70DDA1056009532CDF3B5D5673070F; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'h75E2163F7D6614446A5705D02105EF64) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'h8D492575D2D0042AB7474928E464409F; 
    key     = 128'hAF0260135E8975015D29A45263E2ACF2; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'h82DEF672868DC88086B66024EB1862A6) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'h1C4628AECEE404887225D59D17D2F263; 
    key     = 128'h3590120DC7449B58A0CFF9574D85C355; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'h0CA3814D046C3EA6C9D1AF0C3787064B) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'h558C1ED480DC907DE78794A9382FDCA5; 
    key     = 128'h268D29662F20C363E27FE8C6789A3220; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'hDD8F1AA8B33BFE69C1B6204884ABFB94) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'h9C4DD5A946D5A76398FCD9DF340843CA; 
    key     = 128'h70BC0B5EE4FECA8BD2C7C97C557ED3AD; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'h60B6ACF75CDA564AA1E08EDE86BFF54A) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'hA67A3D45552F4FE8080B859FE78F5E9E; 
    key     = 128'hAE3DEF35C69A163BEF976CD641C4E556; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'h79A5A302D481228E2A93D167F23AC2CE) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'h60CFACD10483D7F85236ED58B7978FC1; 
    key     = 128'h1630B8E98C18F3EE5FC8F55DB1CC190B; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'h49AE7FB6BE518454F6162C2D2B3E8F82) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'h99B658D782CAE949E326A6317E0BA20F; 
    key     = 128'hA83AB908C4B45493445DF1FAD397907F; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'h49A8BDF43355E4FC395AC95CBA09BFB9) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'h0E98A5F3797F2EE96D3ADE0778540455; 
    key     = 128'h83D7B09F2DD7C2B0290BAA58E7E8B083; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'h39E6900012BBDC92537A808D55E5FA8D) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'hF3556AF526B9296C46CA9DABABAE64B9; 
    key     = 128'h56BFA1939DD61C4C87D3461A594B6435; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'h804274B8343F6B077110F18AE247ABB5) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'hEC3133DAECB21AEC623AECCD7522B41C; 
    key     = 128'hD1839A696D5F96690E3D5B8059F312EE; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'h341996EB5DB8570E13D256349DFAA8FC) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'h25A0CB6F0C94400F18A687C4A654C928; 
    key     = 128'hA6B10BFB583999A7F055806148EBCF20; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'h09F6BAE1F8FA0A13510FD71933929A37) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'hAFAD21D7F139C99DBA7E56BE81377343; 
    key     = 128'h6AA802C3BEEB82858E103B8D69214B3D; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'h314A0CDC39510D26972872ECF81C7E15) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'h959E1A71C291F146F3B5C7806448B361; 
    key     = 128'hE3EF408BB06634833AB0A894E03EE7DA; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'h8FA72E9F92AA13C6C152FE8808268ABF) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'h0878C3A04F6F3CB253914473A04A2C17; 
    key     = 128'hA1EB855653A51AF8A8050931C45014B8; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'h0AE342469C8A8BB4080E7E1DC79E6E18) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'h6E9259B5606D380A0DDBF8FC0158C172; 
    key     = 128'hEA14D4C797646C7F90DE56F3283F3C3A; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'hCD702CAEABFB4DF657C540ED352960F9) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'h58036336F7FBC29E38A2ABF13A52FFEE; 
    key     = 128'h42E622D6EE601F947D25CD7897AEBF45; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'h8B3F8AE570277DB032A1524B442D0D5A) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'h18EEE105AF941C09537FEE97E6135076; 
    key     = 128'hB23F7AC7C5DDA03671492EF000AEFECE; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'h866E1069C5C792910FF704294448EC61) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'h7A2D2789D5F83330A0A24120D1C98CB0; 
    key     = 128'h968D967276FEBE09935DE349874C6FFB; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'h368E2A81E73367076AF8F6D8754CCB75) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'h180FA1514D76D4122C34BAC2EF9B5400; 
    key     = 128'hF7E51F5ECB9B4B91448F7EF414F8F4E6; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'h9481423DB75AD434F68C55961D7489D4) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'h262CA80E0E04BB0843F85830B76FA7DC; 
    key     = 128'h7B5097590C12F8C01EE4FD4BBE300CC7; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'h56B6C3B123F30BC887519F6E8FA74A0D) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'h6F0E1B46ACDB9BF5037B4B66F3D56C50; 
    key     = 128'hC859D102F062AC70D2249470235C0B13; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'hEEC7ABAFC07E69FBD70B2614C41A189F) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'hDA89E6C9B835F9A23B7577DE3C702FE7; 
    key     = 128'hF12C4B152C3B37610CDF01D24DD48127; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'h013847286140B6241A1812D67150AC85) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'h63F3D62C6F45509C65349F4C515DA233; 
    key     = 128'hFDD3E4AE3D06FA92E6B110AF92CEB2F6; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'h9A5FE5C6B3EFD781E73E09BBFE43E6CE) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'h15D854DBFE4429449BC573C01B5A4C5C; 
    key     = 128'h998B0AB5806D7929C1F7924918BB94B6; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'hAFAFED02912A466DE635B3DC7650CAC7) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'hFE77B9168D4C33B22898D440A7CF6A23; 
    key     = 128'hB71518E985AF99A7756C521FEFC00CB9; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'h4AC7CED27CC34469B9F2D5F1273BCBD1) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'h3FD565027C12A71E2ADD22AB7E52732F; 
    key     = 128'hA1D674F5669E24380B82C3117B50E8BF; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'hC1705F5502F2F5CCEE0CEEB78F016F7B) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'h35A90A70176691A6449F8FCAD29A11A9; 
    key     = 128'h168FEF2A53CFA7015175CC0646B063FF; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'h5D8958265AC905BE664AEBE7D6E19E73) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'h18E67A319EAA6CEE4E4E237EEC29AC17; 
    key     = 128'h3A3D37E8729844CC7870462A1626B75B; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'hF9B5E94DA3F7C2F41D8D04B833D86081) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'h5F72CD7386A5CC6945ED7656FCBECB48; 
    key     = 128'h02C919A888A131323C0285865579AB45; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'h9A3105BEA661A380CD456C218A5E92A7) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'h2F2BB8DA907142F2C77C76ACC146D514; 
    key     = 128'hB7D5F322EE66B307FEFC21BDDF9D5662; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'hACD2D9D73E031B7BD20A0B6BC33AE9FB) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'h6F015E714D024D94CD1EC09A32A41435; 
    key     = 128'hDD2CA660847A2CBEB3D9A8B30A5437FA; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'hAB617E1E5A693D4B981C0CC884776E75) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'h9C84428C504F694FFD8BE1D2EBDE66E8; 
    key     = 128'hFB3FB61D38F8F1032873431A6D875A98; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'h50FD703AC6EC413EDC07E2AA2DA94574) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'h0B984BC718071C875FD86440584D06DC; 
    key     = 128'h2266EB8B5371AC33A09BB392B9144D2D; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'h3642ADACEA00F956105A66252F28B098) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'hDAE4F63B5CBF6544EFEFFC2FA399217A; 
    key     = 128'hA745356AD180D419CA9198C284DEFF4B; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'h7693F09AB7E2352504AFC9C9AE1103CC) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'h3AABCA3B0DFD8E422D47CEFAC77F1ADB; 
    key     = 128'h212E538BAF925DECD4E0D93041CFEA23; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'h4CC8602F473C656303415CDC9E4AFFAF) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'hBA1E59492CEC0D02E83EEF9BD5006EDF; 
    key     = 128'h05D07DC5D2DC318CD3B496E4CA8F406E; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'hCDF454173840CC6B066A4BA5BDD2B009) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'h573F4924D0AA6DF7A9E24B7E074DC8D6; 
    key     = 128'h112DBA3D3860EF9A5D504BE7352BF5AC; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'h0CC237FA61300E37869DE2BF07CA7A4D) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'hB3D1DBFE097A482B3FD9F4887A06BD64; 
    key     = 128'h6B7B70024627E3C8BA15AFFBE7E32164; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'h4BA4CC110610CAE621E3CA78242F4728) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'h060E8568A815BAE638CFE0A990F4288D; 
    key     = 128'h9963B0136E38779D403CB3B570FD566A; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'h9FC12BF8F03870FA8838ADC359C4B352) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'hDD7FB875CB240003B44418C285ABA63B; 
    key     = 128'h08E435B22CE3F0703CB1530B53F379AA; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'h69248282DD257E674CDFF3CEF23CF091) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'h80B5419696796EFECA0990255AB181AF; 
    key     = 128'hCD6F8E13AC8853C34422743BAD8298C6; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'hBC7B755688F385BAC4E247398BFFC3D4) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'hD496D5D66E24ED0C425D395F08EFBE20; 
    key     = 128'h51A9051D56CA9BA2B2B08AE714A0524A; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'h361F7CE33420EE52BA98A8C3DA5FA607) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'h634A928F270A68F80EA191BFE1CB0DF6; 
    key     = 128'h83FA979D47BBCCD46CC9824F5655CD67; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'h955301307BA9EC80DDB2B52D76A3794C) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'h54DB89BDD9F222210EFBDE49F5F22F0F; 
    key     = 128'h6AA2C9BD717ECB3D8877AE7F2FC1AB4A; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'hE57115AA44E4A801BFA47D89FDC63710) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'h47AD5ACAAF6BA231BFBCF45707906B50; 
    key     = 128'h0B2BE61A77AEA886836BAF4F63A25D76; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'h2A2DC40A0463C94069B465BB11C35A04) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'h1EF1BF025BD89685F78F08D670943530; 
    key     = 128'h3A227E4F9DA51A95742EA0A46516DE18; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'h8F94F31911EDC1C45AF38393FCC47432) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'hBB77A4A9ACED2D3302466564D4AD0408; 
    key     = 128'hAAA1508F20ADD3F2384D96302726BF24; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'h82D80D4EB670A9C28369143C4FD6492E) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'h0C745B388CBCF8047C1D9B24EDB035A9; 
    key     = 128'hCEAACD06B5DE1ABCAD09143C879D3C0A; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'hE865D73A8F8175E834E14CCEE91DA0B0) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'h7CF63FC2D2A32FEECB7EE3A14AB4D241; 
    key     = 128'h81DCC2AC95EC05077C746DDF4B3FC6CE; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'hAF77A5B12ADFAE790EE69F2898B47C70) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'hA1618058B398BC74EDA38DCD33C3A7BB; 
    key     = 128'hCC3B748A4AEE975F8273750BAB0491A2; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'h37AB48D93F4B1D05937A956FB16C41AF) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'hAAB6A3AD39EDAC15483AACB3B99517ED; 
    key     = 128'hE21F72A50F2B83AA39E93FA5D505EB8D; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'h188CB1AF950CDEE250D0CBEB5D03EC8C) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'h86BF30B6AE877ED3875BB7A48302D4C9; 
    key     = 128'h332050FAD3B0308F34CE8C340091E4C6; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'hB8147D476FAC1C0650193B13826A157F) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'h27A4180E76D71D50ADFD4669A00B3371; 
    key     = 128'h5F5AEEBCC10B2A459BFCC1F337042EB7; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'hC5E064F0D9134D0DAB02CBF87B52BB8D) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'h63BF29761856254857449BB3AE6E95C8; 
    key     = 128'hD8D6958761426051D1DEC60504E0A13A; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'h2BB97A35BF0E8B00165B7120ED193EC3) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'hEC893D1B18CFDD5384DBD7B702818CB2; 
    key     = 128'h494C558B234F83FA385A429558310646; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'h152FB83EE6F518610AD1397C2299E019) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'h066B14E6648DCCCBEB0889803BFC0F58; 
    key     = 128'hE1571412F750CADC0205B586111E12A9; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'h407C0C843886D22104E2FAB0C1735A7C) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'hA2CD6F9BF041FDE538F381C40752A128; 
    key     = 128'h21BE4566C42260573DFDA35BC80DCCFB; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'hAA36B6EC4981E156C85FCB67F270B7C1) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'h4FE04D57A7C16B0845551AE797F3E2B0; 
    key     = 128'h9D16972B113E4C0E30110D125060BD99; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'h09DFD07EDDE94F417745AC6C1DC2ABE1) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'h392C098572C18ED66F27E091FB594114; 
    key     = 128'h6421EFE0CE585CE33ED3C180D9CA8082; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'h95F76A89E7E7BCF8AD2E017AD7D5E61F) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'hA2158BA41B9F465D12AD3DB98DD223B8; 
    key     = 128'h0E9D9BDA450FB26C151F38028FBD6432; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'h4430FCD8776EBEBC0DBDB62A0932B85E) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'h0F7D26126415ECF4F5108E3359D53736; 
    key     = 128'hAB62C57CC93C143457589CE7C9F8B604; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'hF27B5A001406AEA73C6D14B96CC811F6) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'h1CE8784F43E84410F2F4863723DF7F14; 
    key     = 128'h89DA55017CAE91EDA08445E8D370B49B; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'h15CDEA007FD8DB6EE60D52B4873006E5) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'h07041F9F4FC7481C1AA9EE0579172B49; 
    key     = 128'h3ED88C96BEEA1AE7C9C4C52DD51C1DF8; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'h45F5EA5C2D79CC8CA6F5F3BC3F1DF8FA) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'hD9B94F64FA8132448D454F60ACF56D9C; 
    key     = 128'h993E66A71E8453DC89F6448E3F437F91; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'h30D339C36BC33C55DE45AB0E99426A1B) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'hE1179BECFD9D070837F4CC4F449BDF0E; 
    key     = 128'hCE2950610FAA2692B5412E0AF71FA5E5; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'h16045AFC81F78A77AD73C53E0B7B1AF0) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'hDB13336826268B135CF66B590A5F7063; 
    key     = 128'hC27B17C6D3BBD6F5EE11A6983727E0A3; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'hAF78533D9BFF6CB24B204DC57FD22DFD) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'hC318609FE87CFA59FDBDBB66E1F20F87; 
    key     = 128'hD520A81B9F9B9384FBE5AA6F38F01B2A; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'hB3F3EB81F188E7D58C5A0DADB02B1EFD) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'h039BA8135ABD04E1CF06EE677BF0C824; 
    key     = 128'h12170E933E2072AE244087C4B77094B6; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'h9CB5998675A2EA9A14BF762D3A200B11) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'h64A3105002E151CCCF31109A29C16D4D; 
    key     = 128'hB1217F86DA3438589216A1BDCCBCE130; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'h937997D5E6FB5A3EBA99D8133FDE7661) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'h71A049EB4FC7769A991D45844FC7069A; 
    key     = 128'h525CEF3EEC142170202270F172782BB5; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'hB2BCE735E40D42D273F1D4DC8BE4096B) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'hE9EAEDB18AA037DC2005529D4F46D4B8; 
    key     = 128'h697A7FB301698B8D01C624E7043107C3; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'h2B13F4A1E7BF3888575ECF9629239F05) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'hC362002B8397971F08864E113E35BED2; 
    key     = 128'hD21F0702266B4795142BD731F19F3E28; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'h430F6D3DE47AEB81A98AC28097835F72) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'hFA4808E5B8C2312BD9A826A5DAC7F716; 
    key     = 128'h18A7DDC29E760217F0230A2FDA7E46FD; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'hFC3FA4B78DC905AFB951D2BFBDF1048B) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'h44C427E4846BF3E4C604137C91214565; 
    key     = 128'h54375D2AF1051F45E4E8F549F746286F; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'h249EBABFF145D8E1F62DDCFC13AA1576) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'h9D03668A53E0656D6CB1BB7F97F42F4A; 
    key     = 128'h6C7209FAE94AC7E177741821423A109F; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'h0BD52B1935DF86FC453DFB16B5BD8FD7) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'h304CA81439B38F8772981A39C69E7AD3; 
    key     = 128'h23F43C014FB1D991DB624E5FA46E4750; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'hEB7E908491DDCBB38DD8F12B7C591726) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'h2588D5E23376B9CB898737DC75A06661; 
    key     = 128'hBE11BEB82AE130E1D735D7B778F0CE52; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'hEF3B447525EBED6D754ADA0614B0B639) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'h311FF27087C6801C6E07F6BEC48AED05; 
    key     = 128'hB77D24A1B4A69E7CEA6D82461EC32B35; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'h8ED5B98951B7B5787B9945CF997CBD7A) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'h9B98686D59204A750F56FBA583E12A41; 
    key     = 128'h9978B8981F8B15AD7F1356C0E1603FA8; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'hD0054F709FD62C4431FAFDF857DB93A3) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'h4702AB41F84D8B8D42CF80F2497F3620; 
    key     = 128'h284C3AFA9E7E98212687B7E476ECE01D; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'hD1718E37A979232BA52E9F5D5926005C) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'h77C0B4D1F6A3F9668DDAE00D527C5E44; 
    key     = 128'h925F74ED0AE2036282F57A634E76B4F0; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'hE2607196B7D75222BDD8A7E33B85C0F9) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        #100
        data_in = 128'hE8E78E273C4F9610309D2216483831EA; 
    key     = 128'hBE950E016889B53D017D1F5068A1A718; 
    sample_trig_top=1;
    #100
        sample_trig_top=0;
    wait (busy == 0) 
        #100
        if (data_out ==128'hFA4723B684FEA4DF817E664A63B2B694) begin 
        $fwrite(f,"ok\n");
    end else begin
        $fwrite(f,"fail\n");
    $fclose(f);
    $finish;
    end
        
        $fclose(f);
        $stop;
    end
endmodule
    


