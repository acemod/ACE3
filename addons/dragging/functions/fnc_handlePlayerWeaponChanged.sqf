// by commy2
#include "script_component.hpp"

private ["_unit", "_weapon"];

_unit = _this select 0;
_weapon = _this select 1;

if (_unit getVariable [QGVAR(startDragging), false] || _unit getVariable [QGVAR(isDragging), false]) then {

    // drop dragged object when selecting a non-primary weapon
    if (_weapon != primaryWeapon _unit) then {
        private "_draggedObject";
        _draggedObject = _unit getVariable [QGVAR(draggedObject), objNull];

        [_unit, _draggedObject] call FUNC(dropObject);
    };

};

if (_unit getVariable [QGVAR(startCarrying), false] || _unit getVariable [QGVAR(isCarrying), false]) then {

    private "_carriedObject";
    _carriedObject = _unit getVariable [QGVAR(carriedObject), objNull];

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
