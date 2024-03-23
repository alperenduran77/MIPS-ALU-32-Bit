module mod(
    input clk,
    input start,
    input [31:0] A,
    input [31:0] B,
    output [31:0] ModResult,
    output done
);

    wire subtract, load, done_calc;
    wire [31:0] tempA;

    mod_cu control_unit(
        .clk(clk),
        .start(start),
        .done_calc(done_calc),
        .subtract(subtract),
        .load(load),
        .done(done)
    );

    mod_dp datapath(
        .clk(clk),
        .A(A),
        .B(B),
        .subtract(subtract),
        .load(load),
        .tempA(tempA),
        .done_calc(done_calc)
    );

    mux2to1 mux0(done, 1'b0, tempA[0], ModResult[0]);
    mux2to1 mux1(done, 1'b0, tempA[1], ModResult[1]);
    mux2to1 mux2(done, 1'b0, tempA[2], ModResult[2]);
	 mux2to1 mux3(done, 1'b0, tempA[3], ModResult[3]);
	 mux2to1 mux4(done, 1'b0, tempA[4], ModResult[4]);
	 mux2to1 mux5(done, 1'b0, tempA[5], ModResult[5]);
    mux2to1 mux6(done, 1'b0, tempA[6], ModResult[6]);
	 mux2to1 mux7(done, 1'b0, tempA[7], ModResult[7]);
	 mux2to1 mux8(done, 1'b0, tempA[8], ModResult[8]);
	 mux2to1 mux9(done, 1'b0, tempA[9], ModResult[9]);
	 mux2to1 mux10(done, 1'b0, tempA[10], ModResult[10]);
	 mux2to1 mux11(done, 1'b0, tempA[11], ModResult[11]);
	 mux2to1 mux12(done, 1'b0, tempA[12], ModResult[12]);
	 mux2to1 mux13(done, 1'b0, tempA[13], ModResult[13]);
	 mux2to1 mux14(done, 1'b0, tempA[14], ModResult[14]);
	 mux2to1 mux15(done, 1'b0, tempA[15], ModResult[15]);
	 mux2to1 mux16(done, 1'b0, tempA[16], ModResult[16]);
	 mux2to1 mux17(done, 1'b0, tempA[17], ModResult[17]);
	 mux2to1 mux18(done, 1'b0, tempA[18], ModResult[18]);
	 mux2to1 mux19(done, 1'b0, tempA[19], ModResult[19]);
	 mux2to1 mux20(done, 1'b0, tempA[20], ModResult[20]);
	 mux2to1 mux21(done, 1'b0, tempA[21], ModResult[21]);
	 mux2to1 mux22(done, 1'b0, tempA[22], ModResult[22]);
	 mux2to1 mux23(done, 1'b0, tempA[23], ModResult[23]);
	 mux2to1 mux24(done, 1'b0, tempA[24], ModResult[24]);
	 mux2to1 mux25(done, 1'b0, tempA[25], ModResult[25]);
	 mux2to1 mux26(done, 1'b0, tempA[26], ModResult[26]);
	 mux2to1 mux27(done, 1'b0, tempA[27], ModResult[27]);
	 mux2to1 mux28(done, 1'b0, tempA[28], ModResult[28]);
	 mux2to1 mux29(done, 1'b0, tempA[29], ModResult[29]);
	 mux2to1 mux30(done, 1'b0, tempA[30], ModResult[30]);
    mux2to1 mux31(done, 1'b0, tempA[31], ModResult[31]);
endmodule
