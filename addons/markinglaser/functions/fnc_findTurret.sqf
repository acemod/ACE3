#include "..\script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Finds the turret that has control over the marking laser.
 *
 * Arguments:
 * 0: Aircraft config <CONFIG>
 *
 * Return Value:
 * <ARRAY>
 *
 * Example:
 * [configOf _plane] call ace_markinglaser_fnc_findTurret
 *
 * Public: No
 */

params ["_config"];

private _copilotPath = nil;
private _copilotConfig = configNull;
private _primaryPath = nil;
private _primaryConfig = configNull;
private _isUAV = getNumber (_config >> "isUAV") == 1;

private _walkTurrets = {
    params ["_path", "_turrets"];

    {
        // Check turret rotation for symmetry, filters door gunner turrets
        if (abs getNumber (_x >> "minTurn") != abs getNumber (_x >> "maxTurn")) then {
            continue;
        };

        // Check if turret has a optics with night or thermal vision
        private _visionModes = flatten (("true" configClasses (_x >> "OpticsIn")) apply {
            (getArray (_x >> "visionMode")) apply {toLowerANSI _x}
        });

        if !("nvg" in _visionModes || {"ti" in _visionModes}) then {
            continue;
        };

        // Use copilot turret if possible
        // Not all helicopter gun turrets use this flag (for example the Kajman)
        if (getNumber (_x >> "isCopilot") == 1) then {
            _copilotPath = _path + [_forEachIndex];
            _copilotConfig = _x;
            break;
        };

        // Fallback to primary gunner
        if (isNil "_primaryPath" && {getNumber (_x >> "primaryGunner") == 1}) then {
            _primaryPath = _path + [_forEachIndex];
            _primaryConfig = _x;
        };

        // Search subturrets
        if (isClass (_x >> "Turrets")) then {
            private _turrets = "true" configClasses (_x >> "Turrets");
            [_path + [_forEachIndex], _turrets] call _walkTurrets;
        };
    } forEach _turrets;
};

[[], "true" configClasses (_config >> "Turrets")] call _walkTurrets;

if (!isNil "_copilotPath") exitWith {
    [_copilotPath, _copilotConfig]
};
if (!isNil "_primaryPath") exitWith {
    [_primaryPath, _primaryConfig]
};

[]
