
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.08.2025 19:25:17
// Design Name: 
// Module Name: tb_bram_loader
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
`timescale 1ns / 1ps

//module tb_file_io_test;
//    integer f_abs, f_rel;

//    initial begin
        
//        // --- Absolute path test ---
//        $display("Attempting to open absolute path: C:/Temp/test.txt");
//        f_abs = $fopen("C:/Temp/test.txt", "w");
//        $display("fopen (absolute) returned: %0d", f_abs);
//        if (f_abs != 0) begin
//            $fwrite(f_abs, "Hello from absolute path!\n");
//            $fclose(f_abs);
//            $display("Absolute path file write completed.");
//        end else begin
//            $display("ERROR: Absolute path fopen failed.");
//        end

//        // --- Relative path test ---
//        $display("Attempting to open relative path: test_relative.txt");
//        f_rel = $fopen("test_relative.txt", "w");
//        $display("fopen (relative) returned: %0d", f_rel);
//        if (f_rel != 0) begin
//            $fwrite(f_rel, "Hello from relative path!\n");
//            $fclose(f_rel);
//            $display("Relative path file write completed.");
//        end else begin
//            $display("ERROR: Relative path fopen failed.");
//        end

//        // Wait before finishing to allow file buffers to flush
//        #10;
//        $display("==== Test finished ====");
//        $finish;
//    end
//endmodule


module tb_bram_loader;

    // Testbench signals
    reg clk;
    reg [7:0] addr;
    wire [23:0] data;

    // Instantiate the DUT (Device Under Test)
    bram_loader uut (
        .clk(clk),
        .addr(addr),
        .data(data)
    );

    // Clock generation: 100 MHz
    initial clk = 0;
    always #5 clk = ~clk;
    integer outfile;
    // Test sequence
    initial begin
        outfile = $fopen("C:/Temp/test.txt", "w");
        $display("Starting BRAM test...");
        

        // Wait for memory to load
        #10;
        $fwrite(outfile, "Hello from absolute path!\n");
        // Loop through all addresses
        for (addr = 0; addr <255; addr = addr + 1) begin
            #10;  // Wait for data to settle
//            $display("addr=%d, data=%h", addr, data);
            $fwrite(outfile, "%h\n", data);
            $display("Wrote to file: %h at %d", data,addr);
            end
            $fclose(outfile);
            $display("Test complete.");
            #1000
            $finish;
    end

endmodule
