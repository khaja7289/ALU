module ALU_64bit_Testbench;

  // Define parameters for the testbench
  reg clk;
  reg reset;
  reg [63:0] operand_A;
  reg [63:0] operand_B;
  reg [3:0] alu_op;
  wire [63:0] result;
  wire zero_flag;
  wire carry_flag;
  wire overflow_flag;

  // Instantiate the ALU_64bit module
  ALU_64bit uut (
    .clk(clk),
    .reset(reset),
    .operand_A(operand_A),
    .operand_B(operand_B),
    .alu_op(alu_op),
    .result(result),
    .zero_flag(zero_flag),
    .carry_flag(carry_flag),
    .overflow_flag(overflow_flag)
  );

  // Define ALU operation codes
  parameter ADD  = 4'b0000;
  parameter SUB  = 4'b0001;
  parameter AND  = 4'b0010;
  parameter OR   = 4'b0011;
  parameter XOR  = 4'b0100;
  parameter SLL  = 4'b0101;
  parameter SRL  = 4'b0110;
  parameter SRA  = 4'b0111;
  parameter SLT  = 4'b1000;
  parameter SEQ  = 4'b1001;
  parameter SRNE = 4'b1010;

  // Clock generation
  always begin
    clk = 1'b0;
    #5;
    clk = 1'b1;
    #5;
  end

  // Reset control
  initial begin
    reset = 1'b1;
    #10;
    reset = 1'b0;
    #10;
    
    // Generate and test multiple random cases
    repeat (10) begin
      operand_A = $random;
      operand_B = $random;
      alu_op = $random & 4'b1111; // Random ALU operation
      
      // Wait for a few simulation cycles
      #10;
      
      // Display input values and result
      $display("Test case: A=%h, B=%h, ALUOp=%h, Result=%h", operand_A, operand_B, alu_op, result);
      
      // Wait for some cycles to observe the result
      #10;
      
      // Check the flags and result here if needed
    end
    
    $finish;
  end

endmodule
