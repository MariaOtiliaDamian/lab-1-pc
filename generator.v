module generator #(parameter WIDTH = 8)(  //standard e pe 8 biti

input clk,
output reg data_i, // de la cat sa porneasca
output reg up_down_i, //Intrare pentru a specifica dacă contorul trebuie să numere în sus sau în jos
output reg enable_i,
output reg cnt_step_i, //Intrare pentru a specifica pasul de contare
input reset,
output reg load_i

);

initial begin
 
 data_i = 100; // 100 e la cat vreau sa inceapa
 up_down_i = 1; // daca dau  1 scade si la 0 aduna
 enable_i=1;
 cnt_step_i= 1; //cu cat sa adune
 load_i = 0; // sa nu o ia de la capat ii dau 0
 
 repeat (10) @(posedge clk);
 
end

endmodule