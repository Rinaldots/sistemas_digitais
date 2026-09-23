vsim ATV_4
add wave *

# clock com periodo de 100ns
force ck 1 0ns, 0 5ns -repeat 10ns

# CLEAR ativo em nivel baixo (KEY[0]): led na linha 0 / coluna 0
force clr 0
force CIMA 0
force BAIXO 0
force ESQUERDA 0
force DIREITA 0
run 100ns
force clr 1

# Sequencia do PDF: SW[3] (esq), SW[0] (dir), SW[2] (cima), SW[1] (baixo)
force ESQUERDA 1
run 100ns
force ESQUERDA 0
force DIREITA 1
run 100ns
force DIREITA 0
force CIMA 1
run 100ns
force CIMA 0
force BAIXO 1
run 100ns
force BAIXO 0
run 100ns
