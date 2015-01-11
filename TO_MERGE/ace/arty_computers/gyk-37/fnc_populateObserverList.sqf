#include "script_component.hpp"
_idc = _this;
_observers = GVAR(currentComputer) getVariable [QGVAR(observers), []];
// [_name, _pos, _alt]
lbClear _idc;
_index = lbAdd [_idc, "New Observer"];
lbSetValue [_idc, _index, -1];
{
	_index = lbAdd [_idc, (_x select 0)];
	lbSetValue [_idc, _index, _forEachIndex];
} forEach _observers;
lbSetCurSel [_idc, 0];