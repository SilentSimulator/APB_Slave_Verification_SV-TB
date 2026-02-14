class pbenv;

  // Components
  pbgen        gen;
  pbdriver     drv;
  pbmon   mon;
  pbscb scb;

  // Mailboxes
  mailbox gen2drv;
  mailbox mon2scb;

  // Virtual interface
  virtual apb_if vif;

  // Constructor
  function new(virtual apb_if vif);
    this.vif = vif;

    // Create mailboxes
    gen2drv = new();
    mon2scb = new();

    // Create components
    gen = new(gen2drv);
    drv = new(vif, gen2drv);
    mon = new(vif, mon2scb);
    scb = new(mon2scb);
  endfunction

  // Run task
  task run();
    fork
      gen.run();
      drv.run();
      mon.run();
      scb.run();
    join_none
  endtask

endclass
