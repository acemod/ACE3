/*
 * Author: Jonpas
 * Setter for toggling advanced element visibility.
 *
 * Arguments:
 * 0: Source <STRING>
 * 1: Set/Unset <BOOL>
 * 2: Element Name <STRING>
 * 3: Show/Hide Element <BOOL> (default: false)
 *
 * Return Value:
 * None
 *
 * Example:
 * ["ace_reload", true, "ace_ui_ammoCount", false] call ace_ui_fnc_setElementVisibility
 *
 * Public: Yes
 */
#include "script_component.hpp"

params [
    ["_source", "", [""]],
    ["_set", true, [true]],
    ["_element", "", [""]],
    ["_show", false, [true]]
];

// Verify element is bound
if (!isClass (configFile >> "ACE_UI" >> _element)) exitWith {
    ACE_LOGWARNING_1("Element '%1' does not exist",_element);
};

if (_source == "" || {_element == ""}) exitWith {
    ACE_LOGWARNING("Source or Element may not be empty strings!");
};

private _return = false;

private _setElement = [_element] call FUNC(findSetElement);
_setElement params ["_indexSet", "_sourceSet"];

if (_set) then {
    // Exit if element has been set from another component, print warning if after interface initialization
    if (_indexSet != -1) exitWith {
        if (GVAR(interfaceInitialized)) then {
            ACE_LOGWARNING_2("Element '%1' already set by %2",_element,_sourceSet);
        };
    };

    TRACE_4("Setting element",_source,_element,_show,GVAR(elementsSet));
    private _success = [_element, _show, false, true] call FUNC(setAdvancedElement);

    if (_success) then {
        GVAR(elementsSet) pushBack [_source, _element, _show];
        _return = true;
    };
} else {
    if (_indexSet != -1) then {
        TRACE_4("Unsetting element",_sourceSet,_element,_show,GVAR(elementsSet));

        GVAR(elementsSet) deleteAt _indexSet;

        [_element, _show, false, true] call FUNC(setAdvancedElement);
        _return = true;
    };
};

TRACE_2("Visibility set",_return,GVAR(elementsSet));
_return
