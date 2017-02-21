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
#include "script_component.hpp"

params ["_vehicle"];
TRACE_1("params", _vehicle);

private _type = typeOf _vehicle;

if (getNumber (configFile >> "CfgVehicles" >> _type >> QGVAR(hasCargo)) != 1) exitWith {};

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

// do nothing if the class is already initialized
if (_type in GVAR(initializedVehicleClasses)) exitWith {};
// set class as initialized
GVAR(initializedVehicleClasses) pushBack _type;

if (!hasInterface) exitWith {};

TRACE_1("Adding unload cargo action to class", _type);

private _condition = {
    GVAR(enable) && {locked _target < 2} && {alive _target} && {[_player, _target, ["isNotSwimming"]] call EFUNC(common,canInteractWith)}
};
private _statement = {
    GVAR(interactionVehicle) = _target;
    GVAR(interactionParadrop) = false;
    createDialog QGVAR(menu);
};
private _text = localize LSTRING(openMenu);
private _icon = "";

private _action = [QGVAR(openMenu), _text, _icon, _statement, _condition] call EFUNC(interact_menu,createAction);
[_type, 0, ["ACE_MainActions"], _action] call EFUNC(interact_menu,addActionToClass);

// Add the paradrop self interaction for planes and helicopters
if (_vehicle isKindOf "Air") then {
    private _condition = {
        GVAR(enable) && {[_player, _target, []] call EFUNC(common,canInteractWith)} && {
            private _turretPath = _player call CBA_fnc_turretPath;
            (_player == (driver _target)) || // pilot
            {(getNumber (([_target, _turretPath] call CBA_fnc_getTurret) >> "isCopilot")) == 1} || // coPilot
            {_turretPath in (getArray (configFile >> "CfgVehicles" >> (typeOf _target) >> QGVAR(loadmasterTurrets)))}} // loadMaster turret from config
    };
    private _statement = {
        GVAR(interactionVehicle) = _target;
        GVAR(interactionParadrop) = true;
        createDialog QGVAR(menu);
    };
    private _text = localize LSTRING(openMenu);
    private _icon = "";

    private _action = [QGVAR(openMenu), _text, _icon, _statement, _condition] call EFUNC(interact_menu,createAction);
    [_type, 1, ["ACE_SelfActions"], _action] call EFUNC(interact_menu,addActionToClass); // self action on the vehicle
};
