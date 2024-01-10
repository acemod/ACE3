#include "script_component.hpp"
/*
 * Author: Lambda.Tiger
 * This function returns a classification of material type based 
 * on the surface hit.
 * 
 * Arguments:
 * 0: surfacetype <STRING> - either a cfgSurfaces path .bisurf filepath 
 * 
 * Return Value:
 * _material <STRING> - Material categories as expanded on in line 43 below
 *
 * Example:
 * [_surfaceType] call ace_frag_fnc_getFragInfo;
 *
 * Public: No
 */

params ["_surfType"];

private _material = GVAR(materialSpallCache) get _surfType;

TRACE_2("materialCache",_surfType,_material);
if !(isNil "_material") exitWith {
    _material
};

if (isClass (configFile >> "CfgSurfaces" >> _surfType)) then {
    _material = getText (configFile >> "CfgSurfaces" >> _surfType >> "soundEnviron");
} else { // Messy way when a surface isn't added to cfgSurfaces
    private _surfFileText = loadFile _surfType;
    _surfFileText = (tolower _surfFileText) splitString " "";="+ endl;
    private _idx = _surfFileText find "soundenviron";
    _material = _surfFileText#(_idx+1);
    if (_material isEqualTo "empty") then {
        _idx = _surfFileText find "soundhit";
        _material = _surfFileText#(_idx+1);
    };
};
TRACE_1("soundFound",_material);


_material = switch (true) do {
    case ("dirt" in _material);
    case ("grass" in _material): { "ground" };
    case ("gravel" in _material);
    case ("rock" in _material): { "rock" };
    case ("wood" in _material): { "wood" };
    case ("lino" in _material);
	case ("building" isEqualTo _material);
    case ("concrete" in _material): { "concrete" };
    case ("metal" in _material): { "metal" };
    default { "ground" };
};

GVAR(materialSpallCache) set [_surfType, _material];
TRACE_2("materialCacheSet",_surfType,_material);

_material