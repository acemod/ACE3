/*
 * Author: Nelson Duarte, SilentSpike
 * Function used to handle list tab change
 *
 * Arguments:
 * 0: Control <CONTROL>
 * 1: New tab index <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * _this call ace_spectator_fnc_ui_handleTabSelected
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_ctrl", "_index"];

// Nothing to do if it's the same tab
private _newType = [LIST_ENTITIES, LIST_LOCATIONS] select _index;
if (GVAR(uiListType) == _newType) exitWith {};

// Clear list
tvClear CTRL_LIST;

// Force initial update
if (_index == 0) then {
    [] call FUNC(ui_updateListEntities);
} else {
    [] call FUNC(ui_updateListLocations);
};

// Track current list type
GVAR(uiListType) = _newType;
