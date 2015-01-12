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
 */
#include "\z\ace\addons\core\script_component.hpp"

private ["_unit", "_captivityReasons", "_unitCaptivityStatus", "_unitCaptivityReasons"];

_unit = _this select 0;

_captivityReasons = missionNamespace getVariable ["ACE_captivityReasons", []];

_unitCaptivityStatus = [captiveNum _unit, count _captivityReasons] call FUNC(binarizeNumber);

_unitCaptivityReasons = [];
{
  if (_unitCaptivityStatus select _forEachIndex) then {
    _unitCaptivityReasons pushBack _x;
  };
} forEach _captivityReasons;

_unitCaptivityReasons
