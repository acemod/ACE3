/*
 * Author: commy2
 * Return the captivity status of an unit.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Captivity Reasons, empty if not captive <ARRAY>
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
