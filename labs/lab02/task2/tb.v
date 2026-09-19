// tb.v
// Starter testbench template

module tb;

  // Parameter definitions to match the DUT defaults
  parameter WIDTH = 8;
  parameter DEPTH = 4;

  // TODO: declare the inputs and outputs
  reg  [$clog2(DEPTH)-1:0] sel;
  wire [WIDTH-1:0]         dout;

  // TODO: instantiate DUT here
  lut #(
    .WIDTH(WIDTH),
    .DEPTH(DEPTH)
  ) DUT (
    .sel(sel),
    .dout(dout)
  );

  // Waveform dump configuration (DO NOT CHANGE)
  string vcd_file;
  initial begin
    if ($value$plusargs("vcd=%s", vcd_file)) begin
      $dumpfile(vcd_file);
      $dumpvars(0, DUT);
    end
  end

  initial begin
    // TODO: apply different input combinations
    sel = 2'd0; #10;
    sel = 2'd1; #10;
    sel = 2'd2; #10;
    sel = 2'd3; #10;
    
    $finish;
  end

  initial begin
    // Updated monitor to reflect the actual signals of this testbench
    $monitor($time, " sel=%b (%0d) | dout=%b (%0d)", sel, sel, dout, dout);
  end

endmodule