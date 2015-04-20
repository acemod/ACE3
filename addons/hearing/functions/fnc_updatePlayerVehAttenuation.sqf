/*
 * Author: PabstMirror
 * Gets the sound attenuation of a player to the outside.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Ammount that unit can hear outside <NUMBER>
 *
 * Example:
 * [] call ace_hearing_fnc_updatePlayerVehAttenuation
 *
 * Public: No
 */
#include "script_component.hpp"

_vehicle = vehicle ACE_player;

if (isNull _vehicle) exitWith {};

_newAttenuation = 1;
if (ACE_player != _vehicle) then {
    _effectType = "";
    _turretPath = [ACE_player] call EFUNC(common,getTurretIndex);
    _effectType = getText (configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "attenuationEffectType");

    if (!(_turretPath isEqualTo [])) then {
        _turretConfig = [(configFile >> "CfgVehicles" >> (typeOf _vehicle)), _turretPath] call EFUNC(common,getTurretConfigPath);

        if ((getNumber (_turretConfig >> "disableSoundAttenuation")) == 1) then {
            _effectType = "";
        } else {
            if (isText (_turretConfig >> "soundAttenuationTurret")) then {
                _effectType = getText (_turretConfig >> "soundAttenuationTurret");
            };
        };
    };
    _newAttenuation = switch (true) do {
        default {1};
    };
};

TRACE_2("New vehicle attenuation",_vehicle,_newAttenuation);

GVAR(playerVehAttenuation) = _newAttenuation;

