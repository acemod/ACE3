//fnc_selectObserver.sqf
#include "script_component.hpp"


_observers = GVAR(currentComputer) getVariable [QGVAR(observers), []];
_index = lbCurSel (_this select 0);
_val = lbValue [(_this select 0), _index];
if(_val >= 0) then {
	_data = _observers select _val;
	_observerName = ctrlSetText [(_this select 1), (_data select 0)];
	_observerGrid = ctrlSetText [(_this select 2), (_data select 1)];
	_observerAlt = ctrlSetText [(_this select 3), (_data select 2)];
} else {
	_observerName = ctrlSetText [(_this select 1), ""];
	_observerGrid = ctrlSetText [(_this select 2), ""];
	_observerAlt = ctrlSetText [(_this select 3), ""];
};