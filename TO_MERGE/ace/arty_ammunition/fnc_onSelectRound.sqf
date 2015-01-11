#include "script_component.hpp"

private["_mag", "_magData", "_displayName", "_maxCharge", "_fuzeType", "_fuzeDesc"];

PARAMS_2(_nil,_index);

_mag = lbData [ROUNDS_LISTBOX_ID, _index];
GVAR(currentRoundType) = _mag;
_magData = configFile >> "CfgMagazines" >> _mag;

_displayName = getText(_magData >> "displayName");

ctrlSetText [12558, getText(_magData >> "ACE_ARTY_SHELL_IMAGE")];

ctrlSetText [12555, format["Prepare %1", _displayName]];

_maxCharge = getNumber(_magData >> "ACE_ARTY_MAXCHARGE");
GVAR(currentCharge) = _maxCharge;
ctrlSetText [12556, format["Current Charge: %1", _maxCharge]];
ctrlSetText [12559, format[getText(_magData >> "ACE_ARTY_CHARGE_IMAGE_FORMAT"), GVAR(currentCharge)]];


_fuzeType = getArray(_magData >> "ACE_ARTY_FUZE_TYPES");
_fuzeDesc = getArray(_magData >> "ACE_ARTY_FUZE_DESC");
if (GVAR(currentFuze) == "") then {
	GVAR(currentFuze) = _fuzeType select 0;
};
lbClear 12557;
_selectFuzeIndex = 0;
{
	private["_desc", "_index"];
	_desc = _fuzeDesc select _forEachIndex;
	_index = lbAdd [12557, format["%1", _desc]];
	lbSetData [12557, _index, _x];
	if (_x == GVAR(currentFuze)) then {
		_selectFuzeIndex = _index;
	};
} forEach(_fuzeType);
lbSetCurSel [12557, _selectFuzeIndex];