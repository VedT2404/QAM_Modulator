`timescale 1ns/1ps
module qam_modulator_top(

    input  logic clk,rst,enable,
    output logic signed [23:0] wave_out

);

logic [5:0] ip;

logic signed [3:0] I,Q;
logic [2:0] ip1,ip2;
logic [5:0] phase;
logic symbol_tick;

logic signed [15:0] sin_out,cos_out;

packet_generator pkt_gen (
    .clk(clk),
    .rst(rst),
    .enable(enable),
    .ip(ip));

bit_mapping mapper (
    .ip(ip),
    .enable(enable),
    .i(I),
    .q(Q),
    .ip1(ip1),
    .ip2(ip2));

phase_counter phase_counter (
    .clk(clk),
    .rst(rst),
    .enable(enable),
    .phase(phase),
    .symbol_tick(symbol_tick));

sin_cos_rom carrier_rom (
    .phase(phase),
    .sin_out(sin_out),
    .cos_out(cos_out));

waveform_generator waveform_gen (
    .I(I),
    .Q(Q),
    .sin_in(sin_out),
    .cos_in(cos_out),
    .wave_out(wave_out));

endmodule