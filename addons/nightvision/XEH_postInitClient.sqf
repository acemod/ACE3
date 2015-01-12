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

0 spawn COMPILE_FILE(nightVision); //ToDo
