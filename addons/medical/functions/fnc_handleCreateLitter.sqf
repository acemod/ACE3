/*
 * Author: Glowbal
 * handle Litter Create
 *
 * Arguments:
 * 0: Litter Class <STRING>
 * 1: Position <ARRAY>
 * 2: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["litter", [2, 5, 6], bob] call ACE_medical_fnc_handleCreateLitter
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_litterClass", "_position", "_direction"];
TRACE_3("params",_litterClass,_position,_direction);

//IGNORE_PRIVATE_WARNING(_values);

if (isNil QGVAR(allCreatedLitter)) then {
    GVAR(allCreatedLitter) = [];
    GVAR(litterPFHRunning) = false;
};

private _p3dFile = getText (configFile >> "CfgVehicles" >> _litterClass >> "model");
if (_p3dFile == "") exitWith {TRACE_2("no model",_litterClass,_p3dFile)};
// createSimpleObject expects a path without the leading slash
if ((_p3dFile select [0,1]) == "\") then {_p3dFile = _p3dFile select [1];};

private _litterObject = createSimpleObject [_p3dFile, [0,0,0]];
TRACE_2("created",_litterClass,_litterObject);
_litterObject setDir _direction;
_litterObject setPosATL _position;
// Move the litter next frame to get rid of HORRIBLE spacing, fixes #1112
[{ params ["_object", "_pos"]; _object setPosATL _pos; }, [_litterObject, _position]] call CBA_fnc_execNextFrame;

private _maxLitterCount = getArray (configFile >> "ACE_Settings" >> QGVAR(litterSimulationDetail) >> "_values") select GVAR(litterSimulationDetail);
if ((count GVAR(allCreatedLitter)) > _maxLitterCount) then {
    // gank the first litter object, and spawn ours.
    private _oldLitter = GVAR(allCreatedLitter) deleteAt 0;
    {
        deleteVehicle _x;
    } forEach (_oldLitter select 1);
};

GVAR(allCreatedLitter) pushBack [CBA_missionTime, [_litterObject]];

if(!GVAR(litterPFHRunning) && {GVAR(litterCleanUpDelay) > 0}) then {
    // Start the litter cleanup loop
    GVAR(litterPFHRunning) = true;
    call FUNC(litterCleanupLoop);
};
