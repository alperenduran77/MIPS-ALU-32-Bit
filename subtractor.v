module subtractor(
    input [31:0] a,
    input [31:0] b,
    output [31:0] diff,
    output borrow_out
);
    wire [31:0] b_neg;
    wire cout;

    // Invert B for two's complement subtraction
    not inv0(b_neg[0], b[0]);
    not inv1(b_neg[1], b[1]);
    not inv2(b_neg[2], b[2]);
	 not inv3(b_neg[3], b[3]);
	 not inv4(b_neg[4], b[4]);
	 not inv5(b_neg[5], b[5]);
	 not inv6(b_neg[6], b[6]);
	 not inv7(b_neg[7], b[7]);
	 not inv8(b_neg[8], b[8]);
	 not inv9(b_neg[9], b[9]);
	 not inv10(b_neg[10], b[10]);
	 not inv11(b_neg[11], b[11]);
	 not inv12(b_neg[12], b[12]);
	 not inv13(b_neg[13], b[13]);
	 not inv14(b_neg[14], b[14]);
	 not inv15(b_neg[15], b[15]);
	 not inv16(b_neg[16], b[16]);
	 not inv17(b_neg[17], b[17]);
	 not inv18(b_neg[18], b[18]);
	 not inv19(b_neg[19], b[19]);
	 not inv20(b_neg[20], b[20]);
	 not inv21(b_neg[21], b[21]);
	 not inv22(b_neg[22], b[22]);
	 not inv23(b_neg[23], b[23]);
	 not inv24(b_neg[24], b[24]);
	 not inv25(b_neg[25], b[25]);
	 not inv26(b_neg[26], b[26]);
	 not inv27(b_neg[27], b[27]);
	 not inv28(b_neg[28], b[28]);
	 not inv29(b_neg[29], b[29]); 
    not inv30(b_neg[30], b[30]);
    not inv31(b_neg[31], b[31]);

    // Add A to the negated B
    adder subtract_adder(
        .a(a),
        .b(b_neg),
        .cin(1'b1), // Add 1 to complete two's complement
        .sum(diff),
        .cout(cout) // Use this for borrow_out
    );

    // Determine if a borrow occurred (i.e., if a < b)
    // In two's complement, if cout is 1, no borrow occurred (a >= b)
    // If cout is 0, a borrow occurred (a < b)
    not borrow_not_gate(borrow_out, cout);
endmodule
