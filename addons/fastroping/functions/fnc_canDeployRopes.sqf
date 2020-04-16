#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Checks if the unit can deploy ropes from the helicopter.
 *
 * Arguments:
 * 0: The helicopter itself <OBJECT>
 * 1: Unit occupying the helicopter <OBJECT>
 * 2: Rope classname <STRING>
 * 3: Default (show when setting disabled) <BOOL> (default: false)
 *
 * Return Value:
 * Able to deploy ropes <BOOL>
 *
 * Example:
 * [vehicle player, player, "ACE_rope36"] call ace_fastroping_fnc_canDeployRopes
 *
 * Public: No
 */
params ["_vehicle", "_player", "_ropeClass", ["_defaultOption", false]];

private _config = configFile >> "CfgVehicles" >> typeOf _vehicle;

(driver _vehicle != _player) &&
{getPos _vehicle select 2 > 2} && {
    private _enabled = getNumber (_config >> QGVAR(enabled));
    _enabled == 1 || {_enabled == 2 && {!(isNull (_vehicle getVariable [QGVAR(FRIES), objNull]))}}
} && {
    private _deploymentStage = _vehicle getVariable [QGVAR(deploymentStage), 0];
    if (getText (_config >> QGVAR(onPrepare)) == "") then { _deploymentStage == 0 } else { _deploymentStage == 2 };
} && {
    (_defaultOption && {!GVAR(requireRopeItems)}) || {(_ropeClass in (_player call EFUNC(common,uniqueItems))) || {_ropeClass in (itemCargo _vehicle)}}
}
