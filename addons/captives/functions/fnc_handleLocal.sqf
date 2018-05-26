/*
 * Author: esteldunedain
 * Called when a unit switched locality
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 * 1: Is local <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, true] call ACE_captives_fnc_handleLocal
 *
 * Public: No
 */


#include "script_component.hpp"

params ["_unit", "_local"];

// Make sure that if the unit is captive or surrendered it has a AnimChanged EH running ONLY on the machine that owns it
if (_local) then {

    // If the unit is handcuffed
    if (_unit getVariable [QGVAR(isHandcuffed), false]) then {
        // If the unit already has an AnimChanged EH here then there's nothing to do either
        if (_unit getVariable [QGVAR(handcuffAnimEHID), -1] != -1) exitWith {};

        // Otherwise, restart the AnimChanged EH in the new machine
        private _animChangedEHID = _unit addEventHandler ["AnimChanged", {call FUNC(handleAnimChangedHandcuffed)}];
        TRACE_2("Adding animChangedEH",_unit,_animChangedEHID);
        _unit setVariable [QGVAR(handcuffAnimEHID), _animChangedEHID];
    };

    // If the unit is surrendering
    if (_unit getVariable [QGVAR(isSurrendering), false]) then {
        // If the unit already has an AnimChanged EH here then there's nothing to do either
        if (_unit getVariable [QGVAR(surrenderAnimEHID), -1] != -1) exitWith {};

        // Otherwise, restart the AnimChanged EH in the new machine
        private _animChangedEHID = _unit addEventHandler ["AnimChanged", {call FUNC(handleAnimChangedSurrendered)}];
        TRACE_2("Adding animChangedEH",_unit,_animChangedEHID);
        _unit setVariable [QGVAR(surrenderAnimEHID), _animChangedEHID];
    };

} else {

    private _animChangedEHID = _unit getVariable [QGVAR(handcuffAnimEHID), -1];
    if (_animChangedEHID != -1) then {
        // If the unit had a AnimChanged EH for handcuffing in the old machine then remove it
        TRACE_1("Removing animChanged EH",_animChangedEHID);
        _unit removeEventHandler ["AnimChanged", _animChangedEHID];
        _unit setVariable [QGVAR(handcuffAnimEHID), -1];
    };

    _animChangedEHID = _unit getVariable [QGVAR(surrenderAnimEHID), -1];
    if (_animChangedEHID != -1) then {
        // If the unit had a AnimChanged EH for handcuffing in the old machine then remove it
        TRACE_1("Removing animChanged EH",_animChangedEHID);
        _unit removeEventHandler ["AnimChanged", _animChangedEHID];
        _unit setVariable [QGVAR(surrenderAnimEHID), -1];
    };

};
