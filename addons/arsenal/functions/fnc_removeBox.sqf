#include "..\script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: Alganthe, johnb43
 * Remove arsenal from target.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Remove globally <BOOL> (default: true)
 *
 * Return Value:
 * None
 *
 * Example:
 * [_box, true] call ace_arsenal_fnc_removeBox
 *
 * Public: Yes
*/

params [["_object", objNull, [objNull]], ["_global", true, [true]]];

if (isNull _object) exitWith {};

private _id = _object getVariable QGVAR(initBoxJIP);

if (_global && {isMultiplayer} && {!isNil "_id"}) then {
    // Remove event from JIP queue
    _id call CBA_fnc_removeGlobalEventJIP;

    // Reset JIP ID
    _object setVariable [QGVAR(initBoxJIP), nil, true];

    // Remove box for everyone
    [QGVAR(removeBox), [_object, false]] call CBA_fnc_globalEvent;

    // Remove from JIP
    _object setVariable [QGVAR(virtualItems), nil, true];
} else {
    _object setVariable [QGVAR(virtualItems), nil];
    [_object, 0, ["ACE_MainActions", QGVAR(interaction)]] call EFUNC(interact_menu,removeActionFromObject);
    [QGVAR(boxRemoved), _object] call CBA_fnc_localEvent;
};

// If the arsenal is already open and not ignoring content (see FUNC(openBox)), close arsenal display
if (!isNil QGVAR(currentBox) && {GVAR(currentBox) isEqualTo _object} && {isNil QGVAR(ignoredVirtualItems)}) then {
    [LLSTRING(noVirtualItems), false, 5, 1] call EFUNC(common,displayText);
    // Delay a frame in case this is running on display open
    [{(findDisplay IDD_ace_arsenal) closeDisplay 0}] call CBA_fnc_execNextFrame;
};
