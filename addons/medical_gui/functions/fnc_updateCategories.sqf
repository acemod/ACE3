#include "..\script_component.hpp"
/*
 * Author: mharis001
 * Updates the category buttons based currently avaiable treatments.
 *
 * Arguments:
 * 0: Medical Menu display <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_display] call ace_medical_gui_fnc_updateCategories
 *
 * Public: No
 */

params ["_display"];

{
    _x params ["_idc", "_category"];

    private _ctrl = _display displayCtrl _idc;
    private _enable = if (_category == "triage") then { true } else {
        GVAR(actions) findIf {_category == _x select 1 && {call (_x select 2)}} > -1
    };
    _ctrl ctrlEnable _enable;

    private _selectedColor = [
        profileNamespace getVariable ["GUI_BCG_RGB_R", 0.13],
        profileNamespace getVariable ["GUI_BCG_RGB_G", 0.54],
        profileNamespace getVariable ["GUI_BCG_RGB_B", 0.21],
        profileNamespace getVariable ["GUI_BCG_RGB_A", 0.8]
    ];
    private _color = [[0.4, 0.4, 0.4, 1], [1, 1, 1, 1]] select _enable;
    _color = [_color, _selectedColor] select (GVAR(selectedCategory) isEqualTo _category);
    _ctrl ctrlSetTextColor _color;
    _color set [-1, 0.8]; // Mouseover change
    _ctrl ctrlSetActiveColor _color;
} forEach [
    [IDC_TRIAGE, "triage"],
    [IDC_EXAMINE, "examine"],
    [IDC_BANDAGE, "bandage"],
    [IDC_MEDICATION, "medication"],
    [IDC_AIRWAY, "airway"],
    [IDC_ADVANCED, "advanced"],
    [IDC_DRAG, "drag"]
];
