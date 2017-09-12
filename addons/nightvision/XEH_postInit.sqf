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
GVAR(ppEffectCCMuzzleFlash) = -1;


["ace_settingsInitialized", {
    TRACE_2("settingsInitialized",GVAR(disableNVGsWithSights),GVAR(fogEffectScale));

    ["loadout", LINKFUNC(onLoadoutChanged), true] call CBA_fnc_addPlayerEventHandler;
    ["visionMode", LINKFUNC(onVisionModeChanged), false] call CBA_fnc_addPlayerEventHandler;
    ["cameraView", LINKFUNC(onCameraViewChanged), true] call CBA_fnc_addPlayerEventHandler;
    ["vehicle", LINKFUNC(refreshGoggleType), false] call CBA_fnc_addPlayerEventHandler;
    ["turret", LINKFUNC(refreshGoggleType), true] call CBA_fnc_addPlayerEventHandler;

    ["ace_firedPlayer", LINKFUNC(onFiredPlayer)] call CBA_fnc_addEventHandler;
    ["ace_firedPlayerVehicle", LINKFUNC(onFiredPlayer)] call CBA_fnc_addEventHandler;
}] call CBA_fnc_addEventHandler;


addMissionEventHandler ["Loaded", { // Restart UI vars on misison load
    if (GVAR(running)) then {
        TRACE_1("restarting effects",CBA_missionTime);
        [false] call FUNC(setupDisplayEffects);
        [true] call FUNC(setupDisplayEffects);
    };
}];


// Handle an edge case for non-dedicated servers were the server running the fog effect would sync fog to other clients
[QGVAR(nonDedicatedFix), LINKFUNC(nonDedicatedFix)] call CBA_fnc_addEventHandler;
if (!isNil QGVAR(serverPriorFog)) then {[] call FUNC(nonDedicatedFix);}; // If var is defined, run it now (we must be a jip)


// Add keybinds
["ACE3 Equipment", QGVAR(IncreaseNVGBrightness), localize LSTRING(IncreaseNVGBrightness), {
    // Conditions: canInteract
    if !([ACE_player, objNull, ["isNotEscorting", "isNotInside", "isNotSitting", "isNotRefueling"]] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    if ((currentVisionMode ACE_player != 1)) exitWith {false};

    // Statement
    [ACE_player, 1] call FUNC(changeNVGBrightness);
    true
}, {false}, [201, [false, false, true]], false] call CBA_fnc_addKeybind; //PageUp + ALT

["ACE3 Equipment", QGVAR(DecreaseNVGBrightness), localize LSTRING(DecreaseNVGBrightness), {
    // Conditions: canInteract
    if !([ACE_player, objNull, ["isNotEscorting", "isNotInside", "isNotSitting", "isNotRefueling"]] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    if ((currentVisionMode ACE_player != 1)) exitWith {false};

    // Statement
    [ACE_player, -1] call FUNC(changeNVGBrightness);
    true
}, {false}, [209, [false, false, true]], false] call CBA_fnc_addKeybind; //PageDown + ALT
