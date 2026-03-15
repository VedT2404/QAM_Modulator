`timescale 1ns/1ps
module sin_cos_rom (
    input  logic [5:0] phase,
    output logic signed [15:0] sin_out,
    output logic signed [15:0] cos_out
);

localparam int N = 64;

logic signed [15:0] sin_rom [0:N-1];

initial begin
    sin_rom[0]  = 16'sd0;
    sin_rom[1]  = 16'sd3212;
    sin_rom[2]  = 16'sd6393;
    sin_rom[3]  = 16'sd9512;
    sin_rom[4]  = 16'sd12539;
    sin_rom[5]  = 16'sd15447;
    sin_rom[6]  = 16'sd18204;
    sin_rom[7]  = 16'sd20787;
    sin_rom[8]  = 16'sd23170;
    sin_rom[9]  = 16'sd25329;
    sin_rom[10] = 16'sd27245;
    sin_rom[11] = 16'sd28898;
    sin_rom[12] = 16'sd30273;
    sin_rom[13] = 16'sd31356;
    sin_rom[14] = 16'sd32138;
    sin_rom[15] = 16'sd32609;
    sin_rom[16] = 16'sd32767;   

    sin_rom[17] = 16'sd32609;   //*90°
    sin_rom[18] = 16'sd32138;
    sin_rom[19] = 16'sd31356;
    sin_rom[20] = 16'sd30273;
    sin_rom[21] = 16'sd28898;
    sin_rom[22] = 16'sd27245;
    sin_rom[23] = 16'sd25329;
    sin_rom[24] = 16'sd23170;
    sin_rom[25] = 16'sd20787;
    sin_rom[26] = 16'sd18204;
    sin_rom[27] = 16'sd15447;
    sin_rom[28] = 16'sd12539;
    sin_rom[29] = 16'sd9512;
    sin_rom[30] = 16'sd6393;
    sin_rom[31] = 16'sd3212;    

    sin_rom[32] = 16'sd0;       //#180°
    sin_rom[33] = -16'sd3212;
    sin_rom[34] = -16'sd6393;
    sin_rom[35] = -16'sd9512;
    sin_rom[36] = -16'sd12539;
    sin_rom[37] = -16'sd15447;
    sin_rom[38] = -16'sd18204;
    sin_rom[39] = -16'sd20787;
    sin_rom[40] = -16'sd23170;
    sin_rom[41] = -16'sd25329;
    sin_rom[42] = -16'sd27245;
    sin_rom[43] = -16'sd28898;
    sin_rom[44] = -16'sd30273;
    sin_rom[45] = -16'sd31356;
    sin_rom[46] = -16'sd32138;
    sin_rom[47] = -16'sd32609;
    sin_rom[48] = -16'sd32767; 

    sin_rom[49] = -16'sd32609;  //#270°
    sin_rom[50] = -16'sd32138;
    sin_rom[51] = -16'sd31356;
    sin_rom[52] = -16'sd30273;
    sin_rom[53] = -16'sd28898;
    sin_rom[54] = -16'sd27245;
    sin_rom[55] = -16'sd25329;
    sin_rom[56] = -16'sd23170;
    sin_rom[57] = -16'sd20787;
    sin_rom[58] = -16'sd18204;
    sin_rom[59] = -16'sd15447;
    sin_rom[60] = -16'sd12539;
    sin_rom[61] = -16'sd9512;
    sin_rom[62] = -16'sd6393;
    sin_rom[63] = -16'sd3212;
end


always_comb begin
    sin_out = sin_rom[phase];
    cos_out = sin_rom[(phase + 6'd16) & 6'd63];  // 90° phase shift
end

endmodule