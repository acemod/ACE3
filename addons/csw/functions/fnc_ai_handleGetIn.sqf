#include "..\script_component.hpp"
/*
 * Author: LinkIsGrim
 * Handles AI GetIn on an empty CSW
 *
 * Arguments:
 * GetIn EH
 *
 * Return Value:
 * None
 *
 * Public: No
 */
params ["_vehicle", "_role", "_gunner", "_turret"];
TRACE_3("getInEH:",_vehicle,_role,_gunner);

if ((!local _gunner) || {[_gunner] call EFUNC(common,isPlayer)}) exitWith {};
if (someAmmo _vehicle) exitWith {};

[_vehicle, _gunner] call FUNC(ai_reload);
