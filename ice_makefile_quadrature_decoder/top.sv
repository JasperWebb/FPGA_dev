module top (
  input CLK,           // Main clock input
  input CHN_A,         // Channel A
  input CHN_B,         // Channel B
  output reg LED_R,        // Red LED output (active low)
  output reg LED_G,        // Green LED output (active low)
  output reg LED_B,        // Blue LED output (active low)
);
  // Define counter size (Encoder is 600 PPR, so 600 pulses per revolution, 2x for quadrature)
  localparam COUNTER_SIZE = $clog2(1200);
  reg [COUNTER_SIZE-1:0] counter; // initiating counter 

  reg [1:0] current_state, previous_state; // initiating current and previous state of channel A and B

  always @(posedge CLK) begin
    previous_state <= current_state;
    current_state <= {CHN_B, CHN_A};
  end


// Logic for quadrature decoder
 always @(posedge CLK) begin 
    case({previous_state, current_state})

        // Clockwise rotation cases
        4'b1011, 4'b1101, 4'b0100, 4'b0010: begin
              if (counter == 600) begin
              counter <= 0;
              LED_B <= 1'b0; // Turn on blue LED (active low) when counter reaches 600
              end else begin
                  counter <= counter + 1;
              end
            LED_R <= 1'b0;  // Turn on red LED (active low)
            LED_G <= 1'b1;  // Turn off green LED
        end
        
        // Counterclockwise rotation cases
        4'b0111, 4'b1110, 4'b1000, 4'b0001: begin
            counter <= counter - 1;
            if (counter == 0) begin
              counter <= 600; // Turn on blue LED (active low) when counter reaches 0
              LED_B <= 1'b0;
            end else begin
                counter <= counter - 1;
            end
            LED_R <= 1'b1;  // Turn off red LED
            LED_G <= 1'b0;  // Turn on green LED (active low)
        end

        // Stationary (default case)
        default: begin
            counter <= counter;
            // LED_R <= 1'b1;  // Turn off red LED
            // LED_G <= 1'b1;  // Turn off green LED
            LED_B <= 1'b1;  // Turn off blue LED
        end

    endcase
end
endmodule