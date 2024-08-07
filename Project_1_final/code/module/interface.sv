interface interfaceX(input clk);
    parameter mem_width = 32;
    parameter mem_depth = 16;
    parameter addr_size = $clog2(mem_depth);
    parameter addr_pipline = "FALSE";
    parameter dout_pipline = "TRUE";
    parameter parity_enable = 1;
    bit [mem_width-1 : 0] din;
    bit [addr_size-1 : 0] addr;
    bit wr_en, rd_en, RAM_Enable, addr_en, dout_en, rst;
    bit  [mem_width-1 : 0] dout;
    bit parity_out;
    bit  valid_out;
endinterface

