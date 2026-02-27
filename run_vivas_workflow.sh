#!/usr/bin/env bash

PROJ="$(dirname $0)"
CLI="python3 $PROJ/../../../code/cli_interface/main.py"

sed -r -i -e "s/(deployment-mode BOOLEAN ::= ).*/\1FALSE/" verification.asn

$CLI vivas asg -em -s $PROJ/abs_scenario.json -prj $PROJ

for scen in $PROJ/.workdir/abs_output/scenario_*.xml ;
do
	$CLI vivas csg -s $scen -prj $PROJ
done

sed -r -i -e "s/(deployment-mode BOOLEAN ::= ).*/\1TRUE/" verification.asn

make vivas

for scen in $PROJ/.workdir/con_output/*/concrete_scenario.yml ;
do
	$CLI vivas ss -s $scen -prj $PROJ
done

# If you want to view the traces, use this cmd
# ../../../code/vivas/vivas_traces_viewer.py -i interfaceview.xml -d ./work/dataview/dataview-uniq.asn -a .workdir/abs_output/scenario_00.xml -s .workdir/sim_output/00/concrete_scenario-sim.yml --s2s .workdir/variables.json --s2t .workdir/slim2taste_variables.json

# Not implemented
# for scen in $PROJ/.workdir/sim_output/*/concrete_scenario-sim.yml ;
# do
# 	$CLI vivas m -t $scen -g "$PROJ/.workdir/abs_output/scenario_$(echo "$scen" | sed 's:.*sim_output/\([0-9]*\)/concrete_scenario-sim.yml:\1:')_gen_propreties.json" -prj $PROJ
# done
