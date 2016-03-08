/*
 * Author: Jonpas
 * Wrapper for setting advanced element visibility.
 *
 * Arguments:
 * 0: Set/Unset <BOOL> (default: true)
 * 1: Element info <ARRAY>
 *   0: Show/Hide Element OR Element Variable <BOOL/STRING>
 *   1: Element IDD <NUMBER>
 *   2: Element IDCs <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [false] call ace_ui_fnc_setElementVisibility
 *
 * Public: Yes
 */
#include "script_component.hpp"

params [
    ["_set", true, [true]],
    ["_elementInfo", [true, 0, []], [[]], 3]
];

_elementInfo params [
    ["_show", false, [true, ""]],
    ["_idd", 0, [0]],
    ["_elements", [], [[]]]
];

if (_set) then {
    if ([_idd, _elements] in GVAR(elementsSet)) exitWith { TRACE_2("Element already set",_elementInfo,GVAR(elementsSet)); };

    TRACE_2("Setting element",_elementInfo,GVAR(elementsSet));
    private _success = [_elementInfo] call FUNC(setAdvancedElement);

    if (_success) then {
        GVAR(elementsSet) pushBack [_idd, _elements];
    };
} else {
    if ([_idd, _elements] in GVAR(elementsSet)) then {
        TRACE_2("Unsetting element",_elementInfo,GVAR(elementsSet));

        TRACE_2("Toggling element",_elementInfo,GVAR(elementsSet));
        [_elementInfo] call FUNC(setAdvancedElement);

        private _index = GVAR(elementsSet) find [_idd, _elements];
        GVAR(elementsSet) deleteAt _index;
    };
};
