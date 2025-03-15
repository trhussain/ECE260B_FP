###############################################################
#  Generated by:      Cadence Innovus 15.23-s045_1
#  OS:                Linux x86_64(Host ID ieng6-ece-06.ucsd.edu)
#  Generated on:      Sat Mar 15 15:03:01 2025
#  Design:            sram_w16
#  Command:           saveDesign route.enc
###############################################################
current_design sram_w16
create_clock [get_ports {CLK}]  -name clk -period 1.000000 -waveform {0.000000 0.500000}
set_propagated_clock  [get_clocks {clk}]
set_propagated_clock  [get_ports {CLK}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {WEN}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[3]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[41]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[34]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[27]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {A[0]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[16]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[23]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[57]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[30]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {CEN}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[8]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[12]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[60]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[53]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[46]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[39]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[4]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[42]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[35]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[28]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {A[1]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[0]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[17]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[24]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[58]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[31]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[9]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[13]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[20]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[61]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[54]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[47]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[5]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[50]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[43]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[36]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[29]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {A[2]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[1]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[18]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[25]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[59]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[32]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[14]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[21]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[62]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[55]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[48]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[6]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[10]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[51]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[44]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[37]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {A[3]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[2]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[19]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[40]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[33]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[26]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[15]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[22]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[63]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[56]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[49]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[7]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[11]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[52]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[45]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[38]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[3]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[41]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[34]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[27]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[16]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[23]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[57]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[30]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[8]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[12]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[60]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[53]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[46]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[39]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[4]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[42]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[35]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[28]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[0]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[17]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[24]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[31]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[58]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[9]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[13]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[20]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[61]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[54]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[47]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[5]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[50]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[43]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[36]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[29]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[1]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[18]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[25]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[59]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[32]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[14]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[21]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[62]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[55]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[48]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[6]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[10]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[51]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[44]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[37]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[2]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[19]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[40]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[33]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[26]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[15]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[22]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[63]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[56]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[49]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[7]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[11]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[52]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[45]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[38]}]
