/*
 * Author: commy2 and esteldunedain and Ruthberg
 * Updates and applys the current deafness.  Called every 1 sec from a PFEH.
 *
 * Arguments:
 * 0: Args <ARRAY>
 * -----0: Just update volume (skip ringing/recovery) <BOOL><OPTIONAL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_hearing_fnc_updateVolume
 *
 * Public: No
 */
#include "script_component.hpp"

if (!alive ACE_player) exitWith {
    if (missionNameSpace getVariable [QGVAR(disableVolumeUpdate), false]) exitWith {};
    TRACE_1("dead - removing hearing effects",ACE_player);
    [QUOTE(ADDON), 1, true] call EFUNC(common,setHearingCapability);
};

(_this select 0) params ["_justUpdateVolume"];

GVAR(deafnessDV) = (GVAR(deafnessDV) min 20) max 0;
GVAR(volume) = (1 -  (GVAR(deafnessDV) / 20)) max 0.05;
TRACE_3("",GVAR(volume),GVAR(deafnessDV),GVAR(deafnessDV) - GVAR(deafnessPrior));

if (!_justUpdateVolume) then {
    // Ring if we got a big increase in the last second or enough accumulated damage
    if (GVAR(deafnessDV) - GVAR(deafnessPrior) > 1 ||
        GVAR(deafnessDV) > 10) then {

        if (CBA_missionTime - GVAR(time3) < 3) exitWith {};
        GVAR(time3) = CBA_missionTime;

        if (GVAR(deafnessDV) > 19.75) then {
            playSound (["ACE_Combat_Deafness_Heavy", "ACE_Combat_Deafness_Heavy_NoRing"] select GVAR(DisableEarRinging));
        } else {
            playSound (["ACE_Combat_Deafness_Medium", "ACE_Combat_Deafness_Medium_NoRing"] select GVAR(DisableEarRinging));
        };
    };
    GVAR(deafnessPrior) = GVAR(deafnessDV);

    // Hearing takes longer to return to normal after it hits rock bottom
    GVAR(deafnessDV) =  (GVAR(deafnessDV) - (0.5 * (GVAR(volume) max 0.1))) max 0;
};

if (missionNameSpace getVariable [QGVAR(disableVolumeUpdate), false]) exitWith {};

private _volume = GVAR(volume);

// Earplugs and headgear can attenuate hearing
_volume = _volume min GVAR(volumeAttenuation);

// Reduce volume if player is unconscious
if (ACE_player getVariable ["ACE_isUnconscious", false]) then {
    _volume = _volume min GVAR(UnconsciousnessVolume);
};

[QUOTE(ADDON), _volume, true] call EFUNC(common,setHearingCapability);
