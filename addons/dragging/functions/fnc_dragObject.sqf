/*
 * Author: commy2
 *
 * Drag an object. Called from ace_dragging_fnc_startDrag
 *
 * Argument:
 * 0: Unit that should do the dragging (Object)
 * 1: Object to drag (Object)
 *
 * Return value:
 * NONE.
 */
#include "script_component.hpp"

private ["_unit", "_target"];

_unit = _this select 0;
_target = _this select 1;

// get attachTo offset and direction.
private ["_position", "_direction"];

_position = _target getVariable [QGVAR(dragPosition), [0, 0, 0]];
_direction = _target getVariable [QGVAR(dragDirection), 0];

// add height offset of model
private "_offset";
_offset = (_target modelToWorld [0, 0, 0] select 2) - (_unit modelToWorld [0, 0, 0] select 2);

_position = _position vectorAdd [0, 0, _offset];

// attach object
_target attachTo [_unit, _position];
_target setDir _direction;

// add scrollwheel action to release object
/*
    _actionID = _unit getVariable ["AGM_Drag_ReleaseActionID", -1];

    if (_actionID != -1) then {
        _unit removeAction _actionID;
    };
    _actionID = _unit addAction [format ["<t color='#FF0000'>%1</t>", localize "STR_AGM_Drag_EndDrag"], "player call AGM_Drag_fnc_releaseObject;", nil, 20, false, true, "","player call AGM_Drag_fnc_isDraggingObject"];

    _unit setVariable ["AGM_Drag_ReleaseActionID", _actionID];
*/

_unit setVariable [QGVAR(isDragging), true, true];

// check everything
[FUNC(dragObjectPFH), 0, [_unit, _target]] call CBA_fnc_addPerFrameHandler;

// reset current dragging height.
GVAR(currentHeightChange) = 0;
