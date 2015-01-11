//fnc_setFuzeSelection.sqf
#include "script_component.hpp"

_ammoType = _this select 0;
_selectedFuze = _this select 1;
_fuzes = getArray(configFile >> "CfgMagazines" >> _ammoType >> "ACE_ARTY_FUZE_TYPES");
_fuzeNames = getArray(configFile >> "CfgMagazines" >> _ammoType >> "ACE_ARTY_FUZE_DESC");
_selectIndex = 0;
lbClear IDC_Mission_EngageFuzeTypeSelect;
{
	_displayName = _fuzeNames select _forEachIndex;
	_index = lbAdd [IDC_Mission_EngageFuzeTypeSelect, _displayName];
	lbSetData [IDC_Mission_EngageFuzeTypeSelect, _index, _x];
	if(_x == _selectedFuze) then {
		_selectIndex = _forEachIndex;
	};
} forEach (_fuzes);
lbSetCurSel [IDC_Mission_EngageFuzeTypeSelect, _selectIndex];