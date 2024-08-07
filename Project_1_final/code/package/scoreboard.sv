package scoreboard_P;
    import mailbox_P::*;
    import transaction_p::*;

    class scoreboard;
        transaction tr_mon;
        parameter mem_width = 32;
        parameter mem_depth = 16;
        parameter addr_size = $clog2(mem_depth);
        parameter addr_pipline = "FALSE";
        parameter dout_pipline = "FALSE";
        parameter parity_enable = 1;

        bit [mem_width-1 :0]mem_tb[mem_depth-1 :0];

        task start();
            tr_mailbox.get(tr_mon);
            if(tr_mon.rst) begin
                if(tr_mon.valid_out || tr_mon.dout || tr_mon.parity_out)
                    $error("rst error at",$time);
            end
            else if(tr_mon.RAM_Enable) begin
                if(tr_mon.rd_en) begin
                    if(tr_mon.dout != mem_tb[tr_mon.addr] || tr_mon.valid_out == 0) begin
                        $error("rd error at ",$time);
                        $display(tr_mon.dout, "  ",mem_tb[tr_mon.addr]);
                        $display(tr_mon.valid_out);
                    end
                end
                else if(tr_mon.wr_en) begin
                    mem_tb[tr_mon.addr] = tr_mon.din;
                end
            end
        endtask
    endclass
endpackage