#~/bin/sh

rm --f outputs/odb/*
rm --f outputs/mxdb/*

rm --f outputs/db/*

rm --f outputs/logs/*.log
rm --f outputs/logs/*.cmd
rm --f outputs/logs/*.dbg
rm --f outputs/rpt/*.rpt

rm --f outputs/verilog/*
rm --f outputs/constraints/*
rm --f outputs/floorplan/*
rm --f outputs/dft/*

rm --f oasys.cmd*
rm --f oasys.dbg*
rm --f oasys.log*

echo "\n-------------------------------------"
echo "\nCleanup Complete"
echo "\n-------------------------------------\n"
