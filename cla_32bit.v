module cla32bit(
    input [31:0] a, 
    input [31:0] b, 
    input cin,
    output [31:0] sum,
    output cout
);
    wire [7:0] carry;


    // Instantiate 4-bit CLA blocks
    cla_4bit cla0(a[3:0], b[3:0], cin, sum[3:0], carry[0]);
    cla_4bit cla1(a[7:4], b[7:4], carry[0], sum[7:4], carry[1]);
    cla_4bit cla2(a[11:8], b[11:8], carry[1], sum[11:8], carry[2]);
    cla_4bit cla3(a[15:12], b[15:12], carry[2], sum[15:12], carry[3]);
    cla_4bit cla4(a[19:16], b[19:16], carry[3], sum[19:16], carry[4]);
    cla_4bit cla5(a[23:20], b[23:20], carry[4], sum[23:20], carry[5]);
    cla_4bit cla6(a[27:24], b[27:24], carry[5], sum[27:24], carry[6]);
    cla_4bit cla7(a[31:28], b[31:28], carry[6], sum[31:28], carry[7]);

    // Final carry out
    buf (cout, carry[7]);
endmodule
