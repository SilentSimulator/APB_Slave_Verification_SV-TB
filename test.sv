class pbtest;

  pbenv env;
  virtual apb_if vif;

  // Constructor
  function new(virtual apb_if vif);
    this.vif = vif;
    env = new(vif);
  endfunction

  // Run task
  task run();
    env.run();

    // Let simulation run for some time
    #1000;
    $finish;
  endtask

endclass
