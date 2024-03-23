// 2-to-1 multiplexer module
module mux2x1(
    input [31:0] in0, in1,
    input select,
    output [31:0] out
);
    assign out = select ? in1 : in0;
endmodule