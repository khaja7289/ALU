drc off
box 0 0 0 0
gds readonly true
gds rescale false
gds read /usr/share/qflow/tech/osu018/osu018_stdcells.gds2
load ALU_64bit
select top cell
expand
gds write ALU_64bit
quit
