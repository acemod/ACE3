/*
 * Author: commy2 and esteldunedain and Ruthberg
 * Updates and applys the current deafness.  Called every 0.1 sec from a PFEH.
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

//Only run if deafness or ear ringing is enabled:
if ((!GVAR(enableCombatDeafness)) && GVAR(DisableEarRinging)) exitWith {};

EXPLODE_1_PVT((_this select 0),_justUpdateVolume);

private["_volume", "_soundTransitionTime"];

GVAR(deafnessDV) = (GVAR(deafnessDV) min 20) max 0;
GVAR(volume) = (1 -  (GVAR(deafnessDV) / 20)) max 0;

if (!_justUpdateVolume) then {
    //If we got a big increase in the last second:
    if ((GVAR(deafnessDV) - GVAR(deafnessPrior)) > 2) then {
        if (ACE_time > GVAR(time3)) then {
            GVAR(beep2) = false;
        };
        if ((!GVAR(DisableEarRinging)) && {!GVAR(beep2)}) then {
            playSound "ACE_Combat_Deafness";
            GVAR(beep2) = true;
            GVAR(time3) = ACE_time + 5;
        };
    };

    GVAR(deafnessPrior) = GVAR(deafnessDV);

    if (GVAR(deafnessDV) > 19.75) then {
        ACE_player setvariable [QGVAR(deaf), true];
        if ((!GVAR(DisableEarRinging)) && {ACE_time > GVAR(time4)}) then {
            playSound "ACE_Combat_Deafness";
            GVAR(beep2) = true;
            GVAR(time3) = ACE_time + 10;
            GVAR(time4) = ACE_time + 30;
        };
    } else {
        ACE_player setvariable [QGVAR(deaf), false];
    };

    if (GVAR(deafnessDV) > 10) then {
        //check if the ringing is already being played
        if (ACE_time > GVAR(time2)) then {
            GVAR(beep) = false;
        };
        if ((!GVAR(DisableEarRinging)) && {!GVAR(beep)}) then {
            playSound "ACE_Ring_Backblast";
            GVAR(time2) = ACE_time + 22;
            GVAR(beep) = true;
        };
    };

    // Hearing takes longer to return to normal after it hits rock bottom
    GVAR(deafnessDV) =  (GVAR(deafnessDV) - (0.5 * (GVAR(volume) max 0.1))) max 0;
};

if ((missionNameSpace getVariable [QGVAR(disableVolumeUpdate), false]) || {!GVAR(enableCombatDeafness)}) exitWith {};

_volume = GVAR(volume);

// Earplugs reduce hearing 50%
if ([ACE_player] call FUNC(hasEarPlugsIn)) then {
    _volume = _volume min GVAR(EarplugsVolume);
};

// Headgear can reduce hearing
if(headgear ACE_player != "") then {
    private ["_lowerVolume"];
    _lowerVolume = (getNumber (configFile >> "CfgWeapons" >> (headgear ACE_player) >> QGVAR(lowerVolume))) min 1;
    if(_lowerVolume > 0) then {
        _volume = _volume min (1 - _lowerVolume);
    };
};

// Reduce volume if player is unconscious
if (ACE_player getVariable ["ACE_isUnconscious", false]) then {
    _volume = _volume min GVAR(UnconsciousnessVolume);
};

_soundTransitionTime = if (_justUpdateVolume) then {0.1} else {1};

_soundTransitionTime fadeSound _volume;
_soundTransitionTime fadeSpeech _volume;
ACE_player setVariable ["tf_globalVolume", _volume];
if (!isNil "acre_api_fnc_setGlobalVolume") then {[_volume^(0.33)] call acre_api_fnc_setGlobalVolume;};
