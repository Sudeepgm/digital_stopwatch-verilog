module stopwatch (
    input clk,
    input rst,
    input start,
    input stop,
    input reset,
    output reg [3:0] sec1, sec0, ms1, ms0
);
    reg [15:0] counter;
    reg running;

    always @(posedge clk or posedge rst) begin
        if (rst || reset) begin
            sec1 <= 0; sec0 <= 0; ms1 <= 0; ms0 <= 0;
            counter <= 0; running <= 0;
        end else if (start) begin
            running <= 1;
        end else if (stop) begin
            running <= 0;
        end else if (running) begin
            counter <= counter + 1;
            if (counter == 50000) begin // simulate 1ms at 50MHz
                counter <= 0;
                if (ms0 == 9) begin
                    ms0 <= 0;
                    if (ms1 == 9) begin
                        ms1 <= 0;
                        if (sec0 == 9) begin
                            sec0 <= 0;
                            sec1 <= sec1 + 1;
                        end else sec0 <= sec0 + 1;
                    end else ms1 <= ms1 + 1;
                end else ms0 <= ms0 + 1;
            end
        end
    end
endmodule