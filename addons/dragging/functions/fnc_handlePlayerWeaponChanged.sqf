#include "script_component.hpp"
/*
 * Author: commy2
 * Handle the Weapon Changed Event
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Weapon <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_unit, "gun"] call ace_dragging_fnc_handlePlayerWeaponChanged;
 *
 * Public: No
*/

params ["_unit", "_weapon"];
TRACE_2("params",_unit,_weapon);

if (_unit getVariable [QGVAR(isDragging), false]) then {

    // drop dragged object when changing weapon
    if (_weapon != _unit getVariable [QGVAR(currentWeapon), ""]) then {
        private _draggedObject = _unit getVariable [QGVAR(draggedObject), objNull];

        [_unit, _draggedObject] call FUNC(dropObject);
    };

};

if (_unit getVariable [QGVAR(isCarrying), false]) then {

    private _carriedObject = _unit getVariable [QGVAR(carriedObject), objNull];

    if (_carriedObject isKindOf "CAManBase") then {

        if (_weapon != primaryWeapon _unit) then {
            [_unit, _carriedObject] call FUNC(dropObject_carry);
        };

    } else {

        // drop carried object when selecting any weapon
        if (_weapon != "") then {
            [_unit, _carriedObject] call FUNC(dropObject_carry);
        };

    };
};
