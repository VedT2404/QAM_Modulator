module phase_counter(
    input  logic clk,rst,enable,
    output logic [6:0] phase,
    output logic symbol_tick
);

always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
        phase <= 6'd0;
        symbol_tick <= 1'b0;
    end
    else if (enable) begin
        if (phase == 6'd63) begin
            phase <= 6'd0;
            symbol_tick <= 1'b1;
        end
        else begin
            phase <= phase + 1'b1;
            symbol_tick <= 1'b0;
        end
    end
    else begin
        symbol_tick <= 1'b0;
    end
end

endmodule