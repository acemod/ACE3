/*
 * Author: commy2
 *
 * Initialize variables for dragable objects. Called from init EH.
 *
 * Argument:
 * 0: Any object (Object)
 *
 * Return value:
 * NONE.
 */
#include "script_component.hpp"

private "_object";

_object = _this select 0;

if (getNumber (configFile >> "CfgVehicles" >> typeOf _object >> QGVAR(canDrag)) == 1) then {
    private ["_position", "_direction"];

    _position = getArray (configFile >> "CfgVehicles" >> typeOf _object >> QGVAR(dragPosition));
    _direction = getNumber (configFile >> "CfgVehicles" >> typeOf _object >> QGVAR(dragDirection));

    [_object, true, _position, _direction] call FUNC(setDraggable);
};
