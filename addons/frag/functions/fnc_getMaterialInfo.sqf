#include "..\script_component.hpp"
/*
 * Author: Lambda.Tiger
 * This function returns a classification of material type based on the surface hit.
 *
 * Arguments:
 * 0: Surface type given as either a CfgSurfaces path or .bisurf filepath, same format as "HitPart" projectile parameter <STRING>
 *
 * Return Value:
 * Material categories as expanded on in line 44 below <STRING>
 *
 * Example:
 * "a3\data_f\penetration\concrete.bisurf" call ace_frag_fnc_getMaterialInfo
 *
 * Public: No
 */

#define ACE_FRAG_SOUNDENVIRON_STR_LEN 12
#define ACE_FRAG_SOUNDHIT_STR_LEN 8
#define ACE_FRAG_MATERIAL_SEARCH_LEN 10

params ["_surfType"];

private _material = GVAR(spallMaterialCache) get _surfType;

TRACE_2("materialCache",_surfType,_material);
if (!isNil "_material") exitWith {_material};
// Use 'soundEnviron' or 'soundHit' to extract approx material
private _surfaceConfig = configFile >> "CfgSurfaces" >> _surfType;
if (isClass _surfaceConfig) then {
    _material = getText (_surfaceConfig >> "soundEnviron");
    if (_material == "" || {_material == "empty"}) then {
        _material = getText (_surfaceConfig >> "soundhit");
    };
} else { // Messy way when a surface isn't added to CfgSurfaces
    private _surfFileText = toLowerANSI preprocessFile _surfType;
    _surfFileText = _surfFileText regexReplace ["[^a-z0-9]", ""];
    private _idx = ACE_FRAG_SOUNDENVIRON_STR_LEN + (_surfFileText find "soundenviron");
    if (_surfFileText select [_idx, 5] isEqualTo "empty") then {
        _idx = ACE_FRAG_SOUNDHIT_STR_LEN + (_surfFileText find "soundhit");
    };
    _material = _surfFileText select [_idx, ACE_FRAG_MATERIAL_SEARCH_LEN];
};
TRACE_1("materialSubString",_material);

_material = switch (true) do {
    case ("dirt" in _material);
    case ("grass" in _material): { "ground" };
    case ("gravel" in _material);
    case ("rock" in _material): { "rock" };
    case ("wood" in _material): { "wood" };
    case ("lino" in _material);
    case ("building" in _material);
    case ("concrete" in _material): { "concrete" };
    case ("metal" in _material): { "metal" };
    default { "ground" };
};

GVAR(spallMaterialCache) set [_surfType, _material];
TRACE_2("materialCacheSet",_surfType,_material);

_material
