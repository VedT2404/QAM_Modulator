`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.03.2026 19:06:02
// Design Name: 
// Module Name: packet_generator
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



module symbol_packer(
    input  logic clk,
    input  logic rst,
    input  logic bit_in,
    input  logic bit_valid,
    output logic [5:0] symbol,
    output logic symbol_valid
);

logic [5:0] buffer;
logic [2:0] count;

always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
        buffer <= 0;
        count <= 0;
        symbol <= 0;
        symbol_valid <= 0;
    end

    else begin
        symbol_valid <= 0;
        if (bit_valid) begin
            buffer <= {buffer[4:0], bit_in};
            count <= count + 1;
            if (count == 3'd5) begin
                symbol <= {buffer[4:0], bit_in};
                symbol_valid <= 1;
                count <= 0;
            end

        end

    end

end

endmodule