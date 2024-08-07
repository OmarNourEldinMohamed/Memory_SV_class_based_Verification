package monitor_P;
    import mailbox_P::*;
    import transaction_p::*;

    class monitor;
        transaction tr_mon;
        virtual interfaceX vif;
        
        task start();
            vif_mailbox.peek(vif);
            tr_mon = new();
            @(negedge vif.clk);

            tr_mon.din = vif.din;
            tr_mon.addr = vif.addr;
            tr_mon.wr_en = vif.wr_en;
            tr_mon.rd_en = vif.rd_en;
            tr_mon.RAM_Enable = vif.RAM_Enable;
            tr_mon.addr_en = vif.addr_en;
            tr_mon.dout_en = vif.dout_en;
            tr_mon.rst = vif.rst;
            tr_mon.dout = vif.dout;
            tr_mon.parity_out = vif.parity_out;
            tr_mon.valid_out = vif.valid_out;

            tr_mailbox.put(tr_mon);
        endtask
    endclass
endpackage
