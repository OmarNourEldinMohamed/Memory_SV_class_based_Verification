module top;
    import mailbox_P::*;
    import env_P::*;

    bit clk;
    always #2 clk = ~clk;

    interfaceX intf1(clk);
    single_port_ram dut(intf1);
    virtual interfaceX vif;

    env env_object;

    task rst;
        intf1.rst = 1;
        @(negedge clk);
        intf1.rst = 0;
    endtask

    initial begin
        rst();
        vif = intf1;
        vif_mailbox = new();
        tr_mailbox = new();
        vif_mailbox.put(vif);
        env_object = new();
        env_object.start_test();
        $stop();
    end
endmodule