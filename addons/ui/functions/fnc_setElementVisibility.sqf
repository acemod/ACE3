/*
 * Author: Jonpas
 * Setter for toggling advanced element visibility.
 *
 * Arguments:
 * 0: Set/Unset <BOOL> (default: true)
 * 1: Element Info OR Element Name <ARRAY/STRING> (default: "")
 *   0: Element Info IDD <NUMBER> (default: 0)
 *   1: Element Info IDCs <ARRAY> (default: [])
 * 2: Show/Hide Element <BOOL> (default: false)
 *
 * Return Value:
 * None
 *
 * Example:
 * [true, 300, [188], false] call ace_ui_fnc_setElementVisibility
 * [true, "ace_ui_ammoCount", false] call ace_ui_fnc_setElementVisibility
 *
 * Public: Yes
 */
#include "script_component.hpp"

params [
    ["_set", true, [true]],
    ["_element", "", ["", []]],
    ["_show", false, [true]]
];

// Get IDD and Elements from setting name
private _idd = 0;
private _elements = [];
if (_element isEqualType "") then {
    private _elementInfo = ELEMENTS_ADVANCED select {_x select 2 == _element};
    if (_elementInfo isEqualTo []) exitWith {
        ACE_LOGWARNING_1("Element setting name does not exist (Element: %1)",_element);
    };
    _idd = (_elementInfo select 0) select 0;
    _elements = (_elementInfo select 0) select 1;
} else {
    _idd = _element select 0;
    _elements = _element select 1;
};

private _return = false;

if (_set) then {
    // Exit if element has been set from another component, print warning if after interface initialization
    if ([_idd, _elements] in GVAR(elementsSet)) exitWith {
        if (GVAR(interfaceInitialized)) then {
            ACE_LOGWARNING_3("Element already set (IDD: %1, Elements: %2, Elements Set: %3",_idd,_elements,GVAR(elementsSet));
        };
    };

    TRACE_4("Setting element",_idd,_elements,_show,GVAR(elementsSet));
    private _success = [_idd, _elements, _show] call FUNC(setAdvancedElement);

    if (_success) then {
        GVAR(elementsSet) pushBack [_idd, _elements, _show];
        _return = true;
    };
} else {
    if ([_idd, _elements, _show] in GVAR(elementsSet) || {[_idd, _elements, !_show] in GVAR(elementsSet)}) then {
        TRACE_4("Setting element",_idd,_elements,_show,GVAR(elementsSet));

        private _index = GVAR(elementsSet) find [_idd, _elements, _show];
        if (_index == -1) then {
            _index = GVAR(elementsSet) find [_idd, _elements, !_show];
        };
        GVAR(elementsSet) deleteAt _index;

        [_idd, _elements, _show] call FUNC(setAdvancedElement);
        _return = true;
    };
};

TRACE_2("Visibility set",_return,GVAR(elementsSet));
_return
