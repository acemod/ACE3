#include "../script_component.hpp"
/*
 * Author: OverlordZorn
 * Getter Function for the sound timing of the sound effect - checks for directional property, if not, get from target.
 *
 * Arguments:
 * 0: Current variant <CONFIG>
 * 1: Desired variant <CONFIG>
 *
 * Return Value:
 * Sound timing <NUMBER>
 *
 * Example:
 * [(configFile >> "CfgWeapons" >> "U_B_CTRG_3"), (configFile >> "CfgWeapons" >> "U_B_CTRG_1")] call ace_wardrobe_fnc_getDuration
 *
 * Public: No
 */

params ["_cfgOrigin", "_cfgTarget"];

private _classOrigin = configName _cfgOrigin;
private _classTarget = configName _cfgTarget;


private _return = switch (true) do {
    
    // check directional
    case (
        isNumber  (configFile >> QUOTE(ADDON) >> _classOrigin >> "modifiableTo" >> _classTarget >> "soundTiming")
    ): {
        getNumber (configFile >> QUOTE(ADDON) >> _classOrigin >> "modifiableTo" >> _classTarget >> "soundTiming")
    };

    // check legacy
    case (
        isNumber  (configFile >> QUOTE(ADDON) >> _classTarget >> "sound_timing")
    ): {
        getNumber (configFile >> QUOTE(ADDON) >> _classTarget >> "sound_timing")
    };

    default {
        getNumber (configFile >> QUOTE(ADDON) >> _classTarget >> "soundTiming")
    };
};

_return max 0 min 1
