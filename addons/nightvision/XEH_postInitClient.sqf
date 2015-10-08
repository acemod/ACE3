// by commy2
#include "script_component.hpp"

if (!hasInterface) exitWith {};

GVAR(ppEffectBlur) = ppEffectCreate ["dynamicBlur", 1234];
GVAR(ppEffectBlur) ppEffectForceInNVG true;
GVAR(ppEffectBlur) ppEffectAdjust [0];
GVAR(ppEffectBlur) ppEffectCommit 0;

GVAR(ppEffectRadialBlur) = ppEffectCreate ["radialBlur", 1238];
GVAR(ppEffectRadialBlur) ppEffectForceInNVG true;
GVAR(ppEffectRadialBlur) ppEffectAdjust [0, 0, 0, 0];
GVAR(ppEffectRadialBlur) ppEffectCommit 0;

GVAR(ppEffectFilmGrain) = ppEffectCreate ["FilmGrain", 1235];
GVAR(ppEffectFilmGrain) ppEffectAdjust [0.25, 2.5, 2.5, 2.5*0.3, 2.5*0.3, false];
GVAR(ppEffectFilmGrain) ppEffectCommit 0;

GVAR(ppEffectNVGBrightness) = ppEffectCreate ["ColorCorrections", 1236];
GVAR(ppEffectNVGBrightness) ppEffectForceInNVG true;
GVAR(ppEffectNVGBrightness) ppEffectAdjust [1, 1, 0, [0, 0, 0, 0], [0, 0, 0, 1], [0, 0, 0, 1]];
GVAR(ppEffectNVGBrightness) ppEffectCommit 0;

GVAR(ppEffectMuzzleFlash) = ppEffectCreate ["ColorCorrections", 1237];
GVAR(ppEffectMuzzleFlash) ppEffectEnable true;
GVAR(ppEffectMuzzleFlash) ppEffectForceInNVG true;
GVAR(ppEffectMuzzleFlash) ppEffectAdjust [1, 1, 0, [0, 0, 0, 0], [0, 0, 0, 1], [0, 0, 0, 1]];
GVAR(ppEffectMuzzleFlash) ppEffectCommit 0;

// Setup the event handlers
["playerInventoryChanged",  {_this call FUNC(updatePPEffects)}] call EFUNC(common,addEventHandler);
["playerVisionModeChanged", {
    _this call FUNC(updatePPEffects);
    _this call FUNC(onVisionModeChanged);
}] call EFUNC(common,addEventHandler);
["zeusDisplayChanged",      {_this call FUNC(updatePPEffects)}] call EFUNC(common,addEventHandler);
["cameraViewChanged",       {
    _this call FUNC(updatePPEffects);
    _this call FUNC(onCameraViewChanged);
}] call EFUNC(common,addEventHandler);
["playerVehicleChanged",    {_this call FUNC(updatePPEffects)}] call EFUNC(common,addEventHandler);
["playerTurretChanged",     {_this call FUNC(updatePPEffects)}] call EFUNC(common,addEventHandler);

// Add keybinds
["ACE3 Equipment", QGVAR(IncreaseNVGBrightness), localize LSTRING(IncreaseNVGBrightness),
{
    // Conditions: canInteract
    if !([ACE_player, objNull, ["isNotEscorting", "isNotInside", "isNotSitting"]] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    if ((currentVisionMode ACE_player != 1)) exitWith {false};

    // Statement
    [ACE_player, 1] call FUNC(changeNVGBrightness);
    true
},
{false},
[201, [false, false, true]], false] call cba_fnc_addKeybind; //PageUp + ALT

["ACE3 Equipment", QGVAR(DecreaseNVGBrightness), localize LSTRING(DecreaseNVGBrightness),
{
    // Conditions: canInteract
    if !([ACE_player, objNull, ["isNotEscorting", "isNotInside", "isNotSitting"]] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    if ((currentVisionMode ACE_player != 1)) exitWith {false};

    // Statement
    [ACE_player, -1] call FUNC(changeNVGBrightness);
    true
},
{false},
[209, [false, false, true]], false] call cba_fnc_addKeybind; //PageDown + ALT

GVAR(reenableNVGs) = false;
