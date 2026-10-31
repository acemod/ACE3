#include "..\script_component.hpp"
/*
 * Author: kymckay, Cathode88
 * Sets whether an object can be loaded as ViV (BI Vehicle-in-Vehicle) cargo using ACE Cargo framework. DOES NOT BLOCK OTHER METHODS. Has global effect.
 * true: Forces the "Load to ViV" action onto the object, even if it isn't otherwise eligible.
 * false: Hides the "Load to ViV" action for the object, even if it is otherwise eligible.
 *
 * Arguments:
 * 0: Object <OBJECT> (default: objNull)
 * 1: Can be loaded as ViV <BOOL> (default: nil)
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, true] call ace_cargo_fnc_setCanLoadViv
 *
 * Public: Yes
 */

params [
    ["_object", objNull, [objNull]],
    ["_canLoad", nil, [true]]
];
TRACE_2("setCanLoadViv",_object,_canLoad);

if (isNull _object || {isNil "_canLoad"}) exitWith {};

_object setVariable [QGVAR(canLoadViv), _canLoad, true];

// Disabling needs no registration. Action condition reads the variable
if (!_canLoad) exitWith {};

// Actions should be added for all future JIP players too
private _jipID = format [QGVAR(vivJipID_%1), hashValue _object];
[QGVAR(initObjectViv), _object, _jipID] call CBA_fnc_globalEventJIP;

// Remove from JIP queue if object is deleted
if !(_object getVariable [QGVAR(setCanLoadVivRemoveJip), false]) then {
    [_jipID, _object] call CBA_fnc_removeGlobalEventJIP;

    _object setVariable [QGVAR(setCanLoadVivRemoveJip), true, true];
};
