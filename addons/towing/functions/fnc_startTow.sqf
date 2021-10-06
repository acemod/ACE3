#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Start rope attach PFH
 *
 * Arguments:
 * 0: Unit wanting to start towing <OBJECT>
 * 1: Vehicle to tow from <OBJECT>
 * 2: Rope Classname <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject, "ACE_rope3"] call ace_towing_fnc_startTow
 *
 * Public: No
 */
params ["_unit", "_target", "_ropeClass"];

GVAR(attachHelper) = "Sign_Sphere10cm_F" createVehicleLocal [0, 0, 0];
[_unit] call EFUNC(weaponselect,putWeaponAway);

private _ropeLength = getNumber (configFile >> "CfgWeapons" >> _ropeClass >> QEGVAR(logistics_rope,length));
if (_ropeLength == 0) then {
    _ropeLength = 3;
};

_unit removeItem _ropeClass;

GVAR(canAttach) = false;
[LINKFUNC(towStateMachinePFH), 0, [TOW_STATE_ATTACH_PARENT, _unit, _target, objNull, _ropeLength, _ropeClass]] call CBA_fnc_addPerFrameHandler;

