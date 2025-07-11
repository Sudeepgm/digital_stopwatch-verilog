`timescale 1ns/1ps
module stopwatch_tb;
    reg clk = 0, rst, start, stop, reset;
    wire [3:0] sec1, sec0, ms1, ms0;

    stopwatch uut (.clk(clk), .rst(rst), .start(start), .stop(stop), .reset(reset), .sec1(sec1), .sec0(sec0), .ms1(ms1), .ms0(ms0));
    always #10 clk = ~clk;

    initial begin
        rst = 1; start = 0; stop = 0; reset = 0;
        #50 rst = 0; start = 1;
        #5000 stop = 1;
        #100 reset = 1;
        #50 $finish;
    end
endmodule