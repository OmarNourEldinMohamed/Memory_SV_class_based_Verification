package subscriber_P;
    import mailbox_P::*;
    import transaction_p::*;

    class subscriber;
        transaction tr_sub;

        covergroup cg;
            din_coverage: coverpoint tr_sub.din;
            addr_covergae: coverpoint tr_sub.addr;
            wr_en_covergae: coverpoint tr_sub.wr_en;
            rd_en_covergae: coverpoint tr_sub.rd_en;
            RAM_Enable_covergae: coverpoint tr_sub.RAM_Enable;
            addr_en_covergae: coverpoint tr_sub.addr_en;
            dout_en_covergae: coverpoint tr_sub.dout_en;
            rst_covergae: coverpoint tr_sub.rst;
            dout_covergae: coverpoint tr_sub.dout;
            parity_out_covergae: coverpoint tr_sub.parity_out;
            valid_out_covergae: coverpoint tr_sub.addr;
        endgroup: cg

        function new();
            cg = new();    
        endfunction

        task start();
            tr_mailbox.get(tr_sub);
            cg.sample();
        endtask

    endclass
endpackage