#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Gets the sound attenuation of a player to the outside.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Amount that unit can hear outside <NUMBER>
 *
 * Example:
 * call ace_hearing_fnc_updatePlayerVehAttenuation
 *
 * Public: No
 */

private _vehicle = vehicle ACE_player;

if (isNull _vehicle) exitWith {};

private _newAttenuation = 1;

if (ACE_player != _vehicle) then {
    private _vehicleConfig = configOf _vehicle;
    private _turretPath = _vehicle unitTurret ACE_player;
    private _effectType = getText (_vehicleConfig >> "attenuationEffectType");

    if (_turretPath isNotEqualTo []) then {
        private _turretConfig = [_vehicleConfig, _turretPath] call EFUNC(common,getTurretConfigPath);

        if ((getNumber (_turretConfig >> "disableSoundAttenuation")) == 1) then {
            _effectType = "";
        } else {
            if (isText (_turretConfig >> "soundAttenuationTurret")) then {
                _effectType = getText (_turretConfig >> "soundAttenuationTurret");
            };
        };
    };

    _newAttenuation = switch (true) do {
        case (_effectType == ""): {1};
        case (_effectType == "CarAttenuation");
        case (_effectType == "RHS_CarAttenuation"): { // Increase protection for armored cars
            private _armor = getNumber (_vehicleConfig >> "HitPoints" >> "HitBody" >> "armor");
            linearConversion [2, 8, _armor, 0.5, 0.3, true];};
        case (_effectType == "OpenCarAttenuation"): {1};
        case (_effectType == "TankAttenuation"): {0.1};
        case (_effectType == "MrapAttenuation"): {0.2};
        case (_effectType == "HeliAttenuation"): {0.3};
        case (_effectType == "OpenHeliAttenuation"): {0.9};
        case (_effectType == "SemiOpenCarAttenuation");
        case (_effectType == "SemiOpenCarAttenuation2");
        case (_effectType == "SemiOpenHeliAttenuation"): {0.6};
        case (_effectType == "HeliAttenuationGunner"): {0.85};
        case (_effectType == "HeliAttenuationRamp"): {0.85};
        default {1};
    };
};

TRACE_2("New vehicle attenuation",_vehicle,_newAttenuation);

GVAR(playerVehAttenuation) = _newAttenuation;
