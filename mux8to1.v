module mux8to1(
    input [31:0] in0, in1, in2, in3, in4, in5, in6, in7,
    input [2:0] sel,
    output [31:0] out
);

    wire [2:0] sel_not;
    wire [31:0] and_out[7:0];

    // Generate the inverse of selector bits
    not(sel_not[0], sel[0]);
    not(sel_not[1], sel[1]);
    not(sel_not[2], sel[2]);

    // AND conditions for each input
    genvar i;
    generate
        for (i = 0; i < 32; i = i + 1) begin: and_conditions
            and(and_out[0][i], in0[i], sel_not[2], sel_not[1], sel_not[0]);
            and(and_out[1][i], in1[i], sel_not[2], sel_not[1], sel[0]);
            and(and_out[2][i], in2[i], sel_not[2], sel[1], sel_not[0]);
            and(and_out[3][i], in3[i], sel_not[2], sel[1], sel[0]);
            and(and_out[4][i], in4[i], sel[2], sel_not[1], sel_not[0]);
            and(and_out[5][i], in5[i], sel[2], sel_not[1], sel[0]);
            and(and_out[6][i], in6[i], sel[2], sel[1], sel_not[0]);
            and(and_out[7][i], in7[i], sel[2], sel[1], sel[0]);
        end
    endgenerate

    // OR to combine the AND conditions
    generate
        for (i = 0; i < 32; i = i + 1) begin: or_conditions
            or(out[i], and_out[0][i], and_out[1][i], and_out[2][i], and_out[3][i], and_out[4][i], and_out[5][i], and_out[6][i], and_out[7][i]);
        end
    endgenerate

endmodule
