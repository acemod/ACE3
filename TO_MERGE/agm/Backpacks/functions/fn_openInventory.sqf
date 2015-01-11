/*
 * Author: bux, commy2
 *
 * Handle the open inventory event. Don't open the inventory if it's locked and display message.
 * 
 * Argument:
 * Input from "InventoryOpened" eventhandler
 * 
 * Return value:
 * Don't open the inventory dialog? (Bool)
 */

private ["_target", "_isBackpack", "_isLocked", "_return"];

_target = _this select 1;

_isBackpack = [_target] call AGM_Backpacks_fnc_isBackpack;
_isLocked = _target getVariable ["AGM_LockedInventory", false];

_return = false;
if (_isBackpack) then {
  // target is a backpack
  private "_unit";
  _unit = [_target] call AGM_Backpacks_fnc_getBackpackAssignedUnit;

  if (!alive _unit || {_unit getVariable ["AGM_isUnconscious", false]}) exitWith {};

  if (_isLocked) then {
    // target is a locked backpack
    [format [localize "STR_AGM_Backpacks_BackpackLocked", [_unit] call AGM_Core_fnc_getName]] call AGM_Core_fnc_displayTextStructured;
    _return = true;
  } else {
    // target is a not-locked backpack
    if (_unit getVariable ["AGM_LockedInventory", false]) then {
      [localize "STR_AGM_Backpacks_InventoryLocked"] call AGM_Core_fnc_displayTextStructured;
      _return = true;
    };
  };
} else {
  // target is not a backpack
  if (_isLocked) then {
    [localize "STR_AGM_Backpacks_InventoryLocked"] call AGM_Core_fnc_displayTextStructured;
    _return = true;
  };
};
_return
