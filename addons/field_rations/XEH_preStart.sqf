#include "script_component.hpp"

#include "XEH_PREP.hpp"

// List of p3d water sources (case sensitive) for objects that report `typeOf == ""`
private _waterSourceP3Ds = [
    "misc_wellpump.p3d" // [11899, 9150, 0] on chenarus
];

// List of refill action offsets corresponding to the p3ds in the array above
private _waterSourceOffsets = [
    [0, 0, 0]
];

// Fill water source arrays from CfgVehicles
{
    private _split = (getText (_x >> "model")) splitString "\";
    private _string = toLower (_split param [((count _split) - 1), ""]);

    // Append extension if necessary
    if ((_string select [count _string - 4]) != ".p3d") then {
        _string = _string + ".p3d"
    };

    private _index = _waterSourceP3Ds pushBackUnique _string;
    if (_index != -1) then {
        _waterSourceOffsets pushBack ([_x >> QXGVAR(offset), "ARRAY", [0, 0, 0]] call CBA_fnc_getConfigEntry);
    };
} forEach (QUOTE(isNumber (_x >> 'XGVAR(waterSupply)') && {(getNumber (_x >> 'XGVAR(waterSupply)')) != REFILL_WATER_DISABLED}) configClasses (configFile >> "CfgVehicles"));

uiNamespace setVariable [QGVAR(cacheP3Ds), compileFinal str [_waterSourceP3Ds, _waterSourceOffsets]];
TRACE_1("compiled",count _waterSourceP3Ds);
