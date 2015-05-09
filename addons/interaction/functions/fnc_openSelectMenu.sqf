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
 * Return value:
 * None
 *
 * Example:
 * [["text", {statement}, {condition}, showDisabled, priority, "icon", [variables]], {selectAction}, {cancelAction}] call ace_interaction_fnc_openSelectMenu
 *
 * Public: No
 */
#include "script_component.hpp"

if (!(profileNamespace getVariable [QGVAR(FlowMenu), false])) then {
    GVAR(SelectAccept) = _this select 1;
    GVAR(SelectCancel) = _this select 2;
    buttonSetAction [8855, QUOTE( call GVAR(SelectCancel); )]; // Cancel
    buttonSetAction [8860, QUOTE( (call compile (lbData [ARR_2(8866, lbCurSel 8866)])) call GVAR(SelectAccept); )]; // Accept
    lbSetCurSel [8866, 0];
}else{
    PARAMS_1(_customActions);

    private ["_count", "_action"];

    _count = count _customActions;
    if (_count == 0) exitWith {};
    _customActions call FUNC(sortOptionsByPriority);
    for "_i" from 0 to _count -1 do {
        _action = _customActions select _i;
        _action set [1, (_this select 1)];
    };
    GVAR(Buttons) = _customActions;
    [(_this select 2), true, true, false, ACE_player] call FUNC(initialiseInteraction);
};
