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
 * ["example"] call ace_minedetector_fnc_playDetectorSound
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_unit", "_detectorSound"];

if (isNull _unit) exitwith {}; // TODO log error - unit does not exist
if (!alive _unit) exitwith {
    // log error, unit is not alive
};

private _helperObject = _unit getvariable [QGVAR(helperLogic), objNull];
if (!isNull _helperObject) then {
    deleteVehicle _helperObject;
};
_helperObject = "ACE_LogicDummy" createVehicleLocal (getPos _unit);

if !(isNull _helperObject) then {
    _helperObject attachto [_unit,[0,0,-3],""];
    [_helperObject, _unit] say3D _detectorSound;
};
