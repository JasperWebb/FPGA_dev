module top (
  input CLK,           // Main clock input
  input USER_BTN,      // User button input (active low)
  output LED_R,        // Red LED output (active low)
  output LED_G,        // Green LED output (active low)
  output LED_B         // Blue LED output (active low)
);
  // Define counter size and initial blink bit
  localparam COUNTER_SIZE = 22;
  reg [4:0] blink_bit = 16; // Use reg for blink_bit to allow changes

  reg [COUNTER_SIZE-1:0] counter; // Correct syntax for counter declaration
  reg [1:0] color_state = 2'b00;
  reg btn_prev = 1'b1;
  
  always @(posedge CLK) begin
    counter <= counter + 1;
    
    if (btn_prev == 1'b1 && USER_BTN == 1'b0) begin
      color_state <= color_state + 1;
      // Increment blink_bit, wrapping around to 0 if it reaches COUNTER_SIZE
      blink_bit <= (blink_bit == COUNTER_SIZE-1) ? 5'd0 : blink_bit + 1;
    end
    btn_prev <= USER_BTN;
  end
  
  assign LED_R = (color_state == 2'b00) ? counter[blink_bit] : 1'b1;
  assign LED_G = (color_state == 2'b01) ? counter[blink_bit] : 1'b1;
  assign LED_B = (color_state == 2'b10) ? counter[blink_bit] : 1'b1;
endmodule