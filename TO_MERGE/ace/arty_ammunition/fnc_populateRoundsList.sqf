//#define DEBUG_MODE_FULL
#include "script_component.hpp"
private["_cargoArray", "_mag", "_count", "_displayName", "_ammoCrate", "_isRound", "_index"];

_ammoCrate = GVAR(currentAmmoCrate);
if (_ammoCrate isKindOf "ACE_Arty_ShellHolder") then {
	_mag = getText (configFile >> "CfgVehicles" >> (typeOf _ammoCrate) >> "ACE_ARTY_MAGAZINE_CLASS");
	_cargoArray = [[_mag], [1]];
} else {
	_cargoArray = getMagazineCargo _ammoCrate;
};

TRACE_2("AMMMMOOOO CRATE", _ammoCrate, _cargoArray);
{
	_mag = _x;
	_isRound = [_mag, "ace_arty_howitzer_default", "CfgMagazines"] call FUNC(isKindOf);
	TRACE_2("", _mag,_isRound);
	if (_isRound) then {
		_count = (_cargoArray select 1) select _forEachIndex;
		_displayName = getText (configFile >> "CfgMagazines" >> _mag >> "displayName");
		_index = lbAdd [ROUNDS_LISTBOX_ID, format["%1 -- %2", _count, _displayName]];
		TRACE_2("",_count,_displayName);
		lbSetData [ROUNDS_LISTBOX_ID, _index, _mag];
	};
	
} forEach (_cargoArray select 0);
if (count (_cargoArray select 0) > 0) then {
	lbSetCurSel [ROUNDS_LISTBOX_ID, 0];
	[ROUNDS_LISTBOX_ID, 0] call FUNC(onSelectRound);
};
