program pbtest(apb_if vif);

  pbenv env;

 
  // Run task
  task run();
    env.run();

    // Let simulation run for some time
    #1000;
    $finish;
  endtask
  
  initial
begin
  env=new(vif);
  env.run;
  $display ($time,"apb");
//	#100 $finish;
end

endprogram
