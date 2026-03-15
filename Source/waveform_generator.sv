`timescale 1ns/1ps
module waveform_generator (
    input  logic signed [3:0] I,Q,
    input  logic signed [15:0] sin_in,cos_in,
    output logic signed [23:0] wave_out
);

always_comb begin
    wave_out = (I * cos_in) - (Q * sin_in);
end

endmodule