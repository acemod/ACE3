/*
 * Author: KoffeinFlummi
 *
 * Loads the carried/dragged unit into a vehicle for transport.
 *
 * Arguments:
 * 0: The unit that does the loading
 * 1: The vehicle
 *
 * Return Value:
 * -
 */

private ["_unit", "_target", "_vehicle"];

_unit = _this select 0;
_vehicle = _this select 1;
_target = _unit getVariable ["AGM_Transporting", objNull];

if (count _this < 3 and {!(local _target)}) exitWith {
  [_this + [_target], "AGM_Medical_fnc_loadIntoVehicle", _target] call AGM_Core_fnc_execRemoteFnc;
};

if (count _this > 2) then {
  _target = _this select 2;
};

_unit setVariable ["AGM_Transporting", objNull, True];

detach _target;
_target moveInCargo _vehicle;
_target assignAsCargo _vehicle;

[_unit, "", 2, True] call AGM_Core_fnc_doAnimation;
_target spawn {
  sleep 0.5;
  _this setVariable ["AGM_OriginalAnim", animationState _this, True];
  [
    _this,
    ((configFile >> "CfgMovesMaleSdr" >> "States" >> animationState _this >> "interpolateTo") call BIS_fnc_getCfgData) select 0,
    2,
    True
  ] call AGM_Core_fnc_doAnimation;
};

_unit removeWeapon "AGM_FakePrimaryWeapon";
_unit setVariable ["AGM_canTreat", True, True];
_target setVariable ["AGM_isTreatable", True, True];
