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

params ["_unit", "_detonator"];
TRACE_2("params",_unit,_detonator);

private ["_result", "_item", "_children", "_range", "_required","_explosivesList"];

_range = getNumber (ConfigFile >> "CfgWeapons" >> _detonator >> QGVAR(Range));

_result = [_unit] call FUNC(getPlacedExplosives);
_children = [];
_explosivesList = [];
{
    if (!isNull(_x select 0)) then {
        _required = getArray (ConfigFile >> "ACE_Triggers" >> (_x select 4) >> "requires");
        if (_detonator in _required) then {
            _item = ConfigFile >> "CfgMagazines" >> (_x select 3);

            _explosivesList pushBack _x;

            _children pushBack
                [
                    [
                        format ["Explosive_%1", _forEachIndex],
                        _x select 2,
                        getText(_item >> "picture"),
                        {(_this select 2) call FUNC(detonateExplosive);},
                        {true},
                        {},
                        [_unit,_range,_x]
                    ] call EFUNC(interact_menu,createAction),
                    [],
                    _unit
                ];
        };
    };
} forEach _result;

// Add action to detonate all explosives tied to the detonator
if (count _explosivesList > 0) then {
    _children pushBack [
        [
            "Explosive_All",
            localize LSTRING(DetonateAll), 
            getText(ConfigFile >> "CfgWeapons" >> _detonator >> "picture"),
            {(_this select 2) call FUNC(detonateExplosiveAll);},
            {true},
            {},
            [_unit,_range,_explosivesList]
        ] call EFUNC(interact_menu,createAction),
        [],
        _unit
    ];
};

_children
