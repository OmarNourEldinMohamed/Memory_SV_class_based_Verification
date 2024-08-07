vlog -f code/list.list -mfcu +cover
vsim -voptargs=+acc work.top -cover
coverage save memory.ucdb -onexit -du work.top
run -all
coverage report -detail -cvg -directive -comments -output report/fcover_report.txt
quit -sim
vcover report memory.ucdb -details -annotate -all -output report/code_report.txt
