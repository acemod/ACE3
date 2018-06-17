/*
 * Author: commy2
 * Add a map marker creation event handler.
 *
 * Arguments:
 * 0: Code to execute <CODE|STRING>
 *
 * Return Value:
 * ID of the event script (used to remove it later) <NUMBER>
 *
 * Example:
 * ["bob"] call ace_common_fnc_addMapMarkerCreatedEventHandler
 *
 * Public: Yes
 */
#include "script_component.hpp"

ACE_DEPRECATED(QFUNC(addMapMarkerCreatedEventHandler),"3.14.0","CBA_fnc_addMarkerEventHandler");

params ["_code"];

if (_code isEqualType "") then {_code = compile _code};
["created", _code] call CBA_fnc_addMarkerEventHandler;
