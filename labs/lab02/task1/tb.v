module tb;

    // TODO: declare the three DUT inputs as the appropriate variable type.
    // Use exactly these names: t_i0, t_i1, t_s (needed by $monitor below).
    reg t_i0, t_i1, t_s;
    
    // TODO: declare the DUT output as the appropriate net type.
    // Use exactly this name: t_y (needed by $monitor below).
    wire t_y;

    // TODO: instantiate DUT here, connecting t_i0, t_i1, t_s, t_y to its ports
    DUT DUT (
        .I0(t_i0), 
        .I1(t_i1), 
        .S(t_s), 
        .Y(t_y)
    );

    // Waveform dump configuration
    string vcd_file;
    initial begin
        if ($value$plusargs("vcd=%s", vcd_file)) begin
            $dumpfile(vcd_file);
            $dumpvars(0, DUT);
        end
    end

    // Stimulus block: apply different input combinations
    initial begin
        t_s = 0; t_i1 = 0; t_i0 = 0; #10;
        t_s = 0; t_i1 = 0; t_i0 = 1; #10;
        t_s = 0; t_i1 = 1; t_i0 = 0; #10;
        t_s = 0; t_i1 = 1; t_i0 = 1; #10;
        
        t_s = 1; t_i1 = 0; t_i0 = 0; #10;
        t_s = 1; t_i1 = 0; t_i0 = 1; #10;
        t_s = 1; t_i1 = 1; t_i0 = 0; #10;
        t_s = 1; t_i1 = 1; t_i0 = 1; #10;
        
        $finish;
    end

    initial begin
        $monitor($time, " S=%b I1=%b I0=%b | Y=%b", t_s, t_i1, t_i0, t_y);
    end

endmodule