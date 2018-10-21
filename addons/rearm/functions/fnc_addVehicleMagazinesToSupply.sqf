#include "script_component.hpp"
/*
 * Author: GitHawk
 * Adds all magazines of a vehicle to the supply.
 *
 * Arguments:
 * 0: Ammo Truck <OBJECT>
 * 1: Vehicle object or Vehicle class <OBJECT><STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ammo_truck, tank] call ace_rearm_fnc_addVehicleMagazinesToSupply
 * [ammo_truck, "B_MBT_01_arty_F"] call ace_rearm_fnc_addVehicleMagazinesToSupply
 *
 * Public: Yes
 */

if !(EGVAR(common,settingsInitFinished)) exitWith { // only run this after the settings are initialized
    EGVAR(common,runAtSettingsInitialized) pushBack [FUNC(addVehicleMagazinesToSupply), _this];
};

params [["_truck", objNull, [objNull]], ["_vehicle", objNull, [objNull, ""]]];
TRACE_2("addVehicleMagazinesToSupply",_truck,_vehicle);

if (isNull _truck) exitWith {};
if (_vehicle isEqualType objNull) then {_vehicle = typeOf _vehicle};
if (_vehicle == "") exitWith {
    ERROR_1("VehicleType [%1] is empty in ace_rearm_fnc_addVehicleMagazinesToSupply",_string);
};
private _turrets = [_vehicle] call FUNC(getAllRearmTurrets);
{
    private _turretPath = _x;
    private _magazines = [_vehicle, _turretPath] call FUNC(getTurretConfigMagazines);
    TRACE_2("",_turretPath,_magazines);
    {
        [_truck, _x] call FUNC(addMagazineToSupply);
        false
    } count _magazines;
    false
} count _turrets;

// 1.70 pylons
private _pylonConfigs = configProperties [configFile >> "CfgVehicles" >> _vehicle >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"];
{
    private _defaultMag = getText (_x >> "attachment");
    TRACE_3("",_defaultMag,configName _x,_forEachIndex);
    [_truck, _defaultMag] call FUNC(addMagazineToSupply);
} forEach _pylonConfigs;
