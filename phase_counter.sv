`timescale 1ns/1ps
module phase_counter #(
    parameter WIDTH = 6
)(
    input  logic clk,rst,enable,
    output logic [WIDTH-1:0] phase,
    output logic symbol_tick
);
always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
        phase <= 0;
        symbol_tick <= 0;
    end 
    else if (enable) begin
        if (phase == {WIDTH{1'b1}}) begin
            phase <= 0;
            symbol_tick <= 1;
        end 
        else begin
            phase <= phase + 1;
            symbol_tick <= 0;
        end
    end
    else begin
        symbol_tick <= 0;
    end
end

endmodule