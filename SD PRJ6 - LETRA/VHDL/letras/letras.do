# Simulacao do main.vhd (entidade LETRAS)
# Uso: no ModelSim, com a pasta "letras" como diretorio atual, rode: do letras.do

quit -sim

# Compila dos componentes basicos ate o topo
if {![file exists work]} { vlib work }
vcom -2002 -explicit mux2x1.vhd mux4x1.vhd mux8x1.vhd mux16x1.vhd mux8x8.vhd mux16x35.vhd main.vhd

vsim work.letras

add wave -divider entradas
add wave -radix binary SEL COL
add wave -divider saidas
add wave -radix binary -expand LEDR
add wave -radix binary LEDG
add wave -divider internos
add wave -radix hexadecimal NOTSEL
add wave -radix unsigned NOTCOL
add wave -radix binary DIGITO_SEL COL0 COL1 COL2 COL3 COL4 INVERTLEDR

# SEL e COL sao invertidos no circuito (NOTSEL / NOTCOL), entao as entradas
# contam para baixo para que NOTSEL va de 0 a F e NOTCOL de 0 a 7, em ordem.

# COL: 111 -> 000, 10 ns em cada valor (ciclo de 80 ns)
force COL(0) 1 0ns, 0 10ns -repeat 20ns
force COL(1) 1 0ns, 0 20ns -repeat 40ns
force COL(2) 1 0ns, 0 40ns -repeat 80ns

# SEL: 1111 -> 0000, troca de caractere a cada ciclo completo de COL (80 ns)
force SEL(0) 1 0ns, 0 80ns -repeat 160ns
force SEL(1) 1 0ns, 0 160ns -repeat 320ns
force SEL(2) 1 0ns, 0 320ns -repeat 640ns
force SEL(3) 1 0ns, 0 640ns -repeat 1280ns

# 16 caracteres x 8 posicoes de COL x 10 ns = 1280 ns
run 1280ns
wave zoom full
