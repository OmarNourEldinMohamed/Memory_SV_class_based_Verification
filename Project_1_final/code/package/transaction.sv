package transaction_p;
    class transaction;
        parameter mem_width = 32;
        parameter mem_depth = 16;
        parameter addr_size = $clog2(mem_depth);
        parameter addr_pipline = "FALSE";
        parameter dout_pipline = "FALSE";
        parameter parity_enable = 1;

        rand bit [mem_width-1 : 0] din;
        rand bit [addr_size-1 : 0] addr;
        rand bit wr_en, rd_en, RAM_Enable, addr_en, dout_en, rst;

        bit  [mem_width-1 : 0] dout;
        bit parity_out;
        bit  valid_out;

        //constraints for  the reset 
        constraint rst_constraint {
            rst dist {0:=5 , 1:=95 };
        }
    endclass
endpackage

