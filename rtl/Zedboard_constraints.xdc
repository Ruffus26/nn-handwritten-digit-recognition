# Clock
set_property PACKAGE_PIN Y9 [get_ports {clk}];  # "GCLK"
create_clock -period 50.000 -name CLK [get_ports clk]

# Reset
set_property PACKAGE_PIN P16 [get_ports {rst}];  # "BTNC"

# ZedBoard LEDs
set_property PACKAGE_PIN T22 [get_ports {LED0}];  # "LD0"
set_property PACKAGE_PIN T21 [get_ports {LED1}];  # "LD1"
set_property PACKAGE_PIN U22 [get_ports {LED2}];  # "LD2"
set_property PACKAGE_PIN U21 [get_ports {LED3}];  # "LD3"

set_property IOSTANDARD LVCMOS33 [get_ports {LED0}];
set_property IOSTANDARD LVCMOS33 [get_ports {LED1}];
set_property IOSTANDARD LVCMOS33 [get_ports {LED2}];
set_property IOSTANDARD LVCMOS33 [get_ports {LED3}];

# ZedBoard switches
set_property PACKAGE_PIN F22 [get_ports {enable}];  # "SW0"
set_property IOSTANDARD LVCMOS33 [get_ports {enable}];

# ZedBoard Buttons

# Voltage settings
set_property IOSTANDARD LVCMOS18 [get_ports -of_objects [get_iobanks 34]];
set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 13]];