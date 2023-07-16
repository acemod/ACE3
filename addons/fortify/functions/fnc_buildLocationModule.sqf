#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Handles build location module
 *
 * Arguments:
 * 0: The module logic <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [logic] call ace_fortify_fnc_buildLocationModule
 *
 * Public: No
 */

params ["_logic"];
TRACE_1("buildLocations",_logic);

private _area = _logic getvariable ["objectArea",[0,0,0,false,0]]; // seems to be set via the canSetArea config
if ((_area param [0, 0]) == 0) exitWith {WARNING_1("Bad size? %1",_area);};
private _locationArray = [_logic];
_locationArray append _area;

TRACE_1("Adding build location",_locationArray);
GVAR(locations) pushBack _locationArray;
