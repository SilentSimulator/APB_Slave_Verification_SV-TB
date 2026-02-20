`include "trans.sv"
`include "gens.sv"
`include "dr.sv"
`include "mo.sv"
`include "sc.sv"
`include "en.sv"
`include "tes.sv"

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
  
  pbtest t(intf);   //test
  

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
    initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #300 $finish;
  end
  

endmodule
