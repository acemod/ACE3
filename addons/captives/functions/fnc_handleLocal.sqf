/*
 * Author: esteldunedain
 * Called when a unit switched locality
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 * 1: Is local <BOOL>
 *
 * ReturnValue:
 * None
 *
 * Public: No
 */


#include "script_component.hpp"

params ["_unit", "_local"];

// Make sure that if the unit is captive it has a AnimChanged EH running ONLY on the machine that owns it
if (_local) then {
    // If the unit is not handcuffed there's nothing to do
    if !(_unit getVariable [QGVAR(isHandcuffed), false]) exitWith {};
    // If the unit already has an AnimChanged EH here then there's nothing to do either
    if (_unit getVariable [QGVAR(handcuffAnimEHID), -1] != -1) exitWith {};

    // Otherwise, restart the AnimChanged EH in the new machine
    _animChangedEHID = _unit addEventHandler ["AnimChanged", DFUNC(handleAnimChanged)];
    TRACE_2("Adding animChangedEH",_unit,_animChangedEHID);
    _unit setVariable [QGVAR(handcuffAnimEHID), _animChangedEHID];
} else {
    private _animChangedEHID = _unit getVariable [QGVAR(handcuffAnimEHID), -1];
    // If the unit didn't have an AnimChanged EH here, do nothing
    if (_animChangedEHID == -1) exitWith {};

    // If the unit had a AnimChanged EH in the old machine then remove it
    TRACE_1("Removing animChanged EH",_animChangedEHID);
    _unit removeEventHandler ["AnimChanged", _animChangedEHID];
    _unit setVariable [QGVAR(handcuffAnimEHID), -1];
};
