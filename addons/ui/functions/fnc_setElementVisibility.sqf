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
 * Successfully Modified <BOOL>
 *
 * Example:
 * _successfullyModified = ["ace_reload", true, "ammoCount", false] call ace_ui_fnc_setElementVisibility
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

if (_source == "" || {_element == ""}) exitWith {
    WARNING("Source or Element may not be empty strings!");
};

_element = toLower _element;

// Verify element is bound
private _cachedElement = GVAR(configCache) getVariable _element;
if (isNil "_cachedElement") exitWith {
    WARNING_2("Element '%1' does not exist - modification by '%2' failed.",_element,_source);
};

private _setElement = GVAR(elementsSet) getVariable _element;
private _return = false;

if (isNil "_setElement") then {
    TRACE_3("Setting element",_source,_element,_show);
    private _success = [_element, _show, false, true] call FUNC(setAdvancedElement);

    if (_success) then {
        GVAR(elementsSet) setVariable [_element, [_source, _show]];
        _return = true;
    };
} else {
    _setElement params ["_sourceSet"];

    if (_set) then {
        if (GVAR(interfaceInitialized)) then {
            WARNING_3("Element '%1' already set by '%2' - modification by '%3' failed.",_element,_sourceSet,_source);
        };
    } else {
        TRACE_3("Unsetting element",_sourceSet,_element,_show);
        GVAR(elementsSet) setVariable [_element, nil];

        [_element, _show, false, true] call FUNC(setAdvancedElement);
        _return = true;
    };
};

TRACE_2("Visibility set",_element,_return);
_return
