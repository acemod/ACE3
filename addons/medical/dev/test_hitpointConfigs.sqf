// PabstMirror, commy2
// ["medicalHitpoints"] call ace_common_fnc_runTests;
// call compile preprocessFileLineNumbers "\z\ace\addons\medical\dev\test_hitpointConfigs.sqf"

#include "\z\ace\addons\medical\script_component.hpp"

// UAV-AI should get filtered by scope check

private _cfgWeapons = configFile >> "CfgWeapons";
private _cfgVehicles = configFile >> "CfgVehicles";

private _uniforms = "getNumber (_x >> 'scope') == 2 && {configName _x isKindOf ['Uniform_Base', _cfgWeapons]}" configClasses _cfgWeapons;
private _units = _uniforms apply {_cfgVehicles >> getText (_x >> "ItemInfo" >> "uniformClass")};
if (param [0, false]) then { // Check all units (if naked)
    INFO("checking ALL units");
   _units append ((configProperties [configFile >> "CfgVehicles", "(isClass _x) && {(getNumber (_x >> 'scope')) == 2} && {configName _x isKindOf 'CAManBase'}", true]));
};

INFO_1("Checking uniforms for correct medical hitpoints [%1 units]",count _units);

private _testPass = true;
{
    private _typeOf = configName _x;
    private _hitpoints = (configProperties [_x >> "HitPoints", "isClass _x", true]) apply {configName _x};

    // _typeOf createUnit [position player, group player, "z = this"];
    // deleteVehicle z;

    private _lastHitpoint = (_hitpoints param [(count _hitpoints) - 1, "#array"]);
    if (_lastHitpoint != "ACE_HDBracket") then {
        WARNING_2("%1 has bad last hitpoint: %2",_typeOf,_hitpoints);
        _testPass = false;
    };

    if (((_hitpoints findIf {_x == "HitLeftArm"}) == -1) || {(_hitpoints findIf {_x == "HitRightArm"}) == -1}
            || {(_hitpoints findIf {_x == "HitLeftLeg"}) == -1} || {(_hitpoints findIf {_x == "HitRightLeg"}) == -1}
            || {(_hitpoints findIf {_x == "HitHead"}) == -1} || {(_hitpoints findIf {_x == "HitBody"}) == -1}) then {
        WARNING_2("%1 missing ace hitpoints: %2",_typeOf,_hitpoints);
        _testPass = false;
    };
} forEach _units;

_testPass
