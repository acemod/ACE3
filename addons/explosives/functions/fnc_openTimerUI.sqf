#include "script_component.hpp"
/*
 * Author: mharis001
 * Opens the Explosive Timer UI for given explosive.
 *
 * Arguments:
 * 0: Explosive <OBJECT>
 *
 * Return Value:
 * True <BOOL>
 *
 * Example:
 * [_explosive] call ace_explosives_fnc_openTimerUI
 *
 * Public: No
 */

params ["_explosive"];
TRACE_1("Opening timer UI",_explosive);

createDialog QGVAR(timerUI);
private _display = uiNamespace getVariable [QGVAR(timerDisplay), displayNull];

// Update slider speed to 1s
(_display displayCtrl IDC_TIMER_SLIDER) sliderSetSpeed [1, 1];

// Add confirm button action
GVAR(explosive) = _explosive;
(_display displayCtrl IDC_TIMER_CONFIRM) ctrlAddEventHandler ["ButtonClick", {
    params ["_button"];

    private _slider = ctrlParent _button displayCtrl IDC_TIMER_SLIDER;
    private _time = floor sliderPosition _slider;
    private _explosive = GVAR(explosive);
    [
        ACE_player,
        getPosATL _explosive,
        _explosive getVariable QGVAR(Direction),
        _explosive getVariable QGVAR(class),
        "Timer",
        [_time],
        _explosive
    ] call FUNC(placeExplosive);
    closeDialog 0;
}];

// Add EH to allow for changing values by scrolling
_display displayAddEventHandler ["MouseZChanged", {
    params ["_display", "_scroll"];

    private _change = round _scroll;
    if (cba_events_control) then {_change = _change * 10};

    private _slider = _display displayCtrl IDC_TIMER_SLIDER;
    private _value = (sliderPosition _slider + _change) max TIMER_VALUE_MIN min TIMER_VALUE_MAX;
    _slider sliderSetPosition _value;
}];

// Add PFH to update the digit display (delay of 0.1s)
// Done like this to avoid flicker that would happen when rapidly changing values through EH method
[{
    params ["_display", "_pfhID"];

    // Make sure explosive still exists and is near player
    if ((!isNull _display) && {!alive ACE_player} || {!alive GVAR(explosive)} || {(ACE_player distance GVAR(explosive)) > 5}) exitWith {
        INFO_2("explosive became invalid",ACE_player,GVAR(explosive));
        closeDialog 0;
        _pfhID call CBA_fnc_removePerFrameHandler;
    };

    if (isNull _display) exitWith {
        _pfhID call CBA_fnc_removePerFrameHandler;
    };

    private _value = sliderPosition (_display displayCtrl IDC_TIMER_SLIDER);
    private _minutes = floor (_value / 60);
    private _seconds = floor (_value % 60);
    private _digitArray = [floor (_minutes / 10), _minutes mod 10, floor (_seconds / 10), _seconds mod 10];
    {
        (_display displayCtrl _x) ctrlSetText format [QPATHTOF(UI\seven_segment_%1.paa), _digitArray select _forEachIndex];
    } forEach TIMER_DIGIT_IDCs;
}, 0.1, _display] call CBA_fnc_addPerFrameHandler;

true
