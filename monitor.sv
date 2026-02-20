class pbmon;
  mailbox mon2scb;
  virtual apb_if vif;
  pbtrans tr;
  
  function new(virtual apb_if vif, mailbox mon2scb);
    this.vif = vif;
    this.mon2scb = mon2scb;
  endfunction
  
  task run();
    forever begin
      
      @(posedge vif.pclk);
      
      wait(vif.psel && vif.penable && vif.pready);
      
      tr = new();
      
      tr.paddr = vif.paddr;
      //tr.pwrite = vif.pwrite;
      
      if(tr.op == pbtrans::WRITE)
        tr.pwdata = vif.pwdata;
      else
        tr.prdata = vif.prdata;
    
      mon2scb.put(tr);
    end
  endtask
endclass
