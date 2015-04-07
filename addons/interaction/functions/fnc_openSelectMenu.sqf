/*
    Author: Garth de Wet (LH)

    Description:
        Opens the select menu UI and sets up the UI

    Parameters:
        0: ARRAY - items
            ARRAY
                0 = Text
                1 = statement to execute
                2 = condition before execute
                3 = showDisabled
                4 = priority
                5 = icon
                6 = extra variables. Passed to the code.
        1: Code - select action
        2: Code - Cancel Action
    Returns:
        Nothing

    Example:
*/
#include "script_component.hpp"

if (!(profileNamespace getVariable [QGVAR(FlowMenu), false])) then {
    GVAR(SelectAccept) = _this select 1;
    GVAR(SelectCancel) = _this select 2;
    buttonSetAction [8855, QUOTE( call GVAR(SelectCancel); )]; // cancel
    buttonSetAction [8860, QUOTE( (call compile (lbData [ARR_2(8866, lbCurSel 8866)])) call GVAR(SelectAccept); )]; // accept
    lbSetCurSel [8866, 0];
}else{
    _customActions = _this select 0;
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
