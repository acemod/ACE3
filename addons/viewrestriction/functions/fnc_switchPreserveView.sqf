#include "script_component.hpp"
/*
 * Author: Dystopian
 * Controls View Preserving state.
 *
 * Arguments:
 * 0: Enabled <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * true call ace_viewrestriction_fnc_switchPreserveView
 *
 * Public: No
 */

params ["_enabled"];

if (!_enabled || {XGVAR(mode) > 0}) exitWith {
    if (isNil QGVAR(preserveViewCameraViewEH)) exitWith {};
    ["cameraView", GVAR(preserveViewCameraViewEH)] call CBA_fnc_removePlayerEventHandler;
    ["vehicle", GVAR(preserveViewVehicleEH)] call CBA_fnc_removePlayerEventHandler;
    GVAR(preserveViewCameraViewEH) = nil;
    GVAR(preserveViewVehicleEH) = nil;
};

GVAR(preserveViewCameraViewEH) = ["cameraView", {
    params ["_player", "_cameraView"];
    if !([_cameraView, cameraOn] call FUNC(canChangeCamera)) exitWith {};

    private _vehicle = vehicle _player;
    private _vehicleClass = {if (_vehicle isKindOf _x) exitWith {_x}} forEach ["CAManBase", "LandVehicle", "Air", "Ship", "All"];
    private _varName = QXGVAR(preserveView) + _vehicleClass;
    if !(_cameraView isEqualTo (profileNamespace getVariable [_varName, ""])) then {
        profileNamespace setVariable [_varName, _cameraView];
    };
}] call CBA_fnc_addPlayerEventHandler;

GVAR(preserveViewVehicleEH) = ["vehicle", {
    params ["_player", "_vehicle"];
    private _cameraView = cameraView;
    if !([_cameraView, cameraOn, false] call FUNC(canChangeCamera)) exitWith {};

    private _vehicleClass = {if (_vehicle isKindOf _x) exitWith {_x}} forEach ["CAManBase", "LandVehicle", "Air", "Ship", "All"];
    private _savedView = profileNamespace getVariable (QXGVAR(preserveView) + _vehicleClass);
    if (!isNil "_savedView" && {!(_cameraView isEqualTo _savedView)}) then {
        _vehicle switchCamera _savedView;
    };
}, true] call CBA_fnc_addPlayerEventHandler;
