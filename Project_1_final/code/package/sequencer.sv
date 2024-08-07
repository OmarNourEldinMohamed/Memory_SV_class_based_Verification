package sequencer_P;
    import transaction_p::*;
    import mailbox_P::*;
    class sequencer;
        parameter mem_width = 32;
        parameter mem_depth=16;
        localparam addr_size=$clog2(mem_depth);

        bit [mem_width-1:0]data_in ;
        bit [addr_size-1:0]add_s;
        bit en,rst_n,rd_wr;

        transaction tr_seq;

        task start();
            tr_seq = new();
            assert(tr_seq.randomize());
            tr_mailbox.put(tr_seq);
        endtask
    endclass    
endpackage