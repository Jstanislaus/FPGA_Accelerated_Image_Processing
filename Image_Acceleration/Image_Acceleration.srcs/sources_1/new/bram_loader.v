`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.08.2025 18:31:56
// Design Name: 
// Module Name: bram_loader
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


module bram_loader (
    input wire clk,
    input wire [7:0] addr,
    output reg [23:0] data
);

    reg [23:0] mem [0:255]; // 16 x 8-bit memory

    initial begin
        $readmemh("output.mem", mem); // Load memory file]);
        
    end

    always @(posedge clk) begin
        data <= mem[addr];
    end

endmodule

