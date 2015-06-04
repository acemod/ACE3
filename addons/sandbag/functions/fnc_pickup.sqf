/*
 * Author: Ruthberg
 * Pick up sandbag
 *
 * Arguments:
 * 0: sandbag <OBJECT>
 * 1: unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_sandbag, _unit] call ace_sandbag_fnc_pickup;
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_2(_sandbag,_unit);

_unit playActionNow "PutDown";

_unit setVariable [QGVAR(usingSandbag), true];
[{
    PARAMS_2(_sandbag,_unit);
    _unit setVariable [QGVAR(usingSandbag), false];
    deletevehicle _sandbag;
    
    // Force physx update
    {
        _x setPosASL (getPosASL _x);
    } forEach (_unit nearObjects ["ACE_SandbagObject", 5]);
    
    [_unit, "ACE_Sandbag_empty"] call EFUNC(common,addToInventory);
}, [_sandbag, _unit], 1.5, 0.5] call EFUNC(common,waitAndExecute);
