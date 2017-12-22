/*
 * Author: Dslyecxi, PabstMirror
 * Handles setting up the effects: fog, ppEffects and the RscTittle.
 *
 * Arguments:
 * 0: Activated <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [true] call ace_nightvision_fnc_setupDisplayEffects
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_activated"];
TRACE_1("setupDisplayEffects",_activated);

// Backup and restore changes to fog:
if (GVAR(fogScaling) > 0) then {
    if (_activated) then {
        if (isNil QGVAR(priorFog)) then {
            TRACE_1("Backing up fog",fogParams);
            GVAR(priorFog) = fogParams;
        } else {
            ERROR("fog already backed up");
        };

        // Handle non-dedicated:
        if (isServer && hasInterface) then {
            missionNamespace setVariable [QGVAR(serverPriorFog), fogParams, true];
            [QGVAR(nonDedicatedFix), []] call CBA_fnc_remoteEvent;
        };
    } else {
        if (!isNil QGVAR(priorFog)) then {
            0 setFog GVAR(priorFog);
            GVAR(priorFog) = nil;
        } else {
            ERROR("no fog backed up");
        };

        // Handle non-dedicated:
        if (isServer && hasInterface) then {
            missionNamespace setVariable [QGVAR(serverPriorFog), nil, true];
        };
    };
};

// Note: Using BIS_fnc_rscLayer because of bug with string syntax - https://feedback.bistudio.com/T120768
(QGVAR(display) call BIS_fnc_rscLayer) cutText ["", "PLAIN"]; // Cleanup Old Display
if (_activated) then { // Create New Display
    (QGVAR(display) call BIS_fnc_rscLayer) cutRsc [QGVAR(title), "PLAIN", 0, false];
};

// Cleanup Old PP Effects
if (GVAR(ppeffectGrain) != -1) then {
    ppEffectDestroy GVAR(ppeffectGrain);
    GVAR(ppeffectGrain) = -1;
};
if (GVAR(ppeffectBlur) != -1) then {
    ppEffectDestroy GVAR(ppeffectBlur);
    GVAR(ppeffectBlur) = -1;
};
if (GVAR(ppeffectRadialBlur) != -1) then {
    ppEffectDestroy GVAR(ppeffectRadialBlur);
    GVAR(ppeffectRadialBlur) = -1;
};
if (GVAR(ppeffectColorCorrect) != -1) then {
    ppEffectDestroy GVAR(ppeffectColorCorrect);
    GVAR(ppeffectColorCorrect) = -1;
};
if (GVAR(ppEffectCCMuzzleFlash) != -1) then {
    ppEffectDestroy GVAR(ppEffectCCMuzzleFlash);
    GVAR(ppEffectCCMuzzleFlash) = -1;
};
