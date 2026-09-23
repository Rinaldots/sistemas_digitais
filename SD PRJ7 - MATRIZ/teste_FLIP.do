# 1. Adiciona todos os sinais na tela gráfica de ondas
vsim bit8_flip_d


add wave *

# 2. Define o clock oscilando a cada 50ns (período de 100ns)
force ck 1 0ns, 0 5ns -repeat 10ns

# 3. Dá o RESET inicial no circuito para limpar o lixo de memória
force clr 1 0ns, 0 10ns
force S(0) 1 0ns, 0 20ns -repeat 40ns
force S(1) 1 0ns, 0 40ns -repeat 80ns

run 300ns
# LEITURA NA TELA: SAIDA_HOR e SAIDA_VERT devem estar em "00000000" (Hex 00)
