module full_adder(
    input a, 
    input b, 
    input cin, 
    output sum, 
    output cout
);

    // Intermediate wires
    wire ab, bc, ca, ab_xor_cin;

    // XOR gates for sum
    xor (ab_xor_cin, a, b);    // XOR gate for a ^ b
    xor (sum, ab_xor_cin, cin); // XOR gate for (a ^ b) ^ cin

    // AND gates for carry
    and (ab, a, b);            // AND gate for a & b
    and (bc, b, cin);          // AND gate for b & cin
    and (ca, cin, a);          // AND gate for cin & a

    // OR gate for carry out
    or (cout, ab, bc, ca);     // OR gate for (a & b) | (b & cin) | (cin & a)

endmodule
