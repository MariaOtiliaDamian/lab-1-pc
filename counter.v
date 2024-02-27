module counter #(parameter WIDTH = 8) (
input       clk    , 
input       reset_n  ,
input [WIDTH-1 : 0 ]        data_i ,
input       up_down_i,
input        load_i,
input        enable_i,
input         cnt_step_i,
output reg [WIDTH-1 : 0 ]  cnt_o,
output reg    ovf_o
);

reg [WIDTH-1 : 0] cnt_d_o;

always @(posedge clk or negedge reset_n)
begin
    if (~reset_n) cnt_o <= 0;else
        begin
            if(enable_i) begin
                if(load_i) begin
                    cnt_o = data_i;
                end
                else if(up_down_i) 
                    cnt_o = cnt_o + cnt_step_i;
                    else
                        cnt_o = cnt_o - cnt_step_i;
            end
        end
end

always @(posedge clk or negedge reset_n)
begin
    if (~reset_n) cnt_d_o <= 0;
    else
        cnt_d_o <= cnt_o;
end

always @(posedge clk or negedge reset_n)
begin
if (cnt_d_o >= {(WIDTH){1'b1}} - (cnt_step_i - 1) && cnt_o >= 0)
        ovf_o <= 1;
    else
        ovf_o <= 0;
end


endmodule