`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.08.2025 16:24:11
// Design Name: 
// Module Name: rgb_to_gray
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


module rgb_to_gray (
    input wire clk,
    input wire [7:0] addr,       // 8 bits each: R[23:16], G[15:8], B[7:0]
    output wire [7:0] gray,
    output reg[23:0] rgb      // Grayscale output
);
    reg [23:0] mem [0:255]; // 16 x 8-bit memory

    initial begin
        $readmemh("output.mem", mem); // Load memory file]);
        
    end
    always @(posedge clk) begin
        rgb <= mem[addr];
    end
    wire [7:0] r = rgb[23:16];
    wire [7:0] g = rgb[15:8];
    wire [7:0] b = rgb[7:0];

    wire [15:0] weighted_sum;

    assign weighted_sum = r * 8'd77 + g * 8'd150 + b * 8'd29;
    assign gray = weighted_sum[15:8];  // Divide by 256

endmodule

