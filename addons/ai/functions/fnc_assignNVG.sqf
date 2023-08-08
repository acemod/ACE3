#include "script_component.hpp"
/*
 * Author: Jonpas
 * Assigns AI first found NVG in their inventory during night time and unassigns it during day time.
 * Calls itself periodically.
 *
 * Arguments:
 * None

 * Return Value:
 * None
 *
 * Example:
 * [] call ace_ai_fnc_assignNVG
 *
 * Public: No
 */

if (!GVAR(assignNVG)) exitWith {};

private _equip = sunOrMoon < 1 || moonIntensity > 0.8;

{
    private _unit = _x;
    if (!isNull _unit && {!isPlayer _unit} && {alive _unit}) then {
        private _nvg = hmd _unit;

        if (_equip) then {
            if (_nvg == "") then {
                private _items = [_unit, false, true, true, true, false, false] call CBA_fnc_uniqueUnitItems; // backpack, vest, uniform
                {
                    if (getText (configFile >> "CfgWeapons" >> _x >> "simulation") == "NVGoggles") exitWith {
                        _unit assignItem _x;
                    };
                } forEach _items;
            };
        } else {
            if (_nvg != "" && {currentVisionMode _unit == 0} && {_unit canAdd _nvg}) then {
                _unit unassignItem _nvg;
            };
        };
    };
} forEach allUnits;

[FUNC(assignNVG), 300] call CBA_fnc_waitAndExecute;
