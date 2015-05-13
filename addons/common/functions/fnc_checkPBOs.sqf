/*
 * Author: commy2
 *
 * Used to execute the checkPBOs module without placing the module. Don't use this together with the module.
 *
 * Argument:
 * 0: Mode (Number)
 *   0:  Warn once
 *   1:  Warn permanently
 *   2:  Kick
 * 1: Check all PBOs? (Boolean, optional default: "[]")
 * 2: Whitelist (String, optinal default: false)
 *
 * Return value:
 * None.
 */
#include "script_component.hpp"

private ["_mode", "_checkAll", "_whitelist", "_logic"];

_this resize 3;

_mode = _this select 0;
_checkAll = _this select 1;
_whitelist = _this select 2;

if (isNil "_checkAll") then {
  _checkAll = false;
};

if (isNil "_whitelist") then {
  _whitelist = "[]";
};

_logic = "Logic" createVehicleLocal [0,0,0];
_logic setVariable ["Action", _mode];
_logic setVariable ["CheckAll", _checkAll];
_logic setVariable ["Whitelist", _whitelist];
[_logic, [], true] call FUNC(moduleCheckPBOs);
deleteVehicle _logic;
