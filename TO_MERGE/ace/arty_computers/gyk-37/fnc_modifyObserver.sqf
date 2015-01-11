//fnc_modifyObserver.sqf
#include "script_component.hpp"

_observers = GVAR(currentComputer) getVariable [QGVAR(observers), []];
_observerName = ctrlText (_this select 1);
_observerGrid = ctrlText (_this select 2);
_observerAlt = ctrlText (_this select 3);

_clear = false;
if((count _this) > 4) then {
	_clear = _this select 4;
};

_index = lbCurSel (_this select 0);

if(_index == 0) then {
	_observers set[(count _observers), [_observerName,_observerGrid,_observerAlt]];
	GVAR(currentComputer) setVariable [QGVAR(observers), _observers, true];
	_logMsg = format["Added Observer %1 at Grid: %2 Alt: %3", _observerName,_observerGrid,_observerAlt];
	BCSLOG(_logMsg);
} else {
	_obIndex = lbValue [(_this select 0), _index];
	_observers set[_obIndex, [_observerName,_observerGrid,_observerAlt]];
	GVAR(currentComputer) setVariable [QGVAR(observers), _observers, true];
	_logMsg = format["Updated Observer %1 at Grid: %2 Alt: %3", _observerName,_observerGrid,_observerAlt];
	BCSLOG(_logMsg);
};
(_this select 0) call FUNC(populateObserverList);
if(_clear) then {
	ctrlSetText [(_this select 1), ""];
	ctrlSetText [(_this select 2), ""];
	ctrlSetText [(_this select 3), ""];
} else {
	lbSetCurSel [(_this select 0), (count _observers)];
};