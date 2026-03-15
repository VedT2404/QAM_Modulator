`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.03.2026 18:26:06
// Design Name: 
// Module Name: tb_bit_mapping
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


`timescale 1ns/1ps

module tb_bit_mapper;

logic clk;
logic rst;
logic bit_in;
logic bit_valid;
logic [5:0] symbol;
logic symbol_valid;
logic signed [3:0] i;
logic signed [3:0] q;
logic signed [3:0] id;
logic signed [3:0] qd;
logic signed [3:0] ip1;
logic signed [3:0] ip2;

symbol_packer packer(
    .clk(clk),
    .rst(rst),
    .bit_in(bit_in),
    .bit_valid(bit_valid),
    .symbol(symbol),
    .symbol_valid(symbol_valid)
);

bit_mapping mapper(
    .ip(symbol),
    .enable(symbol_valid),
    .i(i),
    .q(q),
    .id(id),
    .qd(qd),
    .ip1(ip1),
    .ip2(ip2)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    rst = 1;
    bit_valid = 1;

    #20
    rst = 0;
end

always @(posedge clk) begin
    bit_in <= $urandom % 2;
end

initial begin

    $monitor("time=%0t  bit=%b  symbol=%b  I=%0d  Q=%0d",
              $time, bit_in, symbol, i, q);

    #500 $finish;

end

endmodule