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
 * Public: No
 */
#include "script_component.hpp"

if(!hasInterface) exitWith { false };

params ["_litterClass", "_position", "_direction"];
private["_litterObject", "_maxLitterCount"];
//IGNORE_PRIVATE_WARNING(_values);

if (isNil QGVAR(allCreatedLitter)) then {
    GVAR(allCreatedLitter) = [];
    GVAR(litterPFHRunning) = false;
};

_litterObject = _litterClass createVehicleLocal _position;
_litterObject setDir _direction;
_litterObject setPosATL _position;
// Move the litter next frame to get rid of HORRIBLE spacing, fixes #1112
[{ params ["_object", "_pos"]; _object setPosATL _pos; }, [_litterObject, _position]] call CBA_fnc_execNextFrame;

_maxLitterCount = getArray (configFile >> "ACE_Settings" >> QGVAR(litterSimulationDetail) >> "_values") select GVAR(litterSimulationDetail);
if((count GVAR(allCreatedLitter)) > _maxLitterCount ) then {
    // gank the first litter object, and spawn ours.
    private["_oldLitter"];
    _oldLitter = GVAR(allCreatedLitter) deleteAt 0;
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
