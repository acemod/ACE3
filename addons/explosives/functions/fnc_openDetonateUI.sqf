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
private ["_unit","_result", "_item", "_children"];
call EFUNC(interaction,hideMenu);
_unit = _this select 0;
_detonator = _this select 1;
_range = GetNumber (ConfigFile >> "CfgWeapons" >> _detonator >> "ACE_Range");

_result = [_unit] call FUNC(getPlacedExplosives);
_children = [];
_count = 0;
{
	if (!isNull(_x select 0)) then {
		_required = getArray (ConfigFile >> "CfgACE_Triggers" >> (_x select 4) >> "requires");
		if (_detonator in _required) then {
			_item = ConfigFile >> "CfgMagazines" >> (_x select 3);

			_children pushBack
				[
					[
						format ["Explosive_%1", _forEachIndex],
						_x select 2,
						getText(_item >> "picture"),
						{(_this select 2) call FUNC(detonateExplosive);},
						{true},
						{},
						[ACE_player,_range,_x]
					] call EFUNC(interact_menu,createAction),
					[],
					ACE_Player
				];
			_count = _count + 1;
		};
	};
} foreach _result;
if (_count == 0) then {
	call EFUNC(interaction,hideMenu);
	[localize "STR_ACE_Explosives_NoExplosivesAvailable"] call EFUNC(common,displayTextStructured);
};

_children
