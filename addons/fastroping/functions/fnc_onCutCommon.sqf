#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Function for closing doors and retracting the hook for most vanilla and older Arma helos.
 *
 * Arguments:
 * 0: Helicopter <OBJECT>
 *
 * Return Value:
 * Amount of time to wait before cutting ropes <NUMBER>
 *
 * Example:
 * [_vehicle] call ace_fastroping_fnc_onCutRopesCommon
 *
 * Public: No
 */
params ["_vehicle"];

private _fries = _vehicle getVariable [QGVAR(FRIES), objNull];
if !(isNull _fries) then {
    {_fries animate [_x, 0]} forEach ANIMS_HOOK;
    [{
        {_this animateDoor [_x, 0]} forEach ANIMS_ANIMATEDOOR;
        {_this animate [_x, 0]} forEach ANIMS_ANIMATE;
        _this setVariable [QGVAR(doorsLocked), false, true];
    }, _vehicle, 2] call CBA_fnc_waitAndExecute;

    4
} else {
    {_vehicle animateDoor [_x, 0]} forEach ANIMS_ANIMATEDOOR;
    {_vehicle animate [_x, 0]} forEach ANIMS_ANIMATE;
    _vehicle setVariable [QGVAR(doorsLocked), false, true];

    2
};
