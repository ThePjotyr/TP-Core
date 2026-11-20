# Item on_place handler (as the player; storage tp_core:item cur.id). The base block was just placed: find it along the view.
function tp_core:ray/cast {range:8,step:0.25,fn:"tp_core:block/probe"}
