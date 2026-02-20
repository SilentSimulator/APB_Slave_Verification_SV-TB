class pbscb;

  parameter ADDR_WIDTH = 8;
  parameter DATA_WIDTH = 32;

  mailbox mon2scb;
  pbtrans tr;

  logic [DATA_WIDTH-1:0] mem [0:(1<<ADDR_WIDTH)-1];

  function new(mailbox mon2scb);
    this.mon2scb = mon2scb;
  endfunction

  task run();
    forever begin
      mon2scb.get(tr);

      if (tr.op == pbtrans::WRITE) begin
        mem[tr.paddr] = tr.pwdata;
      end
      else begin
        if (mem[tr.paddr] != tr.prdata)
          $display("ERROR at addr %0h", tr.paddr);
        else
          $display("PASS at addr %0h", tr.paddr);
      end
    end
  endtask

endclass
