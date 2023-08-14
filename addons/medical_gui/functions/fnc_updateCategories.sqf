#include "script_component.hpp"
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
    private _enable = GVAR(actions) findIf {_category == _x select 1 && {call (_x select 2)}} > -1;
    _ctrl ctrlEnable _enable;

    private _color = [[0.4, 0.4, 0.4, 1], [1, 1, 1, 1]] select _enable;
    _ctrl ctrlSetTextColor _color;

    private _actionsCount = count GVAR(possibleActions);
    private _pageCount = ceil (_actionsCount/9);

    if (GVAR(selectedCategory) isEqualTo _category && {_pageCount > 1}) then {
        private _newImg = switch (_pageCount - GVAR(page)) do {
            case 0: {QPATHTOF(data\pages_1.paa)};
            case 1: {QPATHTOF(data\pages_1.paa)};
            case 2: {QPATHTOF(data\pages_2.paa)};
            default {QPATHTOF(data\pages_3.paa)};
        };
        private _tooltip = getText (configFile >> "ACE_Medical_Menu" >> "controls" >> _category >> "tooltip");
        _ctrl ctrlSetText _newImg;
        _ctrl ctrlSetTooltip format ["%3\nPage %1/%2",GVAR(page)+1,_pageCount,_tooltip];
        continue;
    };
    if ("pages" in ctrlText _ctrl) then {
        private _newTooltip = getText (configFile >> "ACE_Medical_Menu" >> "controls" >> _category >> "tooltip");
        private _newText = getText (configFile >> "ACE_Medical_Menu" >> "controls" >> _category >> "text");
        _ctrl ctrlSetText _newText;
        _ctrl ctrlSetTooltip _newTooltip;
    };
} forEach [
    [IDC_EXAMINE, "examine"],
    [IDC_BANDAGE, "bandage"],
    [IDC_MEDICATION, "medication"],
    [IDC_AIRWAY, "airway"],
    [IDC_ADVANCED, "advanced"],
    [IDC_DRAG, "drag"]
];
