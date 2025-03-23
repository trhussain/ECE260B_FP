set clock_cycle 20.0 
set io_delay 0.2 

set clock_port clk

create_clock -name clk -period $clock_cycle [get_ports $clock_port]

set_input_delay -clock [get_clocks clk] -add_delay -max $io_delay [get_ports in*]
set_output_delay -clock [get_clocks clk] -add_delay -max $io_delay [get_ports out*]

