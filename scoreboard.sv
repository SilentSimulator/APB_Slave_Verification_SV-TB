class pbscb;

  parameter ADDR_WIDTH = 8;
  parameter DATA_WIDTH = 32;

  mailbox mon2scb;
  apb_trans tr;

  logic [DATA_WIDTH-1:0] mem [0:(1<<ADDR_WIDTH)-1];

  function new(mailbox mon2scb);
    this.mon2scb = mon2scb;
  endfunction

  task run();
    forever begin
      mon2scb.get(tr);

      if (tr.pwrite) begin
        mem[tr.addr] = tr.data;
      end
      else begin
        if (mem[tr.addr] != tr.data)
          $display("ERROR at addr %0h", tr.addr);
        else
          $display("PASS at addr %0h", tr.addr);
      end
    end
  endtask

endclass
