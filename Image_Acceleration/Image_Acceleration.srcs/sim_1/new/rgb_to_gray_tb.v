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
    reg [15:0] addr;

    rgb_to_gray uut (
        .clk(clk),
        .addr(addr),
        .gray(gray),
        .rgb(rgb)
    );
    
    initial clk = 0;
    always #5 clk = ~clk;
    integer outfile;
    initial begin
    outfile = $fopen("C:/Temp/test.txt", "w");
        #1;
        for (addr = 0; addr <256; addr = addr + 1) begin
            #10;  // Wait for data to settle
//            $display("addr=%d, data=%h", addr, data);
            $fwrite(outfile, "%h\n", gray);
            $display("Addr =%d RGB = %h, Gray = %h",addr, rgb, gray);
            end
            $fclose(outfile);
            $display("Test complete.");
            #1000
            $finish;
            $fclose(outfile);
        
        $finish;
    end

endmodule
