#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Adds interaction menu actions to switch the firemode to a vehicle.
 * Also adds a Laser Designator if vehicle is configured for one.
 *
 * Arguments:
 * 0: Player <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player] call ace_hellfire_fnc_setupVehicle
 *
 * Public: No
 */


params ["_player"];
// Note: player may be the currently controlled UAV's AI unit (so may be different from ace_player)
TRACE_1("showHud",_player);

if (!alive _player) exitWith {};

private _vehicle = vehicle _player;

if (_player == _vehicle) exitWith {};

private _turretPath = _vehicle unitTurret _player;
private _cfgWeapons = configFile >> "CfgWeapons";

// Check all weapons to see if the hellfire is enabled - if not, exit now
if ((_vehicle weaponsTurret _turretPath) findIf {getNumber (_cfgWeapons >> _x >> QGVAR(enabled)) == 1} == -1) exitWith {TRACE_2("Not enabled",_vehicle,_turretPath);};


// Add laser if vehicle is configured for one and doesn't have one yet:
if ((getNumber (configOf _vehicle >> QGVAR(addLaserDesignator))) == 1) then {
    [{
        params ["_vehicle", "_turretPath"];
        TRACE_3("checking for laser",_vehicle,_turretPath,_vehicle turretLocal _turretPath);
        if (!alive _vehicle) exitWith {};
        if !(_vehicle turretLocal _turretPath) then {WARNING("Turret not local");};

        private _cfgWeapons = configFile >> "CfgWeapons";

        // Most addons just use "Laserdesignator_mounted", but this should cover custom ones
        if ((_vehicle weaponsTurret _turretPath) findIf {getNumber (_cfgWeapons >> _x >> "Laser") == 1} != -1) exitWith {};

        TRACE_1("Adding Laser Designator",typeOf _vehicle);
        _vehicle addWeaponTurret ["Laserdesignator_mounted", _turretPath];
        _vehicle addMagazineTurret ["Laserbatteries", _turretPath];
    }, [_vehicle, _turretPath], 1] call CBA_fnc_waitAndExecute; // Need to delay slightly for turret to become local (probably only needs a single frame)
};


// Add interaction menu actions:
if (_vehicle getVariable [QGVAR(actionsAdded), false]) exitWith {};
_vehicle setVariable [QGVAR(actionsAdded), true];

private _action = [QUOTE(ADDON), LLSTRING(hellfireModeAction), "", {}, {true}] call EFUNC(interact_menu,createAction);
private _basePath = [_vehicle, 1, ["ACE_SelfActions"], _action] call EFUNC(interact_menu,addActionToObject);

private _fnc_statement = {
    params ["_target", "", "_attackProfile"];
    TRACE_2("statement",_target,_attackProfile);

    _target setVariable [QEGVAR(missileguidance,attackProfile), _attackProfile];
};
private _fnc_condition = {
    params ["_target", "", "_attackProfile"];

    (_target getVariable [QEGVAR(missileguidance,attackProfile), "hellfire"]) != _attackProfile &&
    {
        private _operator = if (isNull (ACE_controlledUAV select 0)) then {ACE_player} else {ACE_controlledUAV select 1};
        private _cfgWeapons = configFile >> "CfgWeapons";

        (_target weaponsTurret (_target unitTurret _operator)) findIf {getNumber (_cfgWeapons >> _x >> QGVAR(enabled)) == 1} != -1
    }
};

{
    private _displayName = getText (configFile >> QEGVAR(missileguidance,AttackProfiles) >> _x >> "name");
    private _action = [format [QGVAR(%1), _x], _displayName, "", _fnc_statement, _fnc_condition, {}, _x] call EFUNC(interact_menu,createAction);
    [_vehicle, 1, _basePath, _action] call EFUNC(interact_menu,addActionToObject);
} forEach ["hellfire", "hellfire_hi", "hellfire_lo"];

TRACE_2("interactions added",_vehicle,typeOf _vehicle);
