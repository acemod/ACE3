#include "..\script_component.hpp"
/*
 * Author: Glowbal, mharis001
 * Handles opening the Medical Menu. Called from onLoad event.
 *
 * Arguments:
 * 0: Medical Menu display <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [DISPLAY] call ace_medical_gui_fnc_onMenuOpen
 *
 * Public: No
 */

params ["_display"];

// Create background effects based on interact menu setting
if (EGVAR(interact_menu,menuBackground) == 1) then {[QGVAR(id), true] call EFUNC(common,blurScreen)};
if (EGVAR(interact_menu,menuBackground) == 2) then {0 cutRsc [QEGVAR(interact_menu,menuBackground), "PLAIN", 1, false]};

// Fix mouse moving randomly
[{
    [{setMousePosition _this}, _this] call CBA_fnc_execNextFrame;
}, getMousePosition] call CBA_fnc_execNextFrame;

// Set middle header as target name
private _ctrlTitle = _display displayCtrl IDC_NAME;
_ctrlTitle ctrlSetText ([GVAR(target)] call EFUNC(common,getName));

// Initially hide the triage select buttons
[_display] call FUNC(toggleTriageSelect);

// Store display and add PFH to update it
uiNamespace setVariable [QGVAR(menuDisplay), _display];
["ace_medicalMenuOpened", [ACE_player, GVAR(target), _display]] call CBA_fnc_localEvent;

if (GVAR(menuPFH) != -1) exitWith {
    TRACE_1("Menu PFH already running",GVAR(menuPFH));
};

GVAR(menuPFH) = [LINKFUNC(menuPFH), 0, []] call CBA_fnc_addPerFrameHandler;

// Hide categories if they don't have any actions (airway)
private _list = [
    [IDC_TRIAGE, true],
    [IDC_EXAMINE, true],
    [IDC_BANDAGE, "bandage"],
    [IDC_MEDICATION, "medication"],
    [IDC_AIRWAY, "airway"],
    [IDC_ADVANCED, "advanced"],
    [IDC_DRAG, "drag"],
    [IDC_TOGGLE, true]
];
private _countEnabled = {
    _x params ["", "_category"];
    if (_category isEqualType "") then { _x set [1, (GVAR(actions) findIf {_category == _x select 1}) > -1]; };
    _x select 1
} count _list;
private _offsetX = POS_X(1.5) + 0.5 * (POS_X(12.33) - POS_X(_countEnabled * 1.5) - POS_W(2 * 0.2));
// 0.2 - divider gap size

// Set divider position
private _ctrl = _display displayCtrl IDC_TRIAGE_DIVIDER;
_ctrl ctrlSetPositionX _offsetX + POS_W(1.5) + POS_W(0.085); // 0.085 = (0.2 - 0.03) / 2
_ctrl ctrlCommit 0;

_ctrl = _display displayCtrl IDC_TOGGLE_DIVIDER;
_ctrl ctrlSetPositionX _offsetX + POS_W(1.5*(_countEnabled - 1)) + POS_W(0.2) + POS_W(0.085);
_ctrl ctrlCommit 0;

{
    _x params ["_idc", "_enabled"];

    if (_forEachIndex == 1 || {_forEachIndex == count _list - 1}) then {
        _offsetX = _offsetX + POS_W(0.2);
    };

    private _ctrl = _display displayCtrl _idc;
    if (_enabled) then {
        _ctrl ctrlSetPositionX _offsetX;
        _ctrl ctrlCommit 0;
        _offsetX = _offsetX + POS_W(1.5);
    } else {
        _ctrl ctrlShow false;
    };
} forEach _list;

// Set toggle button icon and tooltip
private _ctrl = _display displayCtrl IDC_TOGGLE;
if (GVAR(target) == ACE_player) then {
    _ctrl ctrlSetText QPATHTOF(data\categories\toggle_to_other.paa);
    _ctrl ctrlSetTooltip LLSTRING(ToggleToOther);
} else {
    _ctrl ctrlSetText QPATHTOF(data\categories\toggle_to_self.paa);
    _ctrl ctrlSetTooltip LLSTRING(ToggleToSelf);
};
