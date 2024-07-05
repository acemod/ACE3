#include "..\script_component.hpp"

// PabstMirror
// ["cfgPatches"] call ace_common_fnc_runTests;

diag_log text format ["--- Checking CfgPatches --- "];

private _testPass = true;

// All ace cfgPatches
private _allPatches = "(configName _x) select [0,3] == 'ace'" configClasses (configFile >> "CfgPatches");

// Get all units[]
private _allUnits = [];
{
    _allUnits append ((getArray (_x >> "units")) apply { toLowerANSI _x });
} forEach _allPatches;
{
    private _class = configFile >> "CfgVehicles" >> _x;
    if (isNull _class) then {
        WARNING_1("in units[] but null - %1",_x);
        _testPass = false;
    } else {
        // if (((getNumber (_class >> "scope")) != 2) && {((getNumber (_class >> "scopeCurator")) != 2)}) then {
        //     WARNING_2("in units[] but not public - %1 from %2",configName _class,configSourceMod _class);
        //     _testPass = false;
        // };
    };
} forEach _allUnits;

// Get all weapons[]
private _allWeapons = [];
{
    _allWeapons append ((getArray (_x >> "weapons")) apply { toLowerANSI _x });
} forEach _allPatches;
{
    private _class = configFile >> "CfgWeapons" >> _x;
    if (isNull _class) then {
        WARNING_1("in weapons[] but null - %1",_x);
        _testPass = false;
    } else {
        // if (((getNumber (_class >> "scope")) != 2) && {((getNumber (_class >> "scopeCurator")) != 2)}) then {
        //     WARNING_2("in weapons[] but not public - %1 from %2",configName _class,configSourceMod _class);
        //     _testPass = false;
        // };
    };
} forEach _allWeapons;

// Check if all public vics are defined in a cfgPatch
private _vics = "(configName _x) select [0,3] == 'ace'" configClasses (configFile >> "CfgVehicles");
{
    if (((getNumber (_x >> "scope")) == 2) || {((getNumber (_x >> "scopeCurator")) == 2)}) then {
        if !((toLowerANSI configName _x) in _allUnits) then {
            WARNING_2("Not in any units[] - %1 from %2",configName _x,configSourceMod _x);
            _testPass = false;
        };
    };
} forEach _vics;

// Check if all public weapons are defined in a cfgPatch
private _weapons = "(configName _x) select [0,3] == 'ace'" configClasses (configFile >> "CfgWeapons");
{
    private _type = toLowerANSI configName _x;
    if (((getNumber (_x >> "scope")) == 2) || {((getNumber (_x >> "scopeCurator")) == 2)}) then {
        if !((toLowerANSI configName _x) in _allWeapons) then {
            WARNING_2("Not in any weapons[] - %1 from %2",configName _x,configSourceMod _x);
            _testPass = false;
        };
    };
} forEach _weapons;

_testPass
