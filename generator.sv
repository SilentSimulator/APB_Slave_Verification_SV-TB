class pbgen;
  mailbox gen2drv;
  pbtrans tr;
  
  int unsigned num_trans;
  
  function new(mailbox gen2drv, int unsigned num_trans = 10);
    this.gen2drv = gen2drv;
    this.num_trans = num_trans;
  endfunction
  
  
  task run();
    repeat(num_trans) begin
      tr = new();
      assert(tr.randomize());
      else $error("rand failed");
      tr.display();
      
      gen2drv.put(tr);
    end
  endtask
endclass
