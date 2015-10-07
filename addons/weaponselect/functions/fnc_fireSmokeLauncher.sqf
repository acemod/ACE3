/*
 * Author: commy2
 * Fire Vehicle Smoke Launcher.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [vehicle player] call ace_weaponselect_fnc_fireSmokeLauncher
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_vehicle"];

private ["_turret", "_weapons"];

_turret = [_vehicle] call EFUNC(common,getTurretCommander);

_weapons = _vehicle weaponsTurret _turret;

if (
    count _weapons > 1
    || {count _weapons > 0 && {!(_weapons select 0 in ["SmokeLauncher", "BWA3_SmokeLauncher"])}}  // @todo somebody might use custom smoke launcher weapons aswell, maybe ...
) then {
    //This doesn't work reliably for vehilces with additional weapons for the commander. Select smoke launcher instead.

    // avoid infinite loop
    if !("SmokeLauncher" in _weapons) exitWith {};

    private "_index";
    _index = 0;
    while {
        _vehicle currentWeaponTurret _turret != "SmokeLauncher"
    } do {
        [commander _vehicle, _vehicle, _index] call FUNC(selectWeaponVehicle);
        _index = _index + 1;
    };

} else {
    // fire away!

    private "_logic";
    _logic = createGroup sideLogic createUnit ["Logic", [0,0,0], [], 0, "NONE"];

    _logic action ["useWeapon", _vehicle, commander _vehicle, 0];

    deleteVehicle _logic;
};
