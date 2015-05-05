/*
 * Author: Glowbal
 *
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

private "_origin";
_origin = _this select 0;
{
	["bft_addDeviceData", _x, _origin] call EFUNC(common,targetEvent);
}foreach GVAR(deviceData);
