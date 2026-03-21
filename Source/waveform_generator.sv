module waveform_generator(
    input  logic signed [3:0]  I,
    input  logic signed [3:0]  Q,
    input  logic signed [15:0] sin_in,
    input  logic signed [15:0] cos_in,
    output logic signed [23:0] wave_out
);

logic signed [19:0] Icos;
logic signed [19:0] Qsin;
logic signed [20:0] mix_temp;

always_comb begin
    Icos     = I * cos_in;
    Qsin     = Q * sin_in;
    mix_temp = Icos - Qsin;
    wave_out = {{3{mix_temp[20]}}, mix_temp};
end

endmodule