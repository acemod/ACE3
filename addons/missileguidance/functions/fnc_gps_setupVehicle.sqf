#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Adds interaction menu actions to configure GPS bombs
 *
 * Arguments:
 * 0: Player <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player] call ace_missileguidance_fnc_gps_setupVehicle
 *
 * Public: No
 */
params ["_player"];
private _vehicle = vehicle _player;

if (_vehicle getVariable [QGVAR(gps_actionsAdded), false]) exitWith {};
_vehicle setVariable [QGVAR(gps_actionsAdded), true];
TRACE_2("adding gps action",_player,typeOf _vehicle);

private _condition = {
    params ["_target", "_player"]; // _player may be the UAV AI

    private _turretPath = _target unitTurret _player;;
    private _hasJDAM = (_target weaponsTurret _turretPath) findIf {
        private _weapon = _x;
        GVAR(gps_weapons) getOrDefaultCall [_weapon, {
            (getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines")) findIf {
                private _ammo = getText (configFile >> "CfgMagazines" >> _x >> "ammo");
                private _ammoAttackProfiles = getArray (configFile >> "CfgAmmo" >> _ammo >> QUOTE(ADDON) >> "attackProfiles");
                "JDAM" in _ammoAttackProfiles
            } > -1
        }, true]
    } > -1;
    _hasJDAM
};

private _statement = {
    createDialog QGVAR(gpsAttackOptionsUI);
};

private _action = [QUOTE(ADDON), "JDAM settings", "", _statement, _condition] call EFUNC(interact_menu,createAction);
[_vehicle, 1, ["ACE_SelfActions"], _action] call EFUNC(interact_menu,addActionToObject);
