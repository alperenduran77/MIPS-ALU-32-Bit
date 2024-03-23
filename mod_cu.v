module mod_cu(
    input clk,
    input start,
    input done_calc, // Input from datapath indicating calculation is done
    output reg subtract, // Tell datapath to subtract
    output reg load, // Tell datapath to load A into tempA
    output reg done // Tell top module that calculation is done
);

    // State definitions
    localparam IDLE = 1'b0,
               CALC = 1'b1;

    reg current_state = IDLE;
    reg next_state = IDLE;

    always @(posedge clk) begin
        current_state <= next_state;
    end

    always @(*) begin
        // Default signals
        load = 1'b0;
        subtract = 1'b0;
        done = 1'b0;
        next_state = current_state;

        case (current_state)
            IDLE: begin
                if (start) begin
                    load = 1'b1;
                    next_state = CALC;
                end
            end
            CALC: begin
                if (!done_calc) begin
                    subtract = 1'b1;
                end else begin
                    done = 1'b1;
                    next_state = IDLE;
                end
            end
        endcase
    end
endmodule
