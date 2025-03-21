###############################################################
#  Generated by:      Cadence Innovus 15.23-s045_1
#  OS:                Linux x86_64(Host ID ieng6-ece-06.ucsd.edu)
#  Generated on:      Fri Mar 21 08:43:20 2025
#  Design:            sram_w16
#  Command:           saveDesign route.enc
###############################################################
current_design sram_w16
create_clock [get_ports {CLK}]  -name clk -period 1.000000 -waveform {0.000000 0.500000}
set_propagated_clock  [get_clocks {clk}]
set_propagated_clock  [get_ports {CLK}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[49]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[70]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[63]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[56]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[4]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[102]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[93]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[86]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[79]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[118]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[125]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[11]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[27]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[34]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[41]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[71]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[64]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[57]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[5]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[103]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[110]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[94]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[87]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[119]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[126]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[12]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[28]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[35]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[42]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[72]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[65]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[58]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[6]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[104]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[111]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[95]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[88]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[127]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {WEN}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[13]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[20]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[29]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[36]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[43]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[50]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[80]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[73]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[66]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[59]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[7]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[105]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[112]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[96]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[89]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[14]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[21]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[37]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[44]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[51]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {CEN}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[81]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[74]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[67]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[8]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[106]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[113]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[120]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {A[0]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[97]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[15]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[22]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[38]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[45]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[52]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[0]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[82]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[75]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[68]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[9]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[107]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[114]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[121]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {A[1]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[98]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[16]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[23]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[30]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[39]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[46]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[60]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[53]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[1]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[90]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[83]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[76]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[69]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[108]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[115]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[122]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {A[2]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[99]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[17]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[24]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[31]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[47]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[61]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[54]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[2]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[100]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[91]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[84]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[77]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[109]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[116]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[123]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {A[3]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[18]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[25]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[32]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[48]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[62]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[55]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[3]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[101]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[92]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[85]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[78]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[117]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[124]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[10]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[19]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[26]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[33]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {D[40]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[1]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[118]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[125]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[93]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[86]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[79]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[11]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[27]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[34]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[41]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[103]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[110]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[71]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[64]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[57]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[2]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[119]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[126]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[94]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[87]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[12]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[28]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[35]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[42]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[104]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[111]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[72]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[65]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[58]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[3]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[127]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[95]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[88]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[13]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[20]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[29]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[36]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[43]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[50]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[105]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[112]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[80]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[73]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[66]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[59]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[4]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[96]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[89]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[14]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[21]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[37]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[44]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[51]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[106]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[113]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[120]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[81]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[74]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[67]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[5]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[97]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[15]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[22]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[38]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[45]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[52]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[107]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[114]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[121]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[82]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[75]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[68]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[6]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[98]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[16]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[23]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[30]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[39]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[46]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[60]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[53]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[108]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[115]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[122]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[90]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[83]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[76]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[69]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[7]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[99]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[17]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[24]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[31]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[100]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[47]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[61]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[54]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[109]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[116]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[123]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[91]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[84]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[77]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[8]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[18]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[25]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[32]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[101]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[48]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[62]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[55]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[0]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[117]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[124]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[92]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[85]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[78]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[9]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[10]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[19]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[26]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[33]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[40]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[102]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[49]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[70]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[63]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {Q[56]}]
