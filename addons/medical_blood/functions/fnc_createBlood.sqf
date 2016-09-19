/*
 * Author: Glowbal
 * Spawn a blood drop. Available blood drop classes are ACE_Blooddrop_1 through ACE_Blooddrop_4.
 *
 * Arguments:
 * 0: classname of blood drop <OBJECT>
 * 1: Position <ARRAY>
 *
 * Return Value:
 * Created blood drop <OBJECT>
 *
 * Example:
 * ["ACE_Blooddrop_2", getPos player] call ace_medical_blood_fnc_createBlood
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_type", "_pos"];

private _p3dFile = getText (configFile >> "CfgVehicles" >> _type >> "model");
if (_p3dFile == "") exitWith {};
// createSimpleObject expects a path without the leading slash
if ((_p3dFile select [0,1]) == "\") then {_p3dFile = _p3dFile select [1];};

private _object = createSimpleObject [_p3dFile, [0,0,0]];
_object setPos _pos;
_object setDir (random 360);

if (!isServer) then {
    [QGVAR(bloodDropCreated), [_object]] call CBA_fnc_serverEvent;
} else {
    [QGVAR(bloodDropCreated), [_object]] call CBA_fnc_localEvent;
};

_object;
