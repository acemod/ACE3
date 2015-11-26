/*
 * Author: BaerMitUmlaut
 * Function for closing doors and retracting the hook for most vanilla helos.
 *
 * Arguments:
 * 0: Helicopter <OBJECT>
 *
 * Return Value:
 * Amount of time to wait before deploying ropes.
 *
 * Example:
 * [_vehicle] call ace_fastroping_onDeployRopesCommon
 *
 * Public: No
 */

#include "script_component.hpp"
params ["_vehicle"];
private ["_fries"];

_vehicle animateDoor ["door_R", 1];
_vehicle animateDoor ["door_L", 1];

/*_fries = _vehicle getVariable [QGVAR(FRIES), objNull];
if !(isNull _fries) then {
    [{
        _this animate ["extendHookRight", 1];
        _this animate ["extendHookLeft", 1];
    }, _fries, 2] call EFUNC(common,waitAndExecute);
};*/

[{
    private ["_fries"];
    _fries = _this getVariable [QGVAR(FRIES), objNull];
    _fries animate ["extendHookRight", 1];
    _fries animate ["extendHookLeft", 1];
}, _vehicle, 2] call EFUNC(common,waitAndExecute);

4
