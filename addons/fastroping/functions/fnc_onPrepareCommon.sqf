/*
 * Author: BaerMitUmlaut
 * Function for opening doors and extending the hook for most vanilla and older Arma helos.
 *
 * Arguments:
 * 0: Helicopter <OBJECT>
 *
 * Return Value:
 * Amount of time to wait before deploying ropes <NUMBER>
 *
 * Example:
 * [_vehicle] call ace_fastroping_fnc_onDeployRopesCommon
 *
 * Public: No
 */

#include "script_component.hpp"
params ["_vehicle"];

private _waitTime = 2;

{_vehicle animateDoor [_x, 1]} forEach ANIMS_ANIMATEDOOR;
{_vehicle animate [_x, 1]} forEach ANIMS_ANIMATE;

_vehicle setVariable [QGVAR(doorsLocked), true, true];

private _fries = _vehicle getVariable [QGVAR(FRIES), objNull];
if !(isNull _fries) then {
    [{
        {_this animate [_x, 1]} forEach ANIMS_HOOK;
    }, _fries, 2] call CBA_fnc_waitAndExecute;
    _waitTime = 4;
};

_waitTime
