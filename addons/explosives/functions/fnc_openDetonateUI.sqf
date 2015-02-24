/*
 * Author: Garth 'L-H' de Wet
 * Opens the UI for explosive detonation selection
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Trigger classname <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "ACE_M26_Clacker"] call ACE_Explosives_fnc_openDetonateUI;
 *
 * Public: No
 */
#include "script_component.hpp"
private ["_unit","_result", "_item"];
call EFUNC(interaction,hideMenu);
_unit = _this select 0;
_detonator = _this select 1;
_range = GetNumber (ConfigFile >> "CfgWeapons" >> _detonator >> "ACE_Range");

_result = [_unit] call FUNC(getPlacedExplosives);
_actions = [localize "STR_ACE_Explosives_DetonateMenu", localize "STR_ACE_Explosives_Detonate"]
	call EFUNC(interaction,prepareSelectMenu);
_count = 0;
{
	if (!isNull(_x select 0)) then {
		_required = getArray (ConfigFile >> "CfgACE_Triggers" >> (_x select 4) >> "requires");
		if (_detonator in _required) then {
			_item = ConfigFile >> "CfgMagazines" >> (_x select 3);
			_actions = [
				_actions,
				_x select 2,
				getText(_item >> "picture"),
				[_foreachIndex, _range]
			] call EFUNC(interaction,AddSelectableItem);
			_count = _count + 1;
		};
	};
} foreach _result;
if (_count > 0) then {
	[
		_actions,
		{
			[
				ACE_player,
				[_this select 1] call EFUNC(common,toNumber),
				(ACE_player getVariable [QGVAR(Clackers), []]) select ([_this select 0] call EFUNC(common,toNumber)),
				false
			] call FUNC(detonateExplosive);
			call EFUNC(interaction,hideMenu);
		},
		{[ACE_player] call FUNC(openTransmitterUI);}
	] call EFUNC(interaction,openSelectMenu);
}else{
	call EFUNC(interaction,hideMenu);
	[ACE_player] call FUNC(openTransmitterUI);
	[localize "STR_ACE_Explosives_NoExplosivesAvailable"] call EFUNC(common,displayTextStructured);
};
