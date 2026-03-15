`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.03.2026 18:29:36
// Design Name: 
// Module Name: tb_qam_modulator_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module tb_qam_modulator_top;

logic clk,rst,enable;
logic signed [23:0] wave_out;

qam_modulator_top dut (
.clk(clk),
.rst(rst),
.enable(enable),
.wave_out(wave_out));

initial begin
clk = 0;
forever #5 clk = ~clk;   // 100 MHz clock
end

initial begin
rst = 1;
enable = 0;

#50;
rst = 0;
enable = 1;

#100000;

$stop;

end

endmodule
