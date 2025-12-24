module memory_controller(
    input logic clk,
    input logic rst,
    input logic [7:0] cpu_data,
    input logic cpu_wr,
    input logic cpu_rd,
    input logic [3:0] cpu_addr,
    output logic [7:0] mem_data
);
    logic wr;
    logic [7:0] data_to_mem;

    simple_memory mem(
        .clk(clk),
        .wr_en(wr),
        .addr(cpu_addr),
        .data_in(data_to_mem),
        .data_out(mem_data)
    );

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            wr <= 0;
            data_to_mem <= 0;
        end else begin
            wr <= cpu_wr;
            data_to_mem <= cpu_data;
        end
    end
endmodule