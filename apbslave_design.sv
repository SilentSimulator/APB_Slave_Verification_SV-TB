module pbslave #(
  parameter int DATA_WIDTH = 32,
  parameter int ADDR_WIDTH = 8)
  (
  input  logic pclk,
  input  logic presetn,
  input  logic psel,
  input  logic penable,
  input  logic pwrite,
  input  logic [ADDR_WIDTH-1:0] paddr,
  input  logic [DATA_WIDTH-1:0] pwdata,
  output logic [DATA_WIDTH-1:0] prdata,
  output logic pready
);

  logic [DATA_WIDTH-1:0] mem [0:(1<<ADDR_WIDTH)-1];    //2^n locations

  typedef enum logic [1:0] {IDLE, SETUP, ACCESS} state_t;
  state_t state;

  always @(posedge pclk or negedge presetn) begin
    if (!presetn) begin
      state  <= IDLE;
      pready <= 1'b0;
      prdata <= '0;
    end
    else begin
      case (state)

        IDLE: begin
          pready <= 1'b0;
          if (psel)
            state <= SETUP;
        end

        SETUP: begin
          if (penable)
            state <= ACCESS;
        end

        ACCESS: begin
          pready <= 1'b1;

          if (pwrite)
            mem[paddr] <= pwdata;
          else
            prdata <= mem[paddr];

          state <= IDLE;  
        end

      endcase
    end
  end

endmodule
