/*
 * Author: TCVM
 * Deploys the CSW Tripod after it has been moved
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ace_csw_fnc_tripodDeployConfirm
 *
 * Public: No
 */
#include "script_component.hpp"

params["_player", "_key"];

if ((_key != 0) || {isNull GVAR(cswTripod)}) exitWith {}; 

[_player, "forceWalk", "ACE_csw", false] call EFUNC(common,statusEffect_set);

detach GVAR(cswTripod);

private _tripodPos = getPosATL GVAR(cswTripod);
_tripodPos set[2, 0];

GVAR(cswTripod) setVectorUp (surfaceNormal _tripodPos);
GVAR(cswTripod) setPosATL _tripodPos;

call EFUNC(interaction,hideMouseHint);

[_player, "DefaultAction", _player getVariable [QGVAR(MoveTripod), -1]] call EFUNC(common,removeActionEventHandler);

// We apply a velocity to make 100% sure the physics are enabled
GVAR(cswTripod) setVelocity [0, 0, -0.01];

GVAR(cswTripod) = objNull;

