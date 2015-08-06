/*
 * Author: commy2
 *
 * Return the captivity status of an unit.
 *
 * Argument:
 * 0: Unit (Object)
 *
 * Return value:
 * Reasons, why the unit is a captive. An empty array is returned if the unit is not a captive (Array of Strings)
 *
 * Public: Yes
 */
#include "script_component.hpp"

private ["_captivityReasons", "_unitCaptivityStatus", "_unitCaptivityReasons"];

params ["_unit"];

_captivityReasons = missionNamespace getVariable ["ACE_captivityReasons", []];

_unitCaptivityStatus = [captiveNum _unit, count _captivityReasons] call FUNC(binarizeNumber);

_unitCaptivityReasons = [];
{
    if (_unitCaptivityStatus select _forEachIndex) then {
        _unitCaptivityReasons pushBack _x;
    };
} forEach _captivityReasons;

_unitCaptivityReasons
