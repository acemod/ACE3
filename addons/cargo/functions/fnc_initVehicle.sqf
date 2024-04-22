#include "..\script_component.hpp"
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
 * cursorObject call ace_cargo_fnc_initVehicle
 *
 * Public: No
 */

params ["_vehicle"];
TRACE_1("params",_vehicle);

private _type = typeOf _vehicle;
private _config = configOf _vehicle;

// If vehicle had space given to it via eden/public, then override config hasCargo setting
private _hasCargoPublic = _vehicle getVariable QGVAR(hasCargo);
private _hasCargoPublicDefined = !isNil "_canLoadPublic";

if (_hasCargoPublicDefined && {!(_hasCargoPublic isEqualType false)}) then {
    WARNING_4("%1[%2] - Variable %3 is %4 - Should be bool",_vehicle,_type,QGVAR(hasCargo),_hasCargoPublic);
};

private _hasCargoConfig = getNumber (_config >> QGVAR(hasCargo)) == 1;

// Nothing to do here if vehicle has no cargo space
if !((_hasCargoPublicDefined && {_hasCargoPublic in [true, 1]}) || {!_hasCargoPublicDefined && {_hasCargoConfig}}) exitWith {};

// Check if cargo is in cargo holder types (checked when trying to search for loadable objects)
private _addCargoType = GVAR(cargoHolderTypes) findIf {_type isKindOf _x} == -1;

TRACE_2("",_addCargoType,_type);

if (_addCargoType) then {
    GVAR(cargoHolderTypes) pushBack _type;
};

// If already initialised (both actions and cargo), then skip
if (_vehicle getVariable [QGVAR(initVehicle), false]) exitWith {};

// Vehicles can have default ace cargo in their config
if (isServer) then {
    _vehicle setVariable [QGVAR(initVehicle), true];

    private _cargoClassname = "";
    private _cargoCount = 0;

    {
        _cargoClassname = getText (_x >> "type");
        _cargoCount = getNumber (_x >> "amount");

        TRACE_3("adding ACE_Cargo",configName _x,_cargoClassname,_cargoCount);

        ["ace_addCargo", [_cargoClassname, _vehicle, _cargoCount]] call CBA_fnc_localEvent;
    } forEach ("true" configClasses (_config >> QUOTE(ADDON) >> "cargo"));
};

// Servers and HCs do not require action menus (beyond this point)
if (!hasInterface) exitWith {};

if (_vehicle getVariable [QGVAR(initVehicle),false]) exitWith {};
private _tb = getNumber (_config >> "transportmaxbackpacks");
private _tm = getNumber (_config >> "transportmaxmagazines");
private _tw = getNumber (_config >> "transportmaxweapons");
private _hasInventory = (_tb > 0 || _tm > 0 || _tw > 0);
_vehicle setVariable [QGVAR(hasInventory), _hasInventory];

// This is a Hack to add the Gear Action and thus the Cargo UI to vehicles/Objects that dont naturally have a Gear Action
if (!_hasInventory) then {
    private _cfgAction = configFile >> "CfgActions" >> "Gear";
    private _title = getText (_cfgAction >> "text");
    private _hideOnUse = getNumber (_cfgAction >> "hideOnUse") == 1;
    private _showWindow = getNumber (_cfgAction >> "showWindow") == 1;
    private _textDefault = getText (_cfgAction >> "textDefault");
    private _shortcut = getText (_cfgAction >> "shortcut");
    private _id = _vehicle addAction [_title, {
        ACE_Player action ["Gear", objNull];
    }, nil, 5.1, _showWindow, _hideOnUse, _shortcut, "!(lockedInventory _target)"];
    _vehicle setUserActionText [_id, _title, _textDefault];
};