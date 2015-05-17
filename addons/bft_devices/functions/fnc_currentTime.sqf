/*
 * Author: Gundy
 *
 * Description:
 *   Retrieve current in-game time in HH:MM format
 *
 * Arguments:
 *   NONE
 *
 * Return Value:
 *   Current in-game time in format "HH:MM" <STRING>
 *
 * Example:
 *   [] call ace_bft_devices_currentTime;
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_date","_hour","_min"];

_date = date;
_hour = _date select 3;
_min = _date select 4;
if (_hour < 10) then {_hour = format ["0%1", _hour];};
if (_min < 10) then {_min = format ["0%1", _min];};

format ["%1:%2", _hour, _min]