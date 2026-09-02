vsim banco_registradores

add wave *

force ck 0 0ns, 1 5ns -repeat 10ns
force clr 1 0ns, 0 10ns

# Escreve em diferentes registradores
force w_reg 0 ns, 1 20ns
force r_reg 1 20ns, 0 20ns
force count "0000" 0ns
force w_data "1111111111111" 0ns

force count "0001" 40ns
force w_data "1010101010101" 40ns

force count "0010" 60ns
force w_data "1100110011001" 60ns

force count "0011" 80ns
force w_data "1000100010001" 80ns

force count "0100" 100ns
force w_data "0111011101110" 100ns

# Desabilita escrita, habilita leitura
force w_reg 0 120ns
force r_reg 1 120ns

# Le os registradores escritos
force count "0000" 130ns
force count "0001" 150ns
force count "0010" 170ns
force count "0011" 190ns
force count "0100" 210ns

# Testa leitura de registrador não escrito
force count "1111" 230ns

run 250ns
