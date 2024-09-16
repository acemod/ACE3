#include "..\script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet, Ruthberg, commy2, Smith
 * Confirms unloading when deploying.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * player call ace_cargo_fnc_deployConfirm
 *
 * Public: No
 */

if (GVAR(deployPFH) == -1) exitWith {};

params ["_unit"];

// Delete placement dummy and unload real item from cargo at dummy position
if (!isNull GVAR(itemPreviewObject) && {[GVAR(selectedItem), GVAR(interactionVehicle), _unit, false, true] call FUNC(canUnloadItem)}) then {
    // Position is AGL for unloading event
    private _position = ASLToAGL getPosASL GVAR(itemPreviewObject);
    private _direction = getDir GVAR(itemPreviewObject);
    private _duration = [GVAR(selectedItem), false] call FUNC(getDelayItem);

    // If unload time is 0, don't show a progress bar
    if (_duration <= 0) exitWith {
        ["ace_unloadCargo", [GVAR(selectedItem), GVAR(interactionVehicle), _unit, [_position, _direction]]] call CBA_fnc_localEvent;
    };

    [
        _duration,
        [GVAR(selectedItem), GVAR(interactionVehicle), _unit, [_position, _direction]],
        {
            TRACE_1("deploy finish",_this);

            ["ace_unloadCargo", _this select 0] call CBA_fnc_localEvent;
        },
        {
            TRACE_1("deploy fail",_this);
        },
        format [LLSTRING(unloadingItem), [GVAR(selectedItem), true] call FUNC(getNameItem), getText (configOf GVAR(interactionVehicle) >> "displayName")],
        {
            (_this select 0) params ["_item", "_vehicle", "_unit"];

            [_item, _vehicle, _unit, false, true] call FUNC(canUnloadItem) // don't check for a suitable unloading position when deploying
        },
        ["isNotSwimming"]
    ] call EFUNC(common,progressBar);
};

// Cleanup EHs and preview object
_unit call FUNC(deployCancel);
