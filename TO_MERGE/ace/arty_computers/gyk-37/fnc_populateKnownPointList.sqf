#include "script_component.hpp"
_idc = _this;
_knownPoints = GVAR(currentComputer) getVariable [QGVAR(knownPoints), []];
// [_name, _pos, _alt]
lbClear _idc;
if(_idc == IDC_Main_KnownPointSelect) then {
	_index = lbAdd [_idc, "New Known Point"];
	lbSetValue [_idc, _index, -1];
} else {
	_index = lbAdd [_idc, "Select Known Point"];
	lbSetValue [_idc, _index, -1];
};
{
	_index = lbAdd [_idc, (_x select 0)];
	lbSetValue [_idc, _index, _forEachIndex];
} forEach _knownPoints;
lbSetCurSel [_idc, 0];