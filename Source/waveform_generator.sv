`timescale 1ns/1ps
module waveform_generator (
    input  logic signed [3:0] I,[3:0] Q,
    input  logic signed [15:0] sin_in,[15:0] cos_in,
    output logic signed [23:0] wave_out
);
logic [3:0] i,q;
bit_mapping bmp (.I(i), .Q(q));
always_comb begin
    wave_out = (I * cos_in) - (Q * sin_in);
end
endmodule