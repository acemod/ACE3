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
 * [player, "ACE_M26_Clacker"] call ACE_Explosives_fnc_addDetonateActions;
 *
 * Public: No
 */
#include "script_component.hpp"
private ["_result", "_item", "_children", "_range", "_required"];

EXPLODE_2_PVT(_this,_unit,_detonator);
_range = GetNumber (ConfigFile >> "CfgWeapons" >> _detonator >> "ACE_Range");

_result = [_unit] call FUNC(getPlacedExplosives);
_children = [];
{
    if (!isNull(_x select 0)) then {
        _required = getArray (ConfigFile >> "ACE_Triggers" >> (_x select 4) >> "requires");
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
        };
    };
} foreach _result;

_children
