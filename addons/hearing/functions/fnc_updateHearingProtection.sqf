#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Updates the hearing protection and volume attenuation for player on earbuds/helmet change.
 *
 * Arguments:
 * 0: Slot <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * UPDATE_HEARING call ace_hearing_fnc_updateHearingProtection
 *
 * Public: No
 */

LOG("updateHearingProtection");

if (isNull ACE_player) exitWith {
    GVAR(damageCoefficent) = 0;
    GVAR(volumeAttenuation) = 1;
};

params ["_slot"];
TRACE_1("",_slot);

if !(_slot in [UPDATE_HEARING, TYPE_GOGGLE, TYPE_HEADGEAR]) exitWith {};

// Handle ACE items
private _hasEarPlugsIn = ACE_player getVariable ["ACE_hasEarPlugsIn", false];
GVAR(damageCoefficent) = [1, 0.25] select _hasEarPlugsIn;
GVAR(volumeAttenuation) = [1, GVAR(earplugsVolume)] select _hasEarPlugsIn;

private _hasEHPOn = ACE_player getVariable ["ACE_hasEHP", false];
private _hasBuiltInEHP = false;

// Handle Headgear
private _headgear = headgear ACE_player;

if (_headgear != "") then {
    private _heargearConfig = configFile >> "CfgWeapons" >> _headgear;

    private _protection = getNumber (_heargearConfig >> QGVAR(protection)) min 1;
    GVAR(damageCoefficent) = GVAR(damageCoefficent) * (1 - _protection);

    private _attenuation = getNumber (_heargearConfig >> QGVAR(lowerVolume)) min 1;
    GVAR(volumeAttenuation) = GVAR(volumeAttenuation) * (1 - _attenuation);

    _hasBuiltInEHP = _hasBuiltInEHP || { getNumber (_heargearConfig >> QGVAR(hasEHP)) > 0 };
};

// Handle Goggles
private _goggles = goggles ACE_player;

if (_goggles != "") then {
    private _gogglesConfig = configFile >> "CfgGlasses" >> _goggles;

    private _protection = getNumber (_gogglesConfig >> QGVAR(protection)) min 1;
    GVAR(damageCoefficent) = GVAR(damageCoefficent) * (1 - _protection);

    private _attenuation = getNumber (_gogglesConfig >> QGVAR(lowerVolume)) min 1;
    GVAR(volumeAttenuation) = GVAR(volumeAttenuation) * (1 - _attenuation);

    _hasBuiltInEHP = _hasBuiltInEHP || { getNumber (_gogglesConfig >> QGVAR(hasEHP)) > 0 };
};

// Unequip electronic hearing protection when gear has one built in
if (_hasEHPOn && _hasBuiltInEHP) then {
    [ACE_player, false] call FUNC(removeEHP);
};

// Handle electronic hearing protection - effect can only be applied once
if (_hasEHPOn || _hasBuiltInEHP) then {
    GVAR(damageCoefficent) = GVAR(damageCoefficent) * 0.25;
};

ACE_player setVariable ["ACE_hasBuiltInEHP", _hasBuiltInEHP];
