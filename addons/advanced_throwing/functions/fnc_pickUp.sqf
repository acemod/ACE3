#include "script_component.hpp"
/*
 * Author: Jonpas
 * Picks up a throwable from the ground.
 *
 * Arguments:
 * 0: Pick Up Helper <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [helper, player] call ace_advanced_throwing_fnc_pickUp
 *
 * Public: No
 */

params ["_helper", "_unit"];
TRACE_2("params",_helper,_unit);

private _activeThrowable = _helper getVariable [QGVAR(throwable), objNull];

if (isNull _activeThrowable) exitWith {TRACE_2("throwable is null",_helper,_activeThrowable);};

// Detach if attached (to vehicle for example or another player)
private _attachedTo = attachedTo _activeThrowable;
if (!isNull _attachedTo) then {
    private _attachedList = _attachedTo getVariable [QEGVAR(attach,attached), []];
    {
        _x params ["_xObject"];
        if (_activeThrowable == _xObject) exitWith {
            TRACE_2("removing from ace_attach",_attachedTo,_attachedList);
            _attachedList deleteAt _forEachIndex;
            _attachedTo setVariable [QEGVAR(attach,attached), _attachedList, true];
        };
    } forEach _attachedList;
    detach _activeThrowable;
};

// Change locality for manipulation (some commands require local object, such as setVelocity)
if (!local _activeThrowable) then {
    ["ace_setOwner", [_activeThrowable, CBA_clientID]] call CBA_fnc_serverEvent;

    // Mark when it's safe to exit throw mode (locality change has delay)
    _unit setVariable [QGVAR(localityChanged), false];
    [{
        // Becomes local or times out
        local (_this select 0) || {(_this select 1) + 5 < CBA_missionTime}
    }, {
        (_this select 2) setVariable [QGVAR(localityChanged), true];
    }, [_activeThrowable, CBA_missionTime, _unit]] call CBA_fnc_waitUntilAndExecute;
};

// Invoke listenable event
["ace_throwablePickedUp", [_activeThrowable, _unit, _attachedTo]] call CBA_fnc_localEvent;

_unit setVariable [QGVAR(primed), true];
_unit setVariable [QGVAR(activeThrowable), _activeThrowable];

_unit call FUNC(prepare);
