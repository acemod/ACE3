#include "..\script_component.hpp"
/*
 * Author: commy2, esteldunedain, Ruthberg
 * Updates and applies the current deafness. Called every 1 sec from a PFEH.
 *
 * Arguments:
 * 0: Update volume only (skip ringing/recovery) <BOOL> (default: false)
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_hearing_fnc_updateVolume
 *
 * Public: No
 */

if (isGamePaused) exitWith {};

if (!alive ACE_player) exitWith {
    if (missionNamespace getVariable [QGVAR(disableVolumeUpdate), false]) exitWith {};

    TRACE_1("dead - removing hearing effects",ACE_player);

    [QUOTE(ADDON), 1, true] call EFUNC(common,setHearingCapability);
};

params [["_updateVolumeOnly", false]];

GVAR(deafnessDV) = (GVAR(deafnessDV) min 20) max 0;
GVAR(volume) = (1 -  (GVAR(deafnessDV) / 20)) max 0.05;

TRACE_3("",GVAR(volume),GVAR(deafnessDV),GVAR(deafnessDV) - GVAR(deafnessPrior));

if (!_updateVolumeOnly) then {
    // Ring if we got a big increase in the last second or enough accumulated damage
    if (GVAR(deafnessDV) - GVAR(deafnessPrior) > 1 ||
        GVAR(deafnessDV) > 10) then {

        if (CBA_missionTime - GVAR(time3) < 3) exitWith {};
        if (!isGameFocused) exitWith {}; // prevent audio from stacking when tabbed out

        GVAR(time3) = CBA_missionTime;

        if (GVAR(deafnessDV) > 19.75) then {
            playSound (["ACE_Combat_Deafness_Heavy", "ACE_Combat_Deafness_Heavy_NoRing"] select GVAR(disableEarRinging));
        } else {
            playSound (["ACE_Combat_Deafness_Medium", "ACE_Combat_Deafness_Medium_NoRing"] select GVAR(disableEarRinging));
        };
    };

    GVAR(deafnessPrior) = GVAR(deafnessDV);

    // Hearing takes longer to return to normal after it hits rock bottom
    GVAR(deafnessDV) = (GVAR(deafnessDV) - (0.5 * (GVAR(volume) max 0.1))) max 0;
};

if (missionNamespace getVariable [QGVAR(disableVolumeUpdate), false]) exitWith {};

private _volume = GVAR(volume);

// Earplugs and headgear can attenuate hearing
_volume = _volume min GVAR(volumeAttenuation);

// Reduce volume if player is unconscious
if (lifeState ACE_player == "INCAPACITATED") then {
    _volume = _volume min GVAR(unconsciousnessVolume);
};

[QUOTE(ADDON), _volume, true] call EFUNC(common,setHearingCapability);
