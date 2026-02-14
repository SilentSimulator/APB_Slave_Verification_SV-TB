class pbdriver;
  mailbox gen2drv;
  virtual apb_if vif;
  pbtrans tr;
  
  function new(virtual apb_if vif, mailbox gen2drv);
    this.vif = vif;
    this.gen2drv = gen2drv;
  endfunction
  
  
  task run();
    forever begin
      gen2drv.get(tr);    //got txn from generator via mailbox
      
      //setup
      @(posedge vif.pclk);
      vif.psel <= 1;
      vif.penable <= 0;
      vif.paddr <= tr.paddr;          //we are connecting our txn addr to dut via intf
      vif.pwrite <= (tr.op == WRITE);      //if op=write write data
      vif.pwdata <= tr.pwdata;
      
      //access
      @(posedge vif.pclk);
      vif.penable <= 1;
      
      wait (vif.pready);
      
      if(tr.op == READ) begin
        tr.prdata <= vif.prdata;
      end
      
      //end transfer
      @(posedge vif.pclk);
      vif.psel <= 0;
      vif.penable <= 0;
    end
  endtask
endclass
      
