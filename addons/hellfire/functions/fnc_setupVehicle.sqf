/*
 * Author: PabstMirror
 * Adds interaction menu actions to switch the firemode to a vehicle.
 * Also adds a Laser Designator if vehicle is configured for one.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Player's Turret Path <ARRAY>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [(vehicle player), [0]] call ace_hellfire_fnc_setupVehicle
 *
 * Public: No
 */
// #define DEBUG_MODE_FULL
#include "script_component.hpp"

params ["_vehicle", "_turretPath"];
TRACE_2("setupVehicle",_vehicle,_turretPath);

// Add laser if vehicle is configured for one:
if ((getNumber (configFile >> "CfgVehicles" >> (typeOf _vehicle) >> QGVAR(addLaserDesignator))) == 1) then {  
    [{
        params ["_vehicle", "_turretPath"];
        TRACE_3("checking for laser",_vehicle,_turretPath,_vehicle turretLocal _turretPath);
        if (!alive _vehicle) exitWith {};
        if (!(_vehicle turretLocal _turretPath)) then {WARNING("Turret not local");};
        private _hasLaser = false;
        {
            // Most addons just use "Laserdesignator_mounted", but this should cover custom ones
            if ((getNumber (configFile >> "CfgWeapons" >> _x >> "Laser")) == 1) exitWith {
                _hasLaser = true;
            };
        } forEach (_vehicle weaponsTurret _turretPath);
        if (!_hasLaser) then {
            TRACE_1("Adding Laser Designator",typeOf _vehicle);
            _vehicle addWeaponTurret ["Laserdesignator_mounted", _turretPath];
            _vehicle addMagazineTurret ["Laserbatteries", _turretPath];
        };
    }, _this, 1] call CBA_fnc_waitAndExecute; // Need to delay slightly for turret to become local (probably only needs a single frame)
};


// Add interaction menu actions:
if (_vehicle getVariable [QGVAR(actionsAdded), false]) exitWith {};
_vehicle setVariable [QGVAR(actionsAdded), true];

private _action = [QUOTE(ADDON), localize LSTRING(hellfireModeAction), "", {}, {true}] call EFUNC(interact_menu,createAction);
private _basePath = [_vehicle, 1, ["ACE_SelfActions"], _action] call EFUNC(interact_menu,addActionToObject);

private _fnc_statement = {
    params ["_target", "", "_attackProfile"];
    TRACE_2("statement",_target,_attackProfile);

    _target setVariable [QEGVAR(missileguidance,attackProfile), _attackProfile];
};
private _fnc_condition = {
    params ["_target", "_player", "_attackProfile"];
    
    private _turretPath = if (ACE_player == (driver _target)) then {[-1]} else {ACE_player call CBA_fnc_turretPath};
    private _hasWeapon = ({QGVAR(launcher) == _x} count (_target weaponsTurret _turretPath)) > 0;

    (_hasWeapon) &&
    {(_target getVariable [QEGVAR(missileguidance,attackProfile), "hellfire"]) != _attackProfile};
};

{
    private _displayName = getText (configFile >> QEGVAR(missileguidance,AttackProfiles) >> _x >> "name");
    private _action = [format [QGVAR(%1),_x], _displayName, "", _fnc_statement, _fnc_condition, {}, _x] call EFUNC(interact_menu,createAction);
    [_vehicle, 1, _basePath, _action] call EFUNC(interact_menu,addActionToObject);
} forEach ["hellfire", "hellfire_hi", "hellfire_lo"];

TRACE_2("interactions added",_vehicle,typeOf _vehicle);
