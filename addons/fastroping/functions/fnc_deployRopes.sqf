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

#include "script_component.hpp"

#define HELPER "AGM_FastRoping_Helper"
#define ROPELENGTH 35
#define OFFSET 2

private ["_vehicle", "_ropePositions", "_ropes", "_occupied", "_pos"];
_vehicle = _this select 0;

// pass the function over to machine where helicopter is local
if !(local _vehicle) exitWith {
  [[_vehicle], QUOTE(FUNC(deployRopes)), _vehicle] call EFUNC(common,execRemoteFnc);
};

_ropePositions = getArray (configFile >> "CfgVehicles" >> typeOf _vehicle >> QGVAR(positions));
_ropes = [_ropePositions, {[objNull, objNull, objNull]}] call EFUNC(common,map);
_occupied = [_ropePositions, {False}] call EFUNC(common,map);

for "_i" from 0 to ((count _ropes) - 1) do {
    _pos = _ropePositions select _i;
    _ropes set [_i, [_vehicle, _pos] call FUNC(createRope)];
};

_vehicle setVariable [QGVAR(ropesDeployed), True, True];
_vehicle setVariable [QGVAR(ropes), _ropes, True];
_vehicle setVariable [QGVAR(ropesOccupied), _occupied, True];
