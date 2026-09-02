vcom Rinaldo/bcd_7seg.vhd

vsim bcd_7seg

add wave *

# Testa dígitos BCD 0 a 9
force s "0000" 0ns
force s "0001" 20ns
force s "0010" 40ns
force s "0011" 60ns
force s "0100" 80ns
force s "0101" 100ns
force s "0110" 120ns
force s "0111" 140ns
force s "1000" 160ns
force s "1001" 180ns

# (Opcional) testa entradas não-BCD
force s "1010" 200ns
force s "1011" 220ns
force s "1100" 240ns
force s "1101" 260ns
force s "1110" 280ns
force s "1111" 300ns

run 320ns
