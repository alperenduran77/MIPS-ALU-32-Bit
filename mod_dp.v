module mod_dp(
    input clk,
    input [31:0] A,
    input [31:0] B,
    input subtract,
    input load,
    output reg [31:0] tempA,
    output reg done_calc // Signal to control unit when calculation is done
);

    wire [31:0] subtracted_value;
    wire borrow_out;

    // Instance of the subtractor
    subtractor sub(
        .a(tempA),
        .b(B),
        .diff(subtracted_value),
        .borrow_out(borrow_out)
    );

    always @(posedge clk) begin
        if (load) begin
            tempA <= A;  // Load A into tempA
            done_calc <= 0;
        end
        else if (subtract) begin
            // Perform subtraction if tempA is greater or equal to B
            if (!borrow_out) begin
                tempA <= subtracted_value;  // Subtract B from tempA
            end
            else begin
                // If borrow_out is high, it means tempA is less than B
                done_calc <= 1;  // Indicate the calculation is done
            end
        end
    end
endmodule
