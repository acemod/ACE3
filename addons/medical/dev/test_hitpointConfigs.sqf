// PabstMirror, commy2
// ["medicalHitpoints"] call ace_common_fnc_runTests;
// call compile preprocessFileLineNumbers "\z\ace\addons\medical\dev\test_hitpointConfigs.sqf"

#include "..\script_component.hpp"

// UAV-AI should get filtered by scope check

private _cfgWeapons = configFile >> "CfgWeapons";
private _cfgVehicles = configFile >> "CfgVehicles";

private _uniforms = "getNumber (_x >> 'scope') == 2 && {configName _x isKindOf ['Uniform_Base', _cfgWeapons]}" configClasses _cfgWeapons;
private _units = _uniforms apply {
    private _unitCfg = _cfgVehicles >> getText (_x >> "ItemInfo" >> "uniformClass");
    if (isNull _unitCfg) then { WARNING_2("%1 has invalid uniformClass %2",configName _x,getText (_x >> "ItemInfo" >> "uniformClass")) };
    _unitCfg
};
if (param [0, false]) then { // Check all units (if naked)
    INFO("checking ALL units");
   _units append ("(getNumber (_x >> 'scope')) == 2 && {configName _x isKindOf 'CAManBase'}" configClasses _cfgVehicles);
};

INFO_1("Checking uniforms for correct medical hitpoints [%1 units]",count _units);

private _testPass = true;
{
    private _typeOf = configName _x;
    if (_typeOf == "") then { continue };
    private _hitpoints = (configProperties [_x >> "HitPoints", "isClass _x", true]) apply {toLowerANSI configName _x};
    private _expectedHitPoints = ["hitleftarm","hitrightarm","hitleftleg","hitrightleg","hithead","hitbody"];
    private _missingHitPoints = _expectedHitPoints select {!(_x in _hitpoints)};
    if (_missingHitPoints isNotEqualTo []) then {
        WARNING_3("%1 missing ace hitpoints: %2 - class hitpoints: %3",_typeOf,_missingHitPoints,_hitpoints);
        _testPass = false;
    };

    // _typeOf createUnit [position player, group player, "z = this"];
    // deleteVehicle z;
} forEach _units;

_testPass
