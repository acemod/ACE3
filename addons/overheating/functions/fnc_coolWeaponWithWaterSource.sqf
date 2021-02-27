#include "script_component.hpp"
/*
 * Author: mharis001, Glowbal, PabstMirror, drofseh
 * Cool a weapon with an AceX water source.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Player <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ACE_player, WaterTank] call ace_overheating_fnc_coolWeaponWithWaterSource
 *
 * Public: No
*/

params ["_player", "_target"];

private _weapon = currentWeapon _player;
private _tempVarName = format [QGVAR(%1_temp), _weapon];
private _temperature = _player getVariable [_tempVarName, 0];
private _consumeText = LLSTRING(CoolingWeaponWithWaterSource);
GVAR(coolingWeaponWithWaterSource) = false;

private _fnc_onFinish = {
    params ["_args"];
    _args params ["_player", "_target", "_weapon", "_tempVarName"];

    private _water = _target call acex_field_rations_fnc_getRemainingWater;

    if (_water <= 0 && {_water != -10}) exitWith {
        [
            [LLSTRING(CoolWeaponNotEnoughWater)],
            true
        ] call CBA_fnc_notify;
    };

    [_player, _player, currentWeapon _player] call ace_overheating_fnc_checkTemperature;
    GVAR(coolingWeaponWithWaterSource) = false;
};

private _fnc_condition = {
    params ["_args"];
    _args params ["_player", "_target", "_weapon", "_tempVarName"];

    private _temperature = _player getVariable [_tempVarName, 0];
    private _water = _target call acex_field_rations_fnc_getRemainingWater;

    if (_water <= 0 && {_water != -10}) exitWith {false};

    if !(GVAR(coolingWeaponWithWaterSource)) then {
        GVAR(coolingWeaponWithWaterSource) = true;

        //Remove water from the source, unless it's unlimited
        if (_water != -10) then {
            [_target, _water - 1] call acex_field_rations_fnc_setRemainingWater;
        };

        //Cool the weapon down
        private _barrelMass = _weapon call FUNC(getBarrelMass);
        _temperature = [_temperature, _barrelMass, 20] call FUNC(calculateCooling);
        [_player, _tempVarName, _temperature, TEMP_TOLERANCE] call EFUNC(common,setApproximateVariablePublic);

/* // to be added when licence compatible audio can be found or recorded
        // water sound, either boiling or not
        if (_temperature < 100) then {
            [
                [LLSTRING(CoolWeaponIsCool)],
                true // allows the hint to be overwritten by another hint, such as a jam or another cookoff
            ] call CBA_fnc_notify;

            playSound3D [
                QPATHTO_R(sounds\pouring_short.ogg),
                _player,
                false,
                AGLToASL (_player modelToWorld (_player selectionPosition "RightHand")),
                5, 1, 10
            ];
        } else {
            playSound3D [
                QPATHTO_R(sounds\sizzling_short.ogg),
                _player,
                false,
                AGLToASL (_player modelToWorld (_player selectionPosition "RightHand")),
                5, 1, 10
            ];
        };
*/

        // wait 1 second before allowing cooling to happen again
        [
            {
                GVAR(coolingWeaponWithWaterSource) = false;
            },
            [],
            1
        ] call CBA_fnc_waitAndExecute;
    };

    true
};

[
    1 max (_temperature / 10),
    [
        _player,
        _target,
        _weapon,
        _tempVarName
    ],
    _fnc_onFinish,
    _fnc_onFinish,
    _consumeText,
    _fnc_condition
] call EFUNC(common,progressBar);