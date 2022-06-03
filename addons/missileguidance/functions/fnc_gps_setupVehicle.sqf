#include "script_component.hpp"
/*
 * Author: Dani (TCVM)
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
private _turretPath = [-1];

if (_vehicle getVariable [QGVAR(gps_actionsAdded), false]) exitWith {};
_vehicle setVariable [QGVAR(gps_actionsAdded), true];

private _condition = {
    params ["_target", "_player"];
    
    private _turretPath = if (ACE_player == (driver _target)) then {[-1]} else {ACE_player call CBA_fnc_turretPath};
    private _hasJDAM = false;
    {
        private _magazines = getArray (configFile >> "CfgWeapons" >> _x >> "magazines");
        {
            private _ammo = getText (configFile >> "CfgMagazines" >> _x >> "ammo");
            private _ammoAttackProfiles = getArray (configFile >> "CfgAmmo" >> _ammo >> QUOTE(ADDON) >> "attackProfiles");
            _hasJDAM = "JDAM" in _ammoAttackProfiles;

            if (_hasJDAM) exitWith { true };
        } forEach _magazines;

        if (_hasJDAM) exitWith { true };
    } forEach (_target weaponsTurret _turretPath);

    _hasJDAM
};

private _statement = {
    createDialog QGVAR(gpsAttackOptionsUI);
};

private _action = [QUOTE(ADDON), "JDAM settings", "", _statement, _condition] call EFUNC(interact_menu,createAction);
[_vehicle, 1, ["ACE_SelfActions"], _action] call EFUNC(interact_menu,addActionToObject);

