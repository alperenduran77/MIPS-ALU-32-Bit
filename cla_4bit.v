module cla_4bit(
    input [3:0] a, 
    input [3:0] b, 
    input cin, 
    output [3:0] sum, 
    output cout
);

    // Internal wires
    wire [3:0] g, p, c;

    // Generate and Propagate
    and g0(g[0], a[0], b[0]); // Generate for bit 0
    and g1(g[1], a[1], b[1]); // Generate for bit 1
    and g2(g[2], a[2], b[2]); // Generate for bit 2
    and g3(g[3], a[3], b[3]); // Generate for bit 3

    xor p0(p[0], a[0], b[0]); // Propagate for bit 0
    xor p1(p[1], a[1], b[1]); // Propagate for bit 1
    xor p2(p[2], a[2], b[2]); // Propagate for bit 2
    xor p3(p[3], a[3], b[3]); // Propagate for bit 3

    // Carry calculation
    buf (c[0], cin);
    or  c1_generate(c[1], g[0], (p[0] & c[0]));
    or  c2_generate(c[2], g[1], (p[1] & c[1]));
    or  c3_generate(c[3], g[2], (p[2] & c[2]));
    or  cout_generate(cout, g[3], (p[3] & c[3]));

    // Full Adders for sum calculation
    full_adder fa0(a[0], b[0], c[0], sum[0], );
    full_adder fa1(a[1], b[1], c[1], sum[1], );
    full_adder fa2(a[2], b[2], c[2], sum[2], );
    full_adder fa3(a[3], b[3], c[3], sum[3], );

endmodule
