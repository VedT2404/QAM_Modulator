`timescale 1ns/1ps

module tb_qam_modulator_top;

logic clk;
logic rst;
logic enable;


logic bit_valid;

logic signed [23:0] wave_out;

qam_modulator_top dut(
    .clk(clk),
    .rst(rst),
    .enable(enable),
    .bit_valid(bit_valid),
    .wave_out(wave_out)
);

initial clk = 0;
always #2 clk = ~clk;

initial begin
    rst = 1;
    enable = 0;
    bit_valid = 0;

    #50;
    rst = 0;
    enable = 1;
    bit_valid = 1;

    #999999999;
    $stop;
end




endmodule