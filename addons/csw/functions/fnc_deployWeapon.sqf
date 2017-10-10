/*
 * Author: TCVM
 * Deploys the current CSW
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ace_csw_fnc_deployWeapon
 *
 * Public: No
 */
#include "script_component.hpp"

params["_tripod", "_player"];

private _assembledClassname = getText(configfile >> "CfgVehicles" >> (backpack _player) >> QGVAR(cswOptions) >> "ace_csw_assembleTo");

private _csw = createVehicle[_assembledClassname, [0, 0, 0], [], 0, "NONE"];

private _tripodPos = getPosATL _tripod;
private _tripodDir = getDir _tripod;

_tripodPos set[2, (_tripodPos select 2) + 0.5];

deleteVehicle _tripod;
_csw setPosATL(_tripodPos);
_csw setDir _tripodDir;
_csw setVectorUp (surfaceNormal _tripodPos);

// Set the ammo to zero so no config mess-ups will allow for infinite ammo
_csw setVehicleAmmo 0;

removeBackpackGlobal _player;