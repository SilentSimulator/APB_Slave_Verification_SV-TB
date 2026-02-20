class pbtrans;
  
  rand bit [7:0] paddr;
  rand bit [31:0] pwdata;
  bit [31:0] prdata;
   
  typedef enum bit{ WRITE, READ} apb_op;
  rand apb_op op;
  
  int unsigned tr_id;
  
  constraint c{ paddr inside {[8'h00:8'hff]};}
  
  function new(int unsigned id = 0);
    tr_id = id;
  endfunction
  
  function void display();
    if(op == WRITE)
      $display("[apb][write][id=%0d] paddr=%0h pwdata=%0h",tr_id,paddr,pwdata);
    else
      $display("[apb][read][id=%0d] paddr=%0h prdata=%0h",tr_id,paddr,prdata);
  endfunction
endclass
