// 2-to-1 multiplexer, DATAFLOW style.
module mux_df (
    input  I0,
    input  I1,
    input  S,
    output wire Y  // FIX: Changed from 'reg' to 'wire' because 'assign' requires a net type
);

    assign Y = S ? I1 : I0;

endmodule