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
if (!isNull GVAR(itemPreviewObject) && {[GVAR(selectedItem), GVAR(interactionVehicle), _unit, false, true, GVAR(isViv)] call FUNC(canUnloadItem)}) then {
    // Position is AGL for unloading event
    private _position = ASLToAGL getPosASL GVAR(itemPreviewObject);
    private _direction = getDir GVAR(itemPreviewObject);
    private _duration = GVAR(loadTimeCoefficient) * (GVAR(selectedItem) call FUNC(getSizeItem));

    // If unload time is 0, don't show a progress bar
    if (_duration <= 0) exitWith {
        if (GVAR(isViv)) then {
            objNull setVehicleCargo GVAR(selectedItem);

            GVAR(selectedItem) setDir _direction;
            GVAR(selectedItem) setPosASL _position;
        } else {
            ["ace_unloadCargo", [GVAR(selectedItem), GVAR(interactionVehicle), _unit, [_position, _direction]]] call CBA_fnc_localEvent;
        };
    };

    [
        _duration,
        [GVAR(selectedItem), GVAR(interactionVehicle), _unit, [_position, _direction], GVAR(isViv)],
        {
            TRACE_1("deploy finish",_this);

            (_this select 0) params ["_item", "", "", "_posAndDir"];

            // Is ViV
            // Don't want to pass the isViv parameter to the ace_unloadCargo EH
            if ((_this select 0) deleteAt 4) then {
                objNull setVehicleCargo _item;

                _item setDir (_posAndDir select 1);
                _item setPosASL (AGLtoASL (_posAndDir select 0));
            } else {
                ["ace_unloadCargo", _this select 0] call CBA_fnc_localEvent;
            };
        },
        {
            TRACE_1("deploy fail",_this);
        },
        format [LLSTRING(unloadingItem), [GVAR(selectedItem), true] call FUNC(getNameItem), getText (configOf GVAR(interactionVehicle) >> "displayName")],
        {
            (_this select 0) params ["_item", "_vehicle", "_unit", "", "_isViv"];

            [_item, _vehicle, _unit, false, true, _isViv] call FUNC(canUnloadItem) // Don't check for a suitable unloading position when deploying
        },
        ["isNotSwimming"]
    ] call EFUNC(common,progressBar);
};

// Cleanup EHs and preview object
_unit call FUNC(deployCancel);
