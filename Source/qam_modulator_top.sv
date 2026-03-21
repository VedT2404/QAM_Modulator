module qam_modulator_top(
    input  logic clk,
    input  logic rst,
    input  logic enable,
    input  logic bit_in,
    input  logic bit_valid,
    output logic signed [23:0] wave_out
);

logic [5:0] symbol;
logic       symbol_valid;

logic signed [3:0] I_next, Q_next;
logic signed [3:0] I_reg,  Q_reg;

logic [5:0] phase;
logic       symbol_tick;

logic signed [15:0] sin_out, cos_out;

packet_generator pkt (
    .clk(clk),
    .rst(rst),
    .bit_in(bit_in),
    .bit_valid(bit_valid),
    .symbol(symbol),
    .symbol_valid(symbol_valid)
);

bit_mapping mapper (
    .ip(symbol),
    .i(I_next),
    .q(Q_next)
);

phase_counter pc (
    .clk(clk),
    .rst(rst),
    .enable(enable),
    .phase(phase),
    .symbol_tick(symbol_tick)
);

always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
        I_reg <= 4'sd0;
        Q_reg <= 4'sd0;
    end
    else if (symbol_tick) begin
        I_reg <= I_next;
        Q_reg <= Q_next;
    end
end

sin_cos_rom rom (
    .phase(phase),
    .sin_out(sin_out),
    .cos_out(cos_out)
);

waveform_generator wf (
    .I(I_reg),
    .Q(Q_reg),
    .sin_in(sin_out),
    .cos_in(cos_out),
    .wave_out(wave_out)
);

endmodule