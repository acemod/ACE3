#include "script_component.hpp"
/*
 * Author: Lambda.Tiger
 * This function returns fragmentation parameters for a specific
 * ammo type.
 * 
 * Arguments:
 * 0: _ammo <STRING> - cfgAmmo type of ammo to check
 * 
 * Return Value:
 * _ammoInfo <ARRAY>
 * 	0: _fragRange - search range for fragments
 * 	1: _fragVel - gurney equation calculated velocity
 * 	2: _fragTypes - array of fragment types
 * 	3: _fragCount - modified frag count used under assumptions 
 *									 of spherical fragmentation
 *
 * Example:
 * ["B_556x45_Ball"] call ace_frag_fnc_getFragInfo;
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
    _surfFileText = (tolower _surfFileText) splitString " ;="+ endl;
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