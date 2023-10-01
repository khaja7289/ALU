module ALU_64bit (
    input wire clk,
    input wire reset,
    input wire [63:0] operand_A,
    input wire [63:0] operand_B,
    input wire [3:0] alu_op, // ALU operation code
    output wire [63:0] result,
    output wire zero_flag,   // Zero flag (output 1 if result is zero)
    output wire carry_flag,  // Carry flag (output 1 if carry-out occurs)
    output wire overflow_flag // Overflow flag (output 1 if overflow occurs)
);

// Internal registers and signals
reg [63:0] result_reg;
reg enable_clk; // Clock enable signal
wire [64:0] sum; // For addition/subtraction

// Define ALU operation codes
parameter ADD  = 4'b0000;
parameter SUB  = 4'b0001;
parameter AND  = 4'b0010;
parameter OR   = 4'b0011;
parameter XOR  = 4'b0100;
parameter SLL  = 4'b0101; // Left shift
parameter SRL  = 4'b0110; // Logical right shift
parameter SRA  = 4'b0111; // Arithmetic right shift
parameter SLT  = 4'b1000; // Set if less than
parameter SEQ  = 4'b1001; // Set if equal
parameter SRNE = 4'b1010; // Set if not equal

// Clock gating logic (similar to previous code)
always @(posedge clk or posedge reset) begin
    if (reset) begin
        enable_clk <= 1'b0;
    end else begin
        case (alu_op)
            ADD, SUB, AND, OR, XOR, SLL, SRL, SRA, SLT, SEQ, SRNE:
                enable_clk <= 1'b1;
            default:
                enable_clk <= 1'b0;
        endcase
    end
end

// ALU logic (expanded for new operations)
always @(posedge clk) begin
    if (enable_clk) begin
        case (alu_op)
            ADD:  result_reg <= operand_A + operand_B;
            SUB:  result_reg <= operand_A - operand_B;
            AND:  result_reg <= operand_A & operand_B;
            OR:   result_reg <= operand_A | operand_B;
            XOR:  result_reg <= operand_A ^ operand_B;
            SLL:  result_reg <= operand_A << operand_B[5:0];
            SRL:  result_reg <= operand_A >> operand_B[5:0];
            SRA:  result_reg <= $signed(operand_A) >>> operand_B[5:0];
            SLT:  result_reg <= (operand_A < operand_B) ? 64'b1 : 64'b0;
            SEQ:  result_reg <= (operand_A == operand_B) ? 64'b1 : 64'b0;
            SRNE: result_reg <= (operand_A != operand_B) ? 64'b1 : 64'b0;
            default: result_reg <= 64'b0;
        endcase
    end
end

// Output result
assign result = result_reg;

// Zero flag
assign zero_flag = (result_reg == 64'b0) ? 1'b1 : 1'b0;

// Carry flag (for addition/subtraction)
assign carry_flag = (sum[64] == 1'b1) ? 1'b1 : 1'b0;

// Overflow flag (for addition/subtraction)
assign overflow_flag = (sum[64] != sum[63]) ? 1'b1 : 1'b0;

endmodule

