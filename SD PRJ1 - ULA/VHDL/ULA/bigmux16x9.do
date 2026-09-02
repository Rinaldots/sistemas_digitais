vsim BIGMUX

add wave *

# Define valores para as entradas de 8 bits (I0 a I12)
force I0 "00000001" 0ns
force I1 "00000010" 0ns  
force I2 "00000100" 0ns
force I3 "00001000" 0ns
force I4 "00010000" 0ns
force I5 "00100000" 0ns
force I6 "01000000" 0ns
force I7 "10000000" 0ns
force I8 "11111111" 0ns
force I9 "10101010" 0ns
force I10 "11001100" 0ns
force I11 "11110000" 0ns
force I12 "11111000" 0ns

# Define valores para as entradas de carry (C0 a C5, C8)
force C0 1 0ns
force C1 0 0ns
force C2 1 0ns
force C3 0 0ns
force C4 1 0ns
force C5 0 0ns
force C8 1 0ns

# Testa todas as seleções possíveis (0 a 15)
# Seleção 0 (deve selecionar 0)
force S "0000" 0ns

# Seleção 1 (deve selecionar I0)
force S "0001" 50ns

# Seleção 2 (deve selecionar I1)
force S "0010" 100ns

# Seleção 3 (deve selecionar I2)
force S "0011" 150ns

# Seleção 4 (deve selecionar I3)
force S "0100" 200ns

# Seleção 5 (deve selecionar I4)
force S "0101" 250ns

# Seleção 6 (deve selecionar 0)
force S "0110" 300ns

# Seleção 7 (deve selecionar 0)
force S "0111" 350ns

# Seleção 8 (deve selecionar I5)
force S "1000" 400ns

# Seleção 9 (deve selecionar I6)
force S "1001" 450ns

# Seleção 10 (deve selecionar I7)
force S "1010" 500ns

# Seleção 11 (deve selecionar I8)
force S "1011" 550ns

# Seleção 12 (deve selecionar I9)
force S "1100" 600ns

# Seleção 13 (deve selecionar I10)
force S "1101" 650ns

# Seleção 14 (deve selecionar I11)
force S "1110" 700ns

# Seleção 15 (deve selecionar I12)
force S "1111" 750ns

# Testa mudança nos valores das entradas
force I0 "11110000" 800ns
force I1 "00001111" 800ns
force S "0001" 800ns

force S "0010" 850ns

run 900ns
