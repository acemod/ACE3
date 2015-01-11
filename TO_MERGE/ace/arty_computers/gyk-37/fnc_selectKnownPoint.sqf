//fnc_selectKnownPoint.sqf
#include "script_component.hpp"

_knownPoints = GVAR(currentComputer) getVariable [QGVAR(knownPoints), []];
_index = lbCurSel (_this select 0);
_val = (lbValue [(_this select 0), _index]);
if(_val >= 0) then {
	_data = _knownPoints select _val;
	_knownPointName = ctrlSetText [(_this select 1), (_data select 0)];
	_knownPointGrid = ctrlSetText [(_this select 2), (_data select 1)];
	_knownPointAlt = ctrlSetText [(_this select 3), (_data select 2)];
} else {
	_knownPointName = ctrlSetText [(_this select 1), ""];
	_knownPointGrid = ctrlSetText [(_this select 2), ""];
	_knownPointAlt = ctrlSetText [(_this select 3), ""];
};