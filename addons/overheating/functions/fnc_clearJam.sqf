#include "script_component.hpp"
/*
 * Author: Commy2
 * Make the unit clear the jam from a weapon
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Weapon <STRING>
 * 2: Skip anim? <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, currentWeapon player, false] call ace_overheating_fnc_clearJam
 *
 * Public: No
 */

params ["_unit", "_weapon", ["_skipAnim", false]];
TRACE_3("params",_unit,_weapon,_skipAnim);

private _jammedWeapons = _unit getVariable [QGVAR(jammedWeapons), []];

if (_weapon in _jammedWeapons) then {
    private _delay = 0;
    if !(_skipAnim) then {
        _delay = 2.5;
        private _clearJamAction = getText (configFile >> "CfgWeapons" >> _weapon >> "ACE_clearJamAction");

        if (_clearJamAction == "") then {
            _clearJamAction = getText (configFile >> "CfgWeapons" >> _weapon >> "reloadAction");
        };

        [_unit, _clearJamAction, 1] call EFUNC(common,doGesture);

        if (_weapon == primaryWeapon _unit) then {
            playSound QGVAR(fixing_rifle);
        } else {
            if (_weapon == handgunWeapon _unit) then {
                playSound QGVAR(fixing_pistol);
            };
        };
    };

    // Check if the jam clearing will be successfull
    if (random 1 > GVAR(unJamFailChance)) then {
        // Success

        [{
            params ["_unit", "_weapon", "_jammedWeapons"];
            _jammedWeapons = _jammedWeapons - [_weapon];
            _unit setVariable [QGVAR(jammedWeapons), _jammedWeapons];

            // If the round is a dud eject the round
            if (_unit getVariable [format [QGVAR(%1_jamType), _weapon], "None"] isEqualTo "Dud") then {
                private _ammo = _unit ammo _weapon;
                _unit setAmmo [_weapon, _ammo - 1];
            };

            _unit setVariable [format [QGVAR(%1_jamType), _weapon], "None"];

            if (_jammedWeapons isEqualTo []) then {
                private _id = _unit getVariable [QGVAR(JammingActionID), -1];
                [_unit, "DefaultAction", _id] call EFUNC(common,removeActionEventHandler);
                _unit setVariable [QGVAR(JammingActionID), -1];
            };

            if (GVAR(DisplayTextOnJam)) then {
                [localize LSTRING(WeaponUnjammed)] call EFUNC(common,displayTextStructured);
            };
        }, [_unit, _weapon, _jammedWeapons], _delay] call CBA_fnc_waitAndExecute;
    } else {
        // Failure
        if (GVAR(DisplayTextOnJam)) then {
            [{
                [localize LSTRING(WeaponUnjamFailed)] call EFUNC(common,displayTextStructured);
            }, [], _delay] call CBA_fnc_waitAndExecute;
        };
    };
};
