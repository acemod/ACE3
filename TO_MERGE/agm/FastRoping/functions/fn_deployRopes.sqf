/*
 * Author: KoffeinFlummi
 *
 * Deploys the ropes necessary for fast roping.
 *
 * Arguments:
 * 0: The helicopter
 *
 * Return Value:
 * None
 */

#define HELPER "AGM_FastRoping_Helper"
#define ROPELENGTH 35
#define OFFSET 2

_vehicle = _this select 0;

if !(local _vehicle) exitWith {
  [[_vehicle], "AGM_FastRoping_fnc_deployRopes", _vehicle] call AGM_Core_fnc_execRemoteFnc;
};

_ropePositions = getArray (configFile >> "CfgVehicles" >> typeOf _vehicle >> "AGM_FastRoping_Positions");
_ropes = [_ropePositions, {[objNull, objNull, objNull]}] call AGM_Core_fnc_map;
_occupied = [_ropePositions, {False}] call AGM_Core_fnc_map;

for "_i" from 0 to ((count _ropes) - 1) do {
  _ropePositions = getArray (configFile >> "CfgVehicles" >> typeOf _vehicle >> "AGM_FastRoping_Positions");
  _pos = _ropePositions select _i;

  _ropes set [_i, [_vehicle, _pos] call AGM_FastRoping_fnc_createRope];
};

_vehicle setVariable ["AGM_RopesDeployed", True, True];
_vehicle setVariable ["AGM_Ropes", _ropes, True];
_vehicle setVariable ["AGM_RopesOccupied", _occupied, True];
