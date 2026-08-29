// ripple_adder.v
// Structural 4-bit ripple-carry adder, built from four FA_Gate instances.
// (Delays live inside FA_Gate.v -- nothing here needs a delay of its own.)
//
// TODO: instantiate four FA_Gate modules (name them FA0..FA3) and connect
// them into a ripple-carry chain, matching the pattern from lecture:
//
//   FA0: a[0], b[0], cin  -> sum[0], c1
//   FA1: a[1], b[1], c1   -> sum[1], c2
//   FA2: a[2], b[2], c2   -> sum[2], c3
//   FA3: a[3], b[3], c3   -> sum[3], cout
//
// Use named port connections (.a(...), .b(...), etc.), not positional.

// FA_Gate.v -- Part (b): rise/fall delay pair per gate  #(rise, fall)
// FA_Gate.v -- Part (b): rise/fall delay pair per gate  #(rise, fall)
module FA_Gate(
  input  a,
  input  b,
  input  cin,
  output sum,
  output cout
);
  wire ps, pc1, pc2;
  xor #(2,3) (ps,   a,   b);
  and #(1,2) (pc1,  a,   b);
  xor #(2,3) (sum,  cin, ps);
  and #(1,2) (pc2,  cin, ps);
  or  #(1,2) (cout, pc1, pc2);
endmodule