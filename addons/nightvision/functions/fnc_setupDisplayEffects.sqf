#include "..\script_component.hpp"
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

params ["_activated"];
TRACE_1("setupDisplayEffects",_activated);

private _unit = ACE_player;

if (currentVisionMode _unit > 1) then {
    QGVAR(display) cutText ["", "PLAIN"]; // Cleanup Old Display
    if (_activated) then { // Create New Display
        QGVAR(display) cutRsc [QGVAR(title), "PLAIN", 0, false, false]; // draw under HUD
    };
    _activated = false;
};

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
            if (currentVisionMode _unit > 1) exitWith {}; // Don't error if switching directly to thermal
            ERROR("no fog backed up");
        };

        // Handle non-dedicated:
        if (isServer && hasInterface) then {
            missionNamespace setVariable [QGVAR(serverPriorFog), nil, true];
        };
    };
};

QGVAR(display) cutText ["", "PLAIN"]; // Cleanup Old Display
if (_activated) then { // Create New Display
    QGVAR(display) cutRsc [QGVAR(title), "PLAIN", 0, false, false]; // draw under HUD
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
