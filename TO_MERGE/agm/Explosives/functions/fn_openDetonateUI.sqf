/*
	Name: AGM_Explosives_fnc_openDetonateUI
	
	Author: Garth de Wet (LH)
	
	Description:
		Opens the UI for explosive detonation selection
	
	Parameters: 
		0: OBJECT - unit
		0: STRING - Classname of detonator
	
	Returns:
		Nothing
	
	Example:
		[player, "AGM_M26_Clacker"] call AGM_Explosives_fnc_openDetonateUI;
*/
private ["_unit","_result", "_item"];
call AGM_Interaction_fnc_hideMenu;
_unit = _this select 0;
_detonator = _this select 1;
_range = GetNumber (ConfigFile >> "CfgWeapons" >> _detonator >> "AGM_Range");

_result = [_unit] call AGM_Explosives_fnc_getPlacedExplosives;
_actions = [localize "STR_AGM_Explosives_DetonateMenu", localize "STR_AGM_Explosives_Detonate"] call AGM_Interaction_fnc_prepareSelectMenu;
_count = 0;
{
	if (!isNull(_x select 0)) then {
		_required = getArray (ConfigFile >> "CfgAGM_Triggers" >> (_x select 4) >> "requires");
		if (_detonator in _required) then {
			_item = ConfigFile >> "CfgMagazines" >> (_x select 3);
			_actions = [
				_actions,
				_x select 2,
				getText(_item >> "picture"),
				[_foreachIndex, _range]
			] call AGM_Interaction_fnc_AddSelectableItem;
			_count = _count + 1;
		};
	};
} foreach _result;
if (_count > 0) then {
	[
		_actions,
		{
			[
				AGM_player,
				[_this select 1] call AGM_Core_fnc_toNumber,
				(AGM_player getVariable ["AGM_Clacker", []]) select ([_this select 0] call AGM_Core_fnc_toNumber),
				false
			] call AGM_Explosives_fnc_DetonateExplosive;
			call AGM_Interaction_fnc_hideMenu;
		},
		{[AGM_player] call AGM_Explosives_fnc_openTransmitterUI;}
	] call AGM_Interaction_fnc_openSelectMenu;
}else{
	call AGM_Interaction_fnc_hideMenu;
	[AGM_player] call AGM_Explosives_fnc_openTransmitterUI;
	[localize "STR_AGM_Explosives_NoExplosivesAvailable"] call AGM_Core_fnc_displayTextStructured;
};
