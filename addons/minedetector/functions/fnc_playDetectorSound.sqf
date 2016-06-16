/*
 * Author: Glowbal
 * Play the detector sound
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Sound class name <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "ace_buzz_1"] call ace_minedetector_fnc_playDetectorSound
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_unit", "_detectorSound"];

if (isNull _unit) exitwith {
    ACE_LOGERROR_1("unit does not exist [%1]",_unit);
};
if (!alive _unit) exitwith {
    ACE_LOGERROR_1("unit is not alive [%1]",_unit);
};

private _helperObject = _unit getvariable [QGVAR(helperLogic), objNull];
if (!isNull _helperObject) then {
    deleteVehicle _helperObject;
};
_helperObject = "ACE_LogicDummy" createVehicleLocal (getPos _unit);

if !(isNull _helperObject) then {
    _helperObject attachto [_unit,[0,0,-3],""];
    _unit setvariable [QGVAR(helperLogic), _helperObject];
    
    [_helperObject, _unit] say3D _detectorSound;
} else {
    ACE_LOGERROR_1("helper does not exist [%1]",_helperObject);
};
