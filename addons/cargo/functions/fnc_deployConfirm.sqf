#include "script_component.hpp"
/*
 * Author: Smith
 * Confirms object to unload deployment.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ACE_player] call ace_cargo_fnc_deployConfirm
 *
 * Public: No
 */

if (!GVAR(canDeploy)) exitWith{};

params ["_unit"];

// enable running again
[_unit, "forceWalk", QUOTE(ADDON), false] call EFUNC(common,statusEffect_set);
[_unit, "blockThrow", QUOTE(ADDON), false] call EFUNC(common,statusEffect_set);

// delete placement dummy and unload real item from cargo at dummy position
[{
    if (isNull GVAR(itemPreviewObject)) exitWith {};

    params ["_unit", "_item"];

    private _position = ASLToAGL (getPosASL GVAR(itemPreviewObject));
    private _direction = getDir GVAR(itemPreviewObject);

    deleteVehicle GVAR(itemPreviewObject);

    private _size = [_item] call FUNC(getSizeItem);

    [
        GVAR(loadTimeCoefficient) * _size,
        [_item, GVAR(interactionVehicle), ACE_player, [_position, _direction]],
        {TRACE_1("unload finish",_this); ["ace_unloadCargo", _this select 0] call CBA_fnc_localEvent},
        {TRACE_1("unload fail",_this);},
        localize LSTRING(UnloadingItem),
        {
            (_this select 0) params ["_item", "_target", "_player"];

            (alive _target)
            && {locked _target < 2}
            && {([_player, _target] call EFUNC(interaction,getInteractionDistance)) < MAX_LOAD_DISTANCE}
            && {_item in (_target getVariable [QGVAR(loaded), []])}
        },
        ["isNotSwimming"]
    ] call EFUNC(common,progressBar);

    GVAR(itemPreviewObject) = objNull;
}, [_unit, GVAR(selectedItem)], 1] call CBA_fnc_waitAndExecute;

// remove deployment pfh
[GVAR(deployPFH)] call CBA_fnc_removePerFrameHandler;
GVAR(deployPFH) = -1;

// remove mouse button actions
call EFUNC(interaction,hideMouseHint);

[_unit, "DefaultAction", _unit getVariable [QGVAR(Deploy), -1]] call EFUNC(common,removeActionEventHandler);

_unit setVariable [QGVAR(isDeploying), false, true];
