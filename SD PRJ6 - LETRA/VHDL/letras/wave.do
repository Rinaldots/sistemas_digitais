onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /letras/SEL
add wave -noupdate /letras/COL
add wave -noupdate -expand /letras/LEDR
add wave -noupdate /letras/LEDG
add wave -noupdate /letras/DIGITO_SEL
add wave -noupdate /letras/COL0
add wave -noupdate /letras/COL1
add wave -noupdate /letras/COL2
add wave -noupdate /letras/COL3
add wave -noupdate /letras/COL4
add wave -noupdate -radix hexadecimal /letras/NOTSEL
add wave -noupdate -radix unsigned /letras/NOTCOL
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {768174 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {352588 ps} {1145644 ps}
