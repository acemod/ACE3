#include "..\script_component.hpp"
/*
 * Author: kymckay (based on muteUnit)
 * Globally hides a unit. This allows the handling of more than one reason to hide an object globally.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Reason to hide the unit <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ACE_Player, "SpectatorMode"] call ace_common_fnc_hideUnit
 *
 * Public: Yes
 */

params ["_unit", "_reason"];

if (isNull _unit) exitWith {};

private _setHiddenReasons = _unit getVariable [QGVAR(setHiddenReasons), []];

if !(_reason in _setHiddenReasons) then {
    _setHiddenReasons pushBack _reason;
    _unit setVariable [QGVAR(setHiddenReasons), _setHiddenReasons, true];
};

if !(isObjectHidden _unit) then {
    [QGVAR(hideObjectGlobal), [_unit, true]] call CBA_fnc_serverEvent;
};
