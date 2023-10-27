#include "..\script_component.hpp"
/*
 * Author: LinkIsGrim
 * Intercepts group heal attempts and replaces items
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_medical_engine_fnc_commandChanged
 *
 * Public: No
 */
params ["_group", "_newCommand"];

if (!local _group) exitWith {};
if !(_newCommand in ["HEAL", "HEAL SOLDIER", "PATCH SOLDIER", "FIRST AID", "HEAL SELF", "SUPPORT"]) exitWith {};

{
    _x call EFUNC(common,replaceRegisteredItems);
    if (!unitReady _x) then {
        [_x] joinSilent (leader _group)
    };
} forEach (units _group);
