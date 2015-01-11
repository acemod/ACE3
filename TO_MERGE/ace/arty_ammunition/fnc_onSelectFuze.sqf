#include "script_component.hpp"
private["_fuzeType"];

PARAMS_2(_nil,_index);

_fuzeType = lbData [12557, _index];
GVAR(currentFuze) = _fuzeType;
if (_fuzeType == "time") then {
	ctrlShow [12560, true];
	ctrlShow [12561, true];
	ctrlShow [12562, true];
	ctrlSetText [12560,format["%1", GVAR(fuzeTime)]];
} else {
	ctrlShow [12560, false];
	ctrlShow [12561, false];
	ctrlShow [12562, false];
};