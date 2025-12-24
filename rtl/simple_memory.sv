module simple_memory(
    input logic clk,
    input logic wr_en,
    input logic [3:0] addr,
    input logic [7:0] data_in,
    output logic [7:0] data_out
);
    logic [7:0] mem [0:15];

    always_ff @(posedge clk) begin
        if (wr_en)
            mem[addr] <= data_in;
        data_out <= mem[addr];
    end
endmodule