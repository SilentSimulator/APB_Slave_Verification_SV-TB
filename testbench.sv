import pb_pkg::*;
module tb;

  // Interface
  apb_if intf();

  // DUT
  pbslave dut (
    .pclk    (intf.pclk),
    .presetn (intf.presetn),
    .psel    (intf.psel),
    .penable (intf.penable),
    .pwrite  (intf.pwrite),
    .paddr   (intf.paddr),
    .pwdata  (intf.pwdata),
    .prdata  (intf.prdata),
    .pready  (intf.pready)
  );

  // Clock
  initial begin
    intf.pclk = 0;
    forever #5 intf.pclk = ~intf.pclk;
  end

  // Reset
  initial begin
    intf.presetn = 0;
    #20;
    intf.presetn = 1;
  end

  // Test
  pbtest test;

  initial begin
    test = new(intf);
    test.run();
  end

endmodule
