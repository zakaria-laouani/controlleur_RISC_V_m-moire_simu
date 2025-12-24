module tb;
    logic clk, rst;
    logic [7:0] cpu_data;
    logic cpu_wr, cpu_rd;
    logic [3:0] cpu_addr;
    logic [7:0] mem_data;


    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb);
    end

    memory_controller uut(
        .clk(clk),
        .rst(rst),
        .cpu_data(cpu_data),
        .cpu_wr(cpu_wr),
        .cpu_rd(cpu_rd),
        .cpu_addr(cpu_addr),
        .mem_data(mem_data)
    );

    // Horloge
    initial clk = 0;
    always #5 clk = ~clk; // période 10 unités

    initial begin
        rst = 1;
        cpu_wr = 0;
        cpu_rd = 0;
        cpu_data = 0;
        cpu_addr = 0;
        #10 rst = 0;

        // Écriture dans la mémoire
        cpu_addr = 4; cpu_data = 8'hAA; cpu_wr = 1; #10;
        cpu_wr = 0;

        // Lecture
        cpu_addr = 4; cpu_rd = 1; #20;
        $display("Data read: %h", mem_data);

        $finish;
    end
endmodule