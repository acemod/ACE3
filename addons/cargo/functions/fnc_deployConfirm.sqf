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

if (!GVAR(canDeploy) || {GVAR(deployPFH) == -1}) exitWith {};

// Remove deployment pfh
GVAR(deployPFH) call CBA_fnc_removePerFrameHandler;
GVAR(deployPFH) = -1;

params ["_unit"];

// Enable running again
[_unit, "forceWalk", QUOTE(ADDON), false] call EFUNC(common,statusEffect_set);
[_unit, "blockThrow", QUOTE(ADDON), false] call EFUNC(common,statusEffect_set);

// Delete placement dummy and unload real item from cargo at dummy position
if (!isNull GVAR(itemPreviewObject)) then {
    // Position is AGL for unloading event
    private _position = ASLToAGL getPosASL GVAR(itemPreviewObject);
    private _direction = getDir GVAR(itemPreviewObject);

    deleteVehicle GVAR(itemPreviewObject);

    [
        GVAR(loadTimeCoefficient) * (GVAR(selectedItem) call FUNC(getSizeItem)),
        [GVAR(selectedItem), GVAR(interactionVehicle), _unit, [_position, _direction]],
        {
            TRACE_1("unload finish",_this);

            ["ace_unloadCargo", _this select 0] call CBA_fnc_localEvent;
        },
        {
            TRACE_1("unload fail",_this);
        },
        LLSTRING(unloadingItem),
        {
            (_this select 0) params ["_item", "_target", "_player"];

            (alive _target) &&
            {locked _target < 2} &&
            {_item call FUNC(getSizeItem) >= 0} &&
            {([_player, _target] call EFUNC(interaction,getInteractionDistance)) < MAX_LOAD_DISTANCE} &&
            {_item in (_target getVariable [QGVAR(loaded), []])}
        },
        ["isNotSwimming"]
    ] call EFUNC(common,progressBar);
};

// Remove mouse button actions
call EFUNC(interaction,hideMouseHint);

[_unit, "DefaultAction", _unit getVariable [QGVAR(deploy), -1]] call EFUNC(common,removeActionEventHandler);
_unit setVariable [QGVAR(deploy), -1];

_unit setVariable [QGVAR(isDeploying), false, true];
