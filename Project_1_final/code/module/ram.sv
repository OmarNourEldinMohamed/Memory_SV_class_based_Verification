//we will rename the blk_select to RAM_Enable

module single_port_ram (interfaceX intf);
parameter mem_width = intf.mem_width;
parameter mem_depth = intf.mem_depth;
parameter addr_size = intf.addr_size;
parameter addr_pipline = intf.addr_pipline;
parameter dout_pipline = intf.dout_pipline;
parameter parity_enable = intf.parity_enable;


bit [mem_width-1 : 0] din;
bit [addr_size-1 : 0] addr;
bit wr_en, rd_en, RAM_Enable, addr_en, dout_en, clk, rst;
bit  [mem_width-1 : 0] dout;
bit parity_out;
bit  valid_out;


//assign inputs to the interface
assign din = intf.din;
assign addr = intf.addr;
assign wr_en = intf.wr_en;
assign rd_en = intf.rd_en;
assign RAM_Enable = intf.RAM_Enable;
assign addr_en = intf.addr_en;
assign dout_en = intf.dout_en;
assign clk = intf.clk;
assign rst = intf.rst;
//assign outputs to the interface
assign intf.dout = dout;
assign intf.parity_out = parity_out;
assign intf.valid_out = valid_out;



bit [mem_width-1 :0]mem[mem_depth-1 :0];

localparam pipe_adder = (addr_pipline == "TRUE") ? 1'b1 : 1'b0;
localparam pipe_dout = (dout_pipline == "TRUE") ? 1'b1 : 1'b0;

reg [addr_size-1 : 0] addr_mux;
wire [addr_size-1 : 0] addr_sigma;
reg [mem_width-1 : 0] dout_temp, dout_mux;

generate
assign addr_sigma = (pipe_adder)? addr_mux : addr;
assign dout = (pipe_dout)? dout_mux : dout_temp; 
endgenerate

//even parity
assign parity_out = (parity_enable)? ^dout : 0;

always @(posedge clk ) begin
    if(rst)begin
        addr_mux <= 0;
        dout_mux <= 0;
        valid_out <= 0;
    end
    else begin
        if(addr_en)
            addr_mux <= addr;
        if(dout_en)
            dout_mux <= dout_temp;
        if (RAM_Enable) begin
            if(wr_en) begin
                mem[addr_sigma] <= din;
                valid_out <= 0;
            end
            if(rd_en) begin
                dout_temp <= mem[addr_sigma];
                valid_out <= 1;
            end
        end
        else
            valid_out <= 0;
    end
end
endmodule