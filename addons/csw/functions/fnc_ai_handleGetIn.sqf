#include "..\script_component.hpp"
/*
 * Author: LinkIsGrim
 * Handles AI GetIn on an empty CSW.
 *
 * Arguments:
 * GetIn EH
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params ["_vehicle", "", "_gunner"];
TRACE_2("getInEH:",_vehicle,_gunner);

if (someAmmo _vehicle) exitWith {};
if ((!local _gunner) || {[_gunner] call EFUNC(common,isPlayer)}) exitWith {};

[_vehicle, _gunner] call FUNC(ai_reload);
