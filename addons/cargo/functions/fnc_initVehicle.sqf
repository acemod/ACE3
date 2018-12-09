#include "script_component.hpp"
/*
 * Author: Glowbal
 * Initializes vehicle, adds open cargo menu action if available.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [vehicle] call ace_cargo_fnc_initVehicle
 *
 * Public: No
 */

params ["_vehicle"];
TRACE_1("params", _vehicle);

private _type = typeOf _vehicle;

// If vehicle had space given to it via eden/public then override config hasCargo setting
private _hasCargoPublic = _vehicle getVariable [QGVAR(hasCargo), false];
private _hasCargoConfig = getNumber (configFile >> "CfgVehicles" >> _type >> QGVAR(hasCargo)) == 1;

// Nothing to do here if vehicle has no cargo space
if !(_hasCargoConfig || _hasCargoPublic) exitWith {};

// Check if cargo is in cargo holder types (checked when trying to search for loadable objects)
private _addCargoType = true;
{
    if (_type isKindOf _x) exitWith {_addCargoType = false};
} forEach GVAR(cargoHolderTypes);
TRACE_2("",_addCargoType,_type);
if (_addCargoType) then {
    GVAR(cargoHolderTypes) pushBack _type;
};

// Vehicle can have default ace cargo in its config
if (isServer) then {
    {
        if (isClass _x) then {
            private _cargoClassname = getText (_x >> "type");
            private _cargoCount = getNumber (_x >> "amount");
            TRACE_3("adding ACE_Cargo", (configName _x), _cargoClassname, _cargoCount);
            ["ace_addCargo", [_cargoClassname, _vehicle, _cargoCount]] call CBA_fnc_localEvent;
        };
    } count ("true" configClasses (configFile >> "CfgVehicles" >> _type >> "ACE_Cargo" >> "Cargo"));
};

// Servers and HCs do not require action menus (beyond this point)
if !(hasInterface) exitWith {};

// Unnecessary to add actions to a vehicle class that's already got them
if (_type in GVAR(initializedVehicleClasses)) exitWith {};
if (_vehicle getVariable [QGVAR(initVehicle),false]) exitWith {};

// Vehicles given cargo via eden have their actions added to the object
// So this function may run for multiple of the same class in that case
if (_hasCargoConfig) then {
    GVAR(initializedVehicleClasses) pushBack _type;
    TRACE_1("Adding unload cargo action to class", _type);
    [_type, 0, ["ACE_MainActions"], GVAR(vehicleAction)] call EFUNC(interact_menu,addActionToClass);
} else {
    _vehicle setVariable [QGVAR(initVehicle),true];
    TRACE_1("Adding unload cargo action to object", _vehicle);
    [_vehicle, 0, ["ACE_MainActions"], GVAR(vehicleAction)] call EFUNC(interact_menu,addActionToObject);
};

// Add the paradrop self interaction for planes and helicopters
if (_vehicle isKindOf "Air") then {
    private _condition = {
        //IGNORE_PRIVATE_WARNING ["_target", "_player"];
        GVAR(enable) && {[_player, _target, []] call EFUNC(common,canInteractWith)} && {
            private _turretPath = _player call CBA_fnc_turretPath;
            (_player == (driver _target)) || // pilot
            {(getNumber (([_target, _turretPath] call CBA_fnc_getTurret) >> "isCopilot")) == 1} || // coPilot
            {_turretPath in (getArray (configFile >> "CfgVehicles" >> (typeOf _target) >> QGVAR(loadmasterTurrets)))}} // loadMaster turret from config
    };
    private _statement = {
        //IGNORE_PRIVATE_WARNING ["_target", "_player"];
        GVAR(interactionVehicle) = _target;
        GVAR(interactionParadrop) = true;
        createDialog QGVAR(menu);
    };
    private _text = localize LSTRING(openMenu);
    private _icon = "";

    private _action = [QGVAR(openMenu), _text, _icon, _statement, _condition] call EFUNC(interact_menu,createAction);
    if (_hasCargoConfig) then {
        [_type, 1, ["ACE_SelfActions"], _action] call EFUNC(interact_menu,addActionToClass); // self action on the vehicle
    } else {
        [_vehicle, 1, ["ACE_SelfActions"], _action] call EFUNC(interact_menu,addActionToObject);
    };
};
