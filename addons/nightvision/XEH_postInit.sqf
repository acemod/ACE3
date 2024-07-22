#include "script_component.hpp"

if (!hasInterface) exitWith {};

GVAR(PFID) = -1;
GVAR(running) = false;
GVAR(nextEffectsUpdate) = -1;

GVAR(playerHMD) = "#";

GVAR(priorFog) = nil;
GVAR(nvgFog) = [0,0,0];

GVAR(nvgBlurRadius) = -1;
GVAR(nvgGeneration) = -1;
GVAR(defaultPositionBorder) = [];
GVAR(defaultPositionHex) = [];

GVAR(ppeffectGrain) = -1;
GVAR(ppeffectRadialBlur) = -1;
GVAR(ppeffectColorCorrect) = -1;
GVAR(ppeffectBlur) = -1;

GVAR(isUsingMagnification) = false;

["CBA_settingsInitialized", {
    TRACE_4("settingsInitialized",GVAR(disableNVGsWithSights),GVAR(fogScaling),GVAR(noiseScaling),GVAR(effectScaling));

    ["visionMode", LINKFUNC(onVisionModeChanged), false] call CBA_fnc_addPlayerEventHandler;
    ["loadout", LINKFUNC(onLoadoutChanged), true] call CBA_fnc_addPlayerEventHandler;
    ["cameraView", LINKFUNC(onCameraViewChanged), true] call CBA_fnc_addPlayerEventHandler;
    ["vehicle", LINKFUNC(refreshGoggleType), false] call CBA_fnc_addPlayerEventHandler;
    ["turret", LINKFUNC(refreshGoggleType), true] call CBA_fnc_addPlayerEventHandler;
    ["ACE_controlledUAV", LINKFUNC(refreshGoggleType)] call CBA_fnc_addEventHandler;

    // handle only brightness if effects are disabled
    GVAR(ppEffectNVGBrightness) = ppEffectCreate ["ColorCorrections", 1236];
    GVAR(ppEffectNVGBrightness) ppEffectForceInNVG true;
    GVAR(ppEffectNVGBrightness) ppEffectAdjust [1, (-3+3)/5 + 1, 0, [0, 0, 0, 0], [0, 0, 0, 1], [0, 0, 0, 1]];
    GVAR(ppEffectNVGBrightness) ppEffectCommit 0;
    GVAR(ppEffectNVGBrightness) ppEffectEnable (GVAR(effectScaling) == 0);

    addMissionEventHandler ["Loaded", { // Restart UI vars on mission load
        if (GVAR(running)) then {
            TRACE_1("restarting effects",CBA_missionTime);
            [false] call FUNC(setupDisplayEffects);
            [true] call FUNC(setupDisplayEffects);
        };
    }];
}] call CBA_fnc_addEventHandler;


// Handle an edge case for non-dedicated servers were the server running the fog effect would sync fog to other clients
[QGVAR(nonDedicatedFix), LINKFUNC(nonDedicatedFix)] call CBA_fnc_addEventHandler;
if (!isNil QGVAR(serverPriorFog)) then {[] call FUNC(nonDedicatedFix);}; // If var is defined, run it now (we must be a jip)


// Add keybinds
["ACE3 Equipment", QGVAR(IncreaseNVGBrightness), localize LSTRING(IncreaseNVGBrightness), {
    // Conditions: canInteract
    if !([ACE_player, objNull, ["isNotEscorting", "isNotInside", "isNotSitting", "isNotRefueling"]] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    if ((currentVisionMode ACE_player != 1)) exitWith {false};
    if !(missionNamespace getVariable [QGVAR(allowBrightnessControl), true]) exitWith {false}; // just a mission setVar (not ace_setting)

    // Statement
    [ACE_player, 1] call FUNC(changeNVGBrightness);
    true
}, {false}, [201, [false, false, true]], false] call CBA_fnc_addKeybind; //PageUp + ALT

["ACE3 Equipment", QGVAR(DecreaseNVGBrightness), localize LSTRING(DecreaseNVGBrightness), {
    // Conditions: canInteract
    if !([ACE_player, objNull, ["isNotEscorting", "isNotInside", "isNotSitting", "isNotRefueling"]] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    if ((currentVisionMode ACE_player != 1)) exitWith {false};
    if !(missionNamespace getVariable [QGVAR(allowBrightnessControl), true]) exitWith {false}; // just a mission setVar (not ace_setting)

    // Statement
    [ACE_player, -1] call FUNC(changeNVGBrightness);
    true
}, {false}, [209, [false, false, true]], false] call CBA_fnc_addKeybind; //PageDown + ALT

#ifdef DEBUG_MODE_FULL
WARNING("Debug mouse wheel action enabled, this should NOT be in a final release");
["MouseZChanged", {
    GVAR(nextEffectsUpdate) = 0;
    if (cba_events_shift) then {
        GVAR(effectScaling) = ((GVAR(effectScaling) + ((_this select 1) / 20)) max 0) min 1;
        systemChat format ["%1: %2", QGVAR(effectScaling), GVAR(effectScaling)];
    };
    if (cba_events_control) then {
        GVAR(fogScaling) = ((GVAR(fogScaling) + ((_this select 1) / 20)) max 0) min 1;
        systemChat format ["%1: %2", QGVAR(fogScaling), GVAR(fogScaling)];
    };
}] call CBA_fnc_addDisplayHandler;
#endif

