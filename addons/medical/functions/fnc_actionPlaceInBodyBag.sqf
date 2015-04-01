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

if !([_caller, "ACE_itemBodyBag"] call EFUNC(common,hasItem)) exitwith {};

[_caller, "ACE_itemBodyBag"] call EFUNC(common,useItem);

_nameOfUnit = [_unit] call EFUNC(common,getName);
if (alive _unit) then {
    // force kill the unit.
    [_unit, true] call FUNC(setDead);
};
_onPosition = getPos _unit;
deleteVehicle _unit;
_bodyBagCreated = createVehicle ["ACE_bodyBag", _onPosition, [], 0, "NONE"];
// reset the position to ensure it is on the correct one.
_bodyBagCreated setPos _onPosition;

// TODO Does this need to be something with QUOTE(DEFUNC)?
[[_bodyBagCreated], QEFUNC(common,revealObject), true] call call EFUNC(common,execRemoteFnc); /* TODO Replace by event system */

_bodyBagCreated;
