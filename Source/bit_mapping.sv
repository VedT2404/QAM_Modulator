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
    input  logic enable,
    output reg signed [3:0] i,
    output reg signed [3:0] q,
    output logic [2:0] ip1,ip2

);

assign ip1 = ip[5:3];
assign ip2 = ip[2:0];
always_comb begin
i=0;
q=0;


    if(enable) begin
        i = (ip1 <<< 1) - 7;
        q = (ip2 <<< 1) - 7;
    end
end

endmodule