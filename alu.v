module alu(
    input clk,
    input start,
    input [31:0] A,
    input [31:0] B,
    input [2:0] ALUop,
    output reg [31:0] Result,
    output reg done
);
  
    wire [31:0] and_result, or_result, xor_result, nor_result, sub_result;
    wire cout_add, cout_sub;
    wire borrow_out;
    
    and_gate and_inst(.a(A), .b(B), .y(and_result));
    or_gate or_inst(.a(A), .b(B), .y(or_result));
    nor_gate nor_inst(.a(A), .b(B), .y(nor_result));
    xor_gate xor_inst(.a(A), .b(B), .y(xor_result));
    
    subtractor alu_subtractor(
        .a(A),
        .b(B),
        .diff(sub_result),
        .borrow_out(borrow_out) // For LESS THAN operation
    );

    // Instantiate the adder module for addition operation
    wire [31:0] add_result;
    adder alu_adder(
        .a(A),
        .b(B),
        .cin(1'b0),
        .sum(add_result),
        .cout(cout_add)
    );

    // Internal wires for MOD operation
    wire [31:0] ModResult;
    wire mod_done;
    wire start_mod;

    // Instantiate the mod module
    mod mod_inst(
        .clk(clk),
        .start(start_mod),
        .A(A),
        .B(B),
        .ModResult(ModResult),
        .done(mod_done)
    );

    // Start the MOD operation when ALUop is 111 and start is asserted
    wire aluop_eq_7;
    wire [2:0] aluop_and_7;

    // AND each bit of ALUop with 1 (since 3'b111 is all 1s)
    and (aluop_and_7[0], ALUop[0], 1'b1);
    and (aluop_and_7[1], ALUop[1], 1'b1);
    and (aluop_and_7[2], ALUop[2], 1'b1);

    // Check if ALUop is equal to 3'b111
    and (aluop_eq_7, aluop_and_7[0], aluop_and_7[1], aluop_and_7[2]);

    // Finally, combine with start signal
    and (start_mod, aluop_eq_7, start);
	 wire [31:0] mux_output;


   mux8to1 alu_mux(
    .in0(and_result),
    .in1(or_result),
    .in2(xor_result),
    .in3(nor_result),
    .in4({31'b0, borrow_out}), // For LESS THAN operation
    .in5(add_result),
    .in6(sub_result),
    .in7(ModResult),
    .sel(ALUop),
    .out(mux_output)
);


always @(posedge clk) begin
        if (ALUop == 3'b111 && mod_done) begin
            done <= 1'b1;
        end else begin
            done <= 1'b0;
        end

        Result <= mux_output;
    end
endmodule 