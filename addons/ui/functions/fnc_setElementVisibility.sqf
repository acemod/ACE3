/*
 * Author: Jonpas
 * Setter for toggling advanced element visibility.
 *
 * Arguments:
 * 0: Set/Unset <BOOL>
 * 1: Element Name <ARRAY/STRING>
 * 2: Show/Hide Element <BOOL> (default: false)
 *
 * Return Value:
 * None
 *
 * Example:
 * [true, "ace_ui_ammoCount", false] call ace_ui_fnc_setElementVisibility
 *
 * Public: Yes
 */
#include "script_component.hpp"

params [
    ["_set", true, [true]],
    ["_element", "", [""]],
    ["_show", false, [true]]
];

// Verify element is bound
if (!isClass (configFile >> "ACE_UI" >> _element)) exitWith {
    ACE_LOGWARNING_1("Element '%1' does not exist",_element);
};

private _return = false;

if (_set) then {
    // Exit if element has been set from another component, print warning if after interface initialization
    if ([_element, _show] in GVAR(elementsSet) || {[_element, !_show] in GVAR(elementsSet)}) exitWith {
        if (GVAR(interfaceInitialized)) then {
            ACE_LOGWARNING_2("Element '%1' already set in %2",_element,GVAR(elementsSet));
        };
    };

    TRACE_3("Setting element",_element,_show,GVAR(elementsSet));
    private _success = [_element, _show, false, true] call FUNC(setAdvancedElement);

    if (_success) then {
        GVAR(elementsSet) pushBack [_element, _show];
        _return = true;
    };
} else {
    if ([_element, _show] in GVAR(elementsSet) || {[_element, !_show] in GVAR(elementsSet)}) then {
        TRACE_3("Unsetting element",_element,_show,GVAR(elementsSet));

        private _index = GVAR(elementsSet) find [_element, _show];
        if (_index == -1) then {
            _index = GVAR(elementsSet) find [_element, !_show];
        };
        GVAR(elementsSet) deleteAt _index;

        [_element, _show, false, true] call FUNC(setAdvancedElement);
        _return = true;
    };
};

TRACE_2("Visibility set",_return,GVAR(elementsSet));
_return
