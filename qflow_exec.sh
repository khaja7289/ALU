#!/usr/bin/tcsh -f
#-------------------------------------------
# qflow exec script for project /home/khaja/Desktop/verilog/qflow/64bitalu
#-------------------------------------------

# /usr/lib/qflow/scripts/synthesize.sh /home/khaja/Desktop/verilog/qflow/64bitalu ALU_64bit /home/khaja/Desktop/verilog/qflow/64bitalu/source/ALU_64bit.v || exit 1
# /usr/lib/qflow/scripts/placement.sh -d /home/khaja/Desktop/verilog/qflow/64bitalu ALU_64bit || exit 1
# /usr/lib/qflow/scripts/opensta.sh  /home/khaja/Desktop/verilog/qflow/64bitalu ALU_64bit || exit 1
# /usr/lib/qflow/scripts/vesta.sh -a /home/khaja/Desktop/verilog/qflow/64bitalu ALU_64bit || exit 1
# /usr/lib/qflow/scripts/router.sh /home/khaja/Desktop/verilog/qflow/64bitalu ALU_64bit || exit 1
# /usr/lib/qflow/scripts/opensta.sh  -d /home/khaja/Desktop/verilog/qflow/64bitalu ALU_64bit || exit 1
# /usr/lib/qflow/scripts/vesta.sh -a -d /home/khaja/Desktop/verilog/qflow/64bitalu ALU_64bit || exit 1
# /usr/lib/qflow/scripts/migrate.sh /home/khaja/Desktop/verilog/qflow/64bitalu ALU_64bit || exit 1
# /usr/lib/qflow/scripts/drc.sh /home/khaja/Desktop/verilog/qflow/64bitalu ALU_64bit || exit 1
# /usr/lib/qflow/scripts/lvs.sh /home/khaja/Desktop/verilog/qflow/64bitalu ALU_64bit || exit 1
/usr/lib/qflow/scripts/gdsii.sh /home/khaja/Desktop/verilog/qflow/64bitalu ALU_64bit || exit 1
# /usr/lib/qflow/scripts/cleanup.sh /home/khaja/Desktop/verilog/qflow/64bitalu ALU_64bit || exit 1
# /usr/lib/qflow/scripts/display.sh /home/khaja/Desktop/verilog/qflow/64bitalu ALU_64bit || exit 1
