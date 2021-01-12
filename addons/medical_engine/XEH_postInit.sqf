#include "script_component.hpp"

[QGVAR(updateDamageEffects), LINKFUNC(updateDamageEffects)] call CBA_fnc_addEventHandler;
["unit", {
    params ["_new"];
    [_new] call FUNC(updateDamageEffects); // Run on new controlled unit to update QGVAR(aimFracture)
}, true] call CBA_fnc_addPlayerEventHandler;


["CAManBase", "init", {
    params ["_unit"];

    private _allHitPoints = getAllHitPointsDamage _unit param [0, []];

    // Calling this function inside curly brackets allows the usage of
    // "exitWith", which would be broken with "HandleDamage" otherwise.
    _unit setVariable [
        QEGVAR(medical,HandleDamageEHID),
        _unit addEventHandler ["HandleDamage", {_this call FUNC(handleDamage)}]            
    ];
    _unit setVariable [
        QEGVAR(medical,HitEHID),
        _unit addEventHandler ["Hit", {_this call FUNC(hit)}]            
    ];

    _unit setVariable [QEGVAR(medical,HitPoints), _allHitPoints];

    _unit setVariable [QEGVAR(medical,HeadHitPointIdxs), ["hitface", "hitneck", "hithead"]  apply {_allHitPoints find _x} ]; 
    _unit setVariable [QEGVAR(medical,BodyHitPointIdxs), ["hitchest", "hitdiaphragm", "hitabdomen", "hitpelvis"]  apply {_allHitPoints find _x} ]; 
    
    _unit setVariable [QEGVAR(medical,HitPoints), _allHitPoints];
    {
        _unit setVariable [format["%1Idx", _x], _forEachIndex];

    } forEach _allHitPoints;    
}, nil, [IGNORE_BASE_UAVPILOTS], true] call CBA_fnc_addClassEventHandler;


// this handles moving units into vehicles via load functions or zeus
// needed, because the vanilla INCAPACITATED state does not handle vehicles
["CAManBase", "GetInMan", {
    params ["_unit"];
    if (!local _unit) exitWith {};

    if (lifeState _unit == "INCAPACITATED") then {
        [_unit, true] call FUNC(setUnconsciousAnim);
    };
}] call CBA_fnc_addClassEventHandler;

// Fixes units being stuck in unconscious animation when being knocked over by a PhysX object
["CAManBase", "AnimDone", {
    params ["_unit", "_anim"];
    if (local _unit && {_anim find QGVAR(face) != -1 && {lifeState _unit != "INCAPACITATED"}}) then {
        [_unit, false] call FUNC(setUnconsciousAnim);
    };
}] call CBA_fnc_addClassEventHandler;
