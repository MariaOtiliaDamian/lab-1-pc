module testbench;

wire clk;
wire reset_n;
wire data_i;
wire up_down_i; //Intrare pentru a specifica dacă contorul trebuie să numere în sus sau în jos
wire enable_i;
wire cnt_step_i; //Intrare pentru a specifica pasul de contare
wire load_i;
wire [8-1 : 0] cnt_o;
wire ovf_o;

counter DUT ( 
.clk (clk),
.reset_n (reset_n),
.data_i (data_i),
.up_down_i (up_down_i),
.enable_i (enable_i),
.cnt_step_i (cnt_step_i),

.load_i (load_i),
.cnt_o (cnt_o),
.ovf_o (ovf_o)
);

ck_rst_tb ck_rst_tb_in(
.clk    (clk),
.rst_n  (reset_n)
);

generator generator_in(
.clk (clk),
.data_i (data_i),
.up_down_i (up_down_i),
.enable_i (enable_i),
.cnt_step_i (cnt_step_i),
.reset_n (reset_n),
.load_i (load_i)

);

endmodule; 