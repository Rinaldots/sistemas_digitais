vsim -L work work.mux_8_bit
add wave *

# Vetores de entrada
force D_0 "00000000" 0ns, "11110000" 80ns, "01010101" 160ns
force D_1 "11111111" 0ns, "00001111" 80ns, "10101010" 160ns

# Seleção alternando a cada 40 ns
force s_in 0 0ns, 1 40ns -repeat 80ns

run 240ns
