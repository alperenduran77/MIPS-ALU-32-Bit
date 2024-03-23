module mux2to1(
    input sel,
    input in0,
    input in1,
    output out
);
    wire not_sel, and0, and1;

    not not_gate(not_sel, sel);
    and and_gate0(and0, in0, not_sel);
    and and_gate1(and1, in1, sel);
    or or_gate(out, and0, and1);
endmodule
