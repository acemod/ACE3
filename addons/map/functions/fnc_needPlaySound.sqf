#include "script_component.hpp"
/*
 * Author: Dystopian
 * Checks if sound needs to be played when flashlight is toggled.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Flashlight <STRING>
 *
 * Return Value:
 * Need to play sound <BOOL>
 *
 * Example:
 * [player, "acc_flashlight"] call ace_map_fnc_needPlaySound
 *
 * Public: No
 */

params ["_unit", "_flashlight"];

if (_flashlight isEqualTo "") exitWith {
    LOG("empty flashlight");
    false
};

private _currentWeapon = currentWeapon _unit;
if (
    _unit isFlashlightOn _currentWeapon
    // _currentWeapon==_flashlight should be checked here but it's not supported by isFlashlightOn
    && {_flashlight isEqualTo ((weaponsItems _unit select {(_x select 0) isEqualTo _currentWeapon}) select 0 select 2)}
) exitWith {
    TRACE_1("weapon flashlight is on",_flashlight);
    false
};

private _config = configFile >> "CfgWeapons" >> _flashlight >> "ItemInfo" >> "FlashLight";
if (!isClass _config) exitWith {
    TRACE_1("weapon with unmountable flashlight",_flashlight);
    true
};

0 < [_config >> "ACE_Flashlight_Sound", "number", 1] call CBA_fnc_getConfigEntry
