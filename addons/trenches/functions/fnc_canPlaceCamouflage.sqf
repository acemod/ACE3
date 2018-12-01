/*
* Author: chris579
* Checks if camouflage can be applied to a trench
*
* Arguments:
* 0: trench <OBJECT>
* 1: unit <OBJECT>
*
* Return Value:
* Can place <BOOL>
*
* Example:
* [TrenchObj] call ace_trenches_fnc_canPlaceCamouflage
*
* Public: No
*/
#include "script_component.hpp"

params ["_trench", "_unit"];

private _statusNumber = _trench getVariable [QGVAR(trenchCamouflageStatus), 0];
private _statusString = "";

if (_statusNumber <10) then {
  _statusString = ("CamouflagePositions0" + str(_statusNumber +1));
}else{
  _statusString = ("CamouflagePositions" + str(_statusNumber +1));
};

if !(GVAR(allowCamouflage)) exitWith {false};
if (GVAR(camouflageRequireEntrenchmentTool) && {!("ACE_EntrenchingTool" in items _unit)}) exitWith {false};

(isClass (configFile >> "CfgVehicles" >> (typeof _trench) >> _statusString)) &&
{count (getArray (configFile >> "CfgWorlds" >> worldName >> "camouflageObjects")) > 0} &&
{count (configProperties [configFile >> "CfgVehicles" >> (typeof _trench) >> _statusString]) > 0}
