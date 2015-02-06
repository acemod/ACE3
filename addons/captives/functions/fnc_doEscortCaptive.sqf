/*
 * Author: Nic547
 * Attaches a Captive to the _unit
 *
 * Arguments:
 * 0: _unit-Player <OBJECT>
 * 1: target <OBJECT>
 * 2: _state <BOOL>
 *
 * Return Value:
 * The return value <BOOL>
 *
 * Example:
 * -
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_3(_unit,_target,_state);

if (_state) then {
    if (_unit getVariable [QGVAR(isEscorting), false]) exitWith {};

    [_unit, _target] call EFUNC(common,claim);
    _unit setVariable [QGVAR(isEscorting), true, true];

    _target attachTo [_unit, [0, 1, 0]];

    _unit setVariable [QGVAR(escortedUnit), _target, true];

    //Add Actionmenu to release captive
    _actionID = _unit addAction [format ["<t color='#FF0000'>%1</t>", localize "STR_ACE_Captives_StopEscorting"],
    {[(_this select 0), ((_this select 0) getVariable [QGVAR(escortedUnit), objNull]), false] call FUNC(doEscortCaptive);},
    nil, 20, false, true, "", QUOTE(!isNull (GETVAR(_target,QGVAR(escortedUnit),objNull)))];

    [_unit, _target, _actionID] spawn {
        PARAMS_3(_unit,_target,_actionID);

        while {_unit getVariable [QGVAR(isEscorting), false]} do {
            sleep 0.2;

            if (!alive _target || {!alive _unit} || {!canStand _target} || {!canStand _unit} || {_target getVariable ["ACE_isUnconscious", false]} || {_unit getVariable ["ACE_isUnconscious", false]} || {!isNull (attachedTo _unit)}) then {
                _unit setVariable [QGVAR(isEscorting), false, true];
            };
        };
        [objNull, _target] call EFUNC(common,claim);

        detach _target;
        _unit removeAction _actionID;
    };
} else {
    _unit setVariable [QGVAR(isEscorting), false, true];
    _unit setVariable [QGVAR(escortedUnit), objNull, true];
};
