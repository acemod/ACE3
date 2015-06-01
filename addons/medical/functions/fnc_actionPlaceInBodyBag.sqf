/*
 * Author: Glowbal
 * Replace a dead body by a bodybag
 *
 * Arguments:
 * 0: The patient <OBJECT>
 * 1: The new item classname <STRING>
 *
 * Return Value:
 * nil
 *
 * Public: Yes
 */

#include "script_component.hpp"

private ["_target","_caller", "_nameOfUnit", "_onPosition", "_bodyBagCreated"];
_caller = _this select 0;
_target = _this select 1;

_nameOfUnit = [_target] call EFUNC(common,getName);
if (alive _target) then {
    [_target, true] call FUNC(setDead);
};
_onPosition = getPosASL _target;
deleteVehicle _target;
_bodyBagCreated = createVehicle ["ACE_bodyBagObject", _onPosition, [], 0, "NONE"];
// reset the position to ensure it is on the correct one.
_bodyBagCreated setPosASL [_onPosition select 0, _onPosition select 1, (_onPosition select 2) + 0.2];

_bodyBagCreated;
