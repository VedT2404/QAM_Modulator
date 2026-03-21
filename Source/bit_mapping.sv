`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.03.2026 18:13:37
// Design Name: 
// Module Name: bit_mapping
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

module bit_mapping(
    input  logic [5:0] ip,
    output logic signed [3:0] i,
    output logic signed [3:0] q
);

logic [2:0] i_bits;
logic [2:0] q_bits;

always_comb begin

    i_bits = ip[5:3];
    q_bits = ip[2:0];

    case(i_bits)
        3'd0: i = -7;
        3'd1: i = -5;
        3'd2: i = -3;
        3'd3: i = -1;
        3'd4: i =  1;
        3'd5: i =  3;
        3'd6: i =  5;
        3'd7: i =  7;
    endcase

    case(q_bits)
        3'd0: q = -7;
        3'd1: q = -5;
        3'd2: q = -3;
        3'd3: q = -1;
        3'd4: q =  1;
        3'd5: q =  3;
        3'd6: q =  5;
        3'd7: q =  7;
    endcase

end

endmodule