#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Updates the hearing protection and volume attenuation for player on earbuds/helmet change.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_hearing_fnc_updateHearingProtection
 *
 * Public: No
 */

LOG("updateHearingProtection");

if (isNull ACE_player) exitWith {
    GVAR(damageCoefficent) = 0;
    GVAR(volumeAttenuation) = 1;
};

// Handle Earplugs
private _hasEarPlugsIn = ACE_player call FUNC(hasEarPlugsIn);
GVAR(damageCoefficent) = [1, 0.25] select _hasEarPlugsIn;
GVAR(volumeAttenuation) = [1, GVAR(earplugsVolume)] select _hasEarPlugsIn;

// Handle Headgear
private _headgear = headgear ACE_player;

if (_headgear != "") then {
    private _heargearConfig = configFile >> "CfgWeapons" >> _headgear;

    private _protection = getNumber (_heargearConfig >> QGVAR(protection)) min 1;
    GVAR(damageCoefficent) = GVAR(damageCoefficent) * (1 - _protection);

    private _attenuation = getNumber (_heargearConfig >> QGVAR(lowerVolume)) min 1;
    GVAR(volumeAttenuation) = GVAR(volumeAttenuation) * (1 - _attenuation);
};

// Handle Goggles
private _goggles = goggles ACE_player;

if (_goggles != "") then {
    private _gogglesConfig = configFile >> "CfgGlasses" >> _goggles;

    private _protection = getNumber (_gogglesConfig >> QGVAR(protection)) min 1;
    GVAR(damageCoefficent) = GVAR(damageCoefficent) * (1 - _protection);

    private _attenuation = getNumber (_gogglesConfig >> QGVAR(lowerVolume)) min 1;
    GVAR(volumeAttenuation) = GVAR(volumeAttenuation) * (1 - _attenuation);
};
