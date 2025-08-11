`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.08.2025 16:24:46
// Design Name: 
// Module Name: rgb_to_gray_tb
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


module tb_rgb_to_gray;
    reg clk;
    
    
    wire [23:0] rgb;
    wire [7:0] gray;
    wire [7:0] threshold;
    reg [17:0] addr;
    

    rgb_to_gray uut (
        .clk(clk),
        .addr(addr),
        .gray(gray),
        .threshold(threshold),
        .rgb(rgb)
    );
    
    initial clk = 0;
    always #5 clk = ~clk;
    integer outfile;
    initial begin
        outfile = $fopen("C:/Temp/test.txt", "w");
        #1;
        for (addr = 0; addr < 160000; addr = addr + 1) begin
            #10;  // Wait for data to settle
            $fwrite(outfile, "%h\n", threshold);
            $display("Addr = %d RGB = %h, Gray = %h", addr, rgb, gray);
        end
        $fclose(outfile);
        $display("Test complete.");
        $finish; // Stop simulation immediately
    end

endmodule
