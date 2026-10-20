#include "script_component.hpp"

#include "XEH_PREP.hpp"

private _waterSourceData = createHashMapFromArray [
    ["misc_wellpump.p3d", [0, 0, 0]] // [11899, 9150, 0] on Chernarus
];

// Fill water source arrays from CfgVehicles
{
    private _split = (getText (_x >> "model")) splitString "\";
    private _string = toLowerANSI (_split param [((count _split) - 1), ""]);

    // Append extension if necessary
    if ((_string select [count _string - 4]) != ".p3d") then {
        _string = _string + ".p3d"
    };

    if !(_string in _waterSourceData) then {
        _waterSourceData set [_string, [_x >> QXGVAR(offset), "ARRAY", [0, 0, 0]] call CBA_fnc_getConfigEntry];
    };
} forEach (QUOTE(isNumber (_x >> 'XGVAR(waterSupply)') && {(getNumber (_x >> 'XGVAR(waterSupply)')) != REFILL_WATER_DISABLED}) configClasses (configFile >> "CfgVehicles"));

uiNamespace setVariable [QGVAR(cacheP3Ds), compileFinal _waterSourceData];
TRACE_1("compiled",count _waterSourceData);

call FUNC(scanFieldRations);
