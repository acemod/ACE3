#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Updates the hearing protection and volume attenuation for player on earbuds/helmet change
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_hearing_fnc_updateHearingProtection
 *
 * Public: No
 */

TRACE_1("params",_this);

if (isNull ACE_player) exitWith {
    GVAR(damageCoefficent) = 0;
    GVAR(volumeAttenuation) = 1;
};

// Handle Earplugs
private _hasEarPlugsIn = [ACE_player] call FUNC(hasEarPlugsIn);
GVAR(damageCoefficent) = [1, 0.25] select _hasEarPlugsIn;
GVAR(volumeAttenuation) = [1, GVAR(EarplugsVolume)] select _hasEarPlugsIn;

// Handle Headgear
if (headgear ACE_player != "") then {
    private _protection = getNumber (configFile >> "CfgWeapons" >> headgear ACE_player >> QGVAR(protection)) min 1;
    GVAR(damageCoefficent) = GVAR(damageCoefficent) * (1 - _protection);
    private _attenuation = getNumber (configFile >> "CfgWeapons" >> headgear ACE_player >> QGVAR(lowerVolume)) min 1;
    GVAR(volumeAttenuation) = GVAR(volumeAttenuation) * (1 - _attenuation);
};

// Handle Goggles
if (goggles ACE_player != "") then {
    private _protection = getNumber (configFile >> "CfgGlasses" >> goggles ACE_player >> QGVAR(protection)) min 1;
    GVAR(damageCoefficent) = GVAR(damageCoefficent) * (1 - _protection);
    private _attenuation = getNumber (configFile >> "CfgGlasses" >> goggles ACE_player >> QGVAR(lowerVolume)) min 1;
    GVAR(volumeAttenuation) = GVAR(volumeAttenuation) * (1 - _attenuation);
};
