//fnc_modifyKnownPoint.sqf
#include "script_component.hpp"

_knownPoints = GVAR(currentComputer) getVariable [QGVAR(knownPoints), []];
_knownPointName = ctrlText (_this select 1);
_knownPointGrid = ctrlText (_this select 2);
_knownPointAlt = ctrlText (_this select 3);

_clear = false;
if((count _this) > 4) then {
	_clear = _this select 4;
};

_index = lbCurSel (_this select 0);

if(_index == 0) then {
	_knownPoints set[(count _knownPoints), [_knownPointName,_knownPointGrid,_knownPointAlt]];
	GVAR(currentComputer) setVariable [QGVAR(knownPoints), _knownPoints, true];
	_logMsg = format["Added Known Point %1 at Grid: %2 Alt: %3", _knownPointName,_knownPointGrid,_knownPointAlt];
	BCSLOG(_logMsg);
} else {
	_obIndex = lbValue [(_this select 0), _index];
	_knownPoints set[_obIndex, [_knownPointName,_knownPointGrid,_knownPointAlt]];
	GVAR(currentComputer) setVariable [QGVAR(knownPoints), _knownPoints, true];
	_logMsg = format["Updated Known Point %1 at Grid: %2 Alt: %3", _knownPointName,_knownPointGrid,_knownPointAlt];
	BCSLOG(_logMsg);
};
(_this select 0) call FUNC(populateKnownPointList);
if(_clear) then {
	ctrlSetText [(_this select 1), ""];
	ctrlSetText [(_this select 2), ""];
	ctrlSetText [(_this select 3), ""];
} else {
	lbSetCurSel [(_this select 0), (count _knownPoints)];
};