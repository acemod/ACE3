/*
 * Author: Jonpas
 * Finds set element by element name and returns index, source of the set element and state.
 *
 * Arguments:
 * 0: Element Name <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["ace_ui_ammoCount"] call ace_ui_fnc_findSetElement
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_element"];

{
    if (_element in _x) exitWith {
        [_forEachIndex, _x select 0, _x select 2]
    };
    [-1, "", false]
} forEach GVAR(elementsSet);
