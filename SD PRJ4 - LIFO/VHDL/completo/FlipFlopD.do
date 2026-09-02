vsim ffd

add wave *

force ck 0 0ns, 1 5ns -repeat 10ns
force clr 0 0ns, 1 2000ns
force set 1 0ns, 0 1000ns
force d 0 0ns, 1 50ns, 0 70ns, 1 90ns, 0 110ns

run 130ns
