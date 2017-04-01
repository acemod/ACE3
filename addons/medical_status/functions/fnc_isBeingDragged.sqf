/*
 * Author: PabstMirror
 * Returns if a target is being dragged. (from ace_dragging)
 *
 * Arguments:
 * 0: Target Unit <OBJECT>
 *
 * Return Value:
 * Is being dragged <BOOL>
 *
 * Example:
 * [bob] call ace_medical_fnc_isBeingDragged
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_target"];

private _owner = _target getVariable [QEGVAR(common,owner), objNull];

if (isNull _owner) exitWith {false};

(_owner getVariable [QEGVAR(dragging,draggedObject), objNull]) == _target
