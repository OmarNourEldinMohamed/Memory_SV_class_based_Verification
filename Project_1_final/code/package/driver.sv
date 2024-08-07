package driver_P;
    import sequencer_P::*;
    import transaction_p::*;
    import mailbox_P::*;
    class driver;
        transaction tr_seq;
        virtual interfaceX vif;
        task start();
            tr_mailbox.get(tr_seq);
            vif_mailbox.peek(vif);
            vif.din = tr_seq.din;
            vif.addr = tr_seq.addr;
            vif.wr_en = tr_seq.wr_en;
            vif.rd_en = tr_seq.rd_en;
            vif.RAM_Enable = tr_seq.RAM_Enable;
            vif.addr_en = tr_seq.addr_en;
            vif.dout_en = tr_seq.dout_en;
            vif.rst = tr_seq.rst;
        endtask
    endclass
endpackage