/*
 * Author: commy2
 *
 * Carry PFH
 *
 * Arguments:
 * ?
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

#ifdef DEBUG_ENABLED_DRAGGING
    systemChat format ["%1 startCarryPFH running", ACE_time];
#endif

params ["_args", "_idPFH"];
_args params ["_unit", "_target", "_timeOut"];

// handle aborting carry
if !(_unit getVariable [QGVAR(isCarrying), false]) exitWith {
    [_idPFH] call CBA_fnc_removePerFrameHandler;
};

// same as dragObjectPFH, checks if object is deleted or dead OR (target moved away from carrier (weapon disasembled))
if (!alive _target || {_unit distance _target > 10}) then {
    [_unit, _target] call FUNC(dropObject);
    [_idPFH] call CBA_fnc_removePerFrameHandler;
};

// handle persons vs objects
if (_target isKindOf "CAManBase") then {
    if (ACE_time > _timeOut) exitWith {
        [_unit, _target] call FUNC(carryObject);

        [_idPFH] call CBA_fnc_removePerFrameHandler;
    };
} else {
    if (ACE_time > _timeOut) exitWith {
        [_idPFH] call CBA_fnc_removePerFrameHandler;

        // drop if in timeout
        private "_draggedObject";
        _draggedObject = _unit getVariable [QGVAR(draggedObject), objNull];
        [_unit, _draggedObject] call FUNC(dropObject);
    };

    // wait for the unit to stand up
    if (stance _unit == "STAND") exitWith {
        [_unit, _target] call FUNC(carryObject);

        [_idPFH] call CBA_fnc_removePerFrameHandler;
    };

};
