/*
 * Author: esteldunedain
 * Creates an isolated ACE action
 * Note: This function is NOT global.
 *
 * Argument:
 * 0: Action name <STRING>
 * 1: Name of the action shown in the menu <STRING>
 * 2: Icon <STRING>
 * 3: Statement <CODE>
 * 4: Condition <CODE>
 * 5: Insert children code <CODE> (Optional)
 * 6: Action parameters <ANY> (Optional)
 * 7: Position (Position array, Position code or Selection Name) <ARRAY>, <CODE> or <STRING> (Optional)
 * 8: Distance <NUMBER> (Optional)
 * 9: Other parameters <ARRAY> (Optional)
 * 10: Modifier function <CODE> (Optional)
 *
 * Return value:
 * Action <ARRAY>
 *
 * Example:
 * ["VulcanPinch","Vulcan Pinch","",{_target setDamage 1;},{true},{},[parameters], [0,0,0], 100] call ace_interact_menu_fnc_createAction;
 *
 * Public: No
 */
#include "script_component.hpp"

private "_defaultParams";
_defaultParams = [false, false, false, false, false];
_defaultPosition = {[0, 0, 0]};

PARAMS_5(_actionName,_displayName,_icon,_statement,_condition);
DEFAULT_PARAM(5,_insertChildren,{});
DEFAULT_PARAM(6,_customParams,[]);
DEFAULT_PARAM(7,_position,_defaultPosition);
DEFAULT_PARAM(8,_distance,2);
DEFAULT_PARAM(9,_params,_defaultParams);
DEFAULT_PARAM(10,_modifierFunction,{});

_position = if (typeName (_position) == "STRING") then {
        // If the action is set to a selection, create the suitable code
        compile format ["_target selectionPosition '%1'", _position];
    } else {
        if (typeName (_position) == "ARRAY") then {
            // If the action is set to a array position, create the suitable code
            compile format ["%1", _position];
        } else {
            _position;
        };
    };

[
    _actionName,
    _displayName,
    _icon,
    _statement,
    _condition,

    _insertChildren,
    _customParams,
    _position,
    _distance,
    _params,
    _modifierFunction
]
