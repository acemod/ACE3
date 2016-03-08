/*
 * Author: Jonpas
 * Setter for toggling advanced element visibility.
 *
 * Arguments:
 * 0: Set/Unset <BOOL> (default: true)
 * 1: Element IDD <NUMBER> (default: 0)
 * 2: Element IDCs <ARRAY> (default: [])
 * 3: Show/Hide Element OR Element ACE Settings Variable <BOOL/STRING> (default: false)
 *
 * Return Value:
 * None
 *
 * Example:
 * [true, 300, [188], false] call ace_ui_fnc_setElementVisibility
 *
 * Public: Yes
 */
#include "script_component.hpp"

params [
    ["_set", true, [true]],
    ["_idd", 0, [0]],
    ["_elements", [], [[]]],
    ["_show", false, [true, ""]]
];

private _return = false;

if (_set) then {
    if ([_idd, _elements] in GVAR(elementsSet)) exitWith { TRACE_3("Element already set",_idd,_elements,GVAR(elementsSet)); };

    TRACE_4("Setting element",_idd,_elements,_show,GVAR(elementsSet));
    private _success = [_idd, _elements, _show] call FUNC(setAdvancedElement);

    if (_success) then {
        GVAR(elementsSet) pushBack [_idd, _elements];
        _return = true;
    };
} else {
    if ([_idd, _elements] in GVAR(elementsSet)) then {
        TRACE_4("Setting element",_idd,_elements,_show,GVAR(elementsSet));
        [_idd, _elements, _show] call FUNC(setAdvancedElement);

        private _index = GVAR(elementsSet) find [_idd, _elements];
        GVAR(elementsSet) deleteAt _index;
        _return = true;
    };
};

TRACE_2("Visibility set",_return,GVAR(elementsSet));
_return
