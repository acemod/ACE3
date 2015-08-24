/*
 * Author: commy2
 * Closes the current dialog if the target moves, changes vehicle etc.
 *
 * Arguments:
 * 0: Target unit <OBJECT>
 * 1: Ignore the unit being dead (default: false) <BOOL>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_target", "_ignoreDead"];
private["_inVehicle", "_position", "_vehiclePlayer", "_vehicleTarget","_fnc_check"];

if (isNil "_ignoreDead") then {_ignoreDead = false};

_vehicleTarget = vehicle _target;
_vehiclePlayer = vehicle ACE_player;
_inVehicle = _target != _vehicleTarget;

_position = getPosASL _target;

_fnc_check = {
    // either unit changed vehicles
    if (_vehiclePlayer != vehicle ACE_player) exitWith {True};
    if (_vehicleTarget != vehicle _target) exitWith {True};

    // target died
    if (!alive _target && {!_ignoreDead}) exitWith {True};

    // player fell unconscious
    if (ACE_player getVariable ["ACE_isUnconscious", False]) exitWith {True};

    // target moved (outside of vehicle)
    (!_inVehicle && {getPosASL _target distanceSqr _position > 1})
};
[{
    params ["_args", "_idPFH"];
    _args params ["_fnc_check"];
    if (call _fnc_check) then {
        closeDialog 0;
        call EFUNC(interaction,hideMenu);
    };
    if ((isNil QEGVAR(interaction,MainButton) && !dialog) || {!isNull (uiNamespace getVariable [QGVAR(dlgDisableMouse), displayNull])}) then {
        [_idPFH] call CBA_fnc_removePerFrameHandler;
    };

}, 0, [_fnc_check]] call CBA_fnc_addPerFrameHandler;
