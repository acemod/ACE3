/*
 * Author: Garth de Wet (LH)
 * Opens the select menu UI and sets up the UI
 *
 * Arguments:
 * 0: Items <ARRAY>
 *   0: Text <STRING>
 *   1: Statement to execute <CODE>
 *   2: Condition before execute <CODE>
 *   3: showDisabled <BOOL>
 *   4: Priority <NUMBER>
 *   5: Icon <STRING>
 *   6: Extra variables passed to the code <ARRAY>
 * 1: Select Action <CODE>
 * 2: Cancel Action <CODE>
 *
 * Return Value:
 * None
 *
 * Example:
 * [["text", {statement}, {condition}, showDisabled, priority, "icon", [variables]], {selectAction}, {cancelAction}] call ace_interaction_fnc_openSelectMenu
 *
 * Public: No
 */
#include "script_component.hpp"

private["_action", "_count", "_customActions", "_i"];

params ["_customActions" ,"_selectAccept", "_selectCancel"];
if (!(profileNamespace getVariable [QGVAR(FlowMenu), false])) then {
    GVAR(SelectAccept) = _selectAccept;
    GVAR(SelectCancel) = _selectCancel;
    buttonSetAction [8855, QUOTE( call GVAR(SelectCancel); )]; // Cancel
    buttonSetAction [8860, QUOTE( (call compile (lbData [ARR_2(8866, lbCurSel 8866)])) call GVAR(SelectAccept); )]; // Accept
    lbSetCurSel [8866, 0];
} else {
    private ["_count", "_action"];
    params ["_customActions"];

    _count = count _customActions;
    if (_count == 0) exitWith {};
    _customActions call FUNC(sortOptionsByPriority);
    for "_i" from 0 to _count -1 do {
        _action = _customActions select _i;
        _action set [1, _selectAccept];
    };
    GVAR(Buttons) = _customActions;
    [_selectCancel, true, true, false, ACE_player] call FUNC(initialiseInteraction);
};
