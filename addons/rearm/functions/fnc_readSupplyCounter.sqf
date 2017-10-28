/*
 * Author: GitHawk
 * Get the remaining ammunition amount.
 *
 * Arguments:
 * 0: Ammo Truck <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ammo_truck, player] call ace_rearm_fnc_readSupplyCounter
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_truck", "_unit"];
TRACE_2("readSupplyCounter",_truck,_unit);

if (GVAR(supply) == 0) exitWith {WARNING("Supply is unlimited");};

if (GVAR(supply) == 1) then {
    [
        TIME_PROGRESSBAR(5),
        [_unit, _truck, [_truck] call FUNC(getSupplyCount)],
        {
            params ["_args"];
            _args params [["_unit", objNull, [objNull]], ["_truck", objNull, [objNull]], ["_supplyCount", 0, [0]]];
            if (_supplyCount > 0 ) then {
                [[LSTRING(Hint_RemainingSupplyPoints), _supplyCount], 2, _unit] call EFUNC(common,displayTextStructured);
            } else {
                [LSTRING(Hint_Empty), 2, _unit] call EFUNC(common,displayTextStructured);
            };
            true
        },
        {true},
        localize LSTRING(ReadSupplyCounterAction),
        {true},
        ["isnotinside"]
    ] call EFUNC(common,progressBar);
} else {
    [
        TIME_PROGRESSBAR(5),
        [_unit, _truck],
        {
            params ["_args"];
            _args params [["_unit", objNull, [objNull]], ["_truck", objNull, [objNull]]];
            private _supply = 1.5;
            private _numChars = count (localize LSTRING(Hint_RemainingAmmo));
            private _text = "";
            private _magazines = _truck getVariable QGVAR(magazineSupply);
            if !(isNil "_magazines") then {
                {
                    _x params ["_magazineClass", "_rounds"];
                    private _line = format ["%1: %2",  getText(configFile >> "CfgMagazines" >> _magazineClass >> "displayName"), _rounds];
                    _numChars = _numChars max (count _line);
                    _text = format ["%1<br/>%2", _text, _line];
                    _supply = _supply + 0.5;
                    false
                } count _magazines;
            };
            if (_supply > 1.5) then {
                [[LSTRING(Hint_RemainingAmmo), _text], _supply, _unit, (_numChars/2.9)] call EFUNC(common,displayTextStructured);
            } else {
                [LSTRING(Hint_Empty), 2, _unit] call EFUNC(common,displayTextStructured);
            };
            true
        },
        {true},
        localize LSTRING(ReadSupplyCounterAction),
        {true},
        ["isnotinside"]
    ] call EFUNC(common,progressBar);
};
