/*
 * Author: Githawk, PabstMirror
 * Adds rearm supply actions to a vehicle or ammo container.
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ammoTruck] call ace_rearm_fnc_initSupplyVehicle;
 *
 * Public: No
 */
#include "script_component.hpp"

if (!hasInterface) exitWith {}; // For now we just add actions, so no need non-clients

params ["_vehicle"];
private _typeOf = typeOf _vehicle;
TRACE_2("initSupplyVehicle",_vehicle,_typeOf);

if (!alive _vehicle) exitWith {};

private _configSupply = getNumber (configFile >> "CfgVehicles" >> _typeOf >> QGVAR(defaultSupply));
private _isSupplyVehicle = _vehicle getVariable [QGVAR(isSupplyVehicle), false];
private _oldRearmConfig = isClass (configFile >> "CfgVehicles" >> _typeOf >> "ACE_Actions" >> "ACE_MainActions" >> QGVAR(takeAmmo));
TRACE_3("",_configSupply,_isSupplyVehicle,_oldRearmConfig);

if ((_configSupply <= 0) && {!_isSupplyVehicle} && {!_oldRearmConfig}) exitWith {}; // Ignore if not enabled
if ((_oldRearmConfig || {_configSupply > 0}) && {_typeOf in GVAR(configTypesAdded)}) exitWith {}; // Only add class actions once
if (_oldRearmConfig || {_configSupply > 0}) then {GVAR(configTypesAdded) pushBack _typeOf};


private _actionReadSupplyCounter = [ // GVAR(supply) > 0
    QGVAR(ReadSupplyCounter),
    localize LSTRING(ReadSupplyCounter), // Check remaining ammunition
    QPATHTOF(ui\icon_rearm_interact.paa),
    {_this call FUNC(readSupplyCounter)},
    {_this call FUNC(canReadSupplyCounter)}
] call EFUNC(interact_menu,createAction);

private _actionTakeAmmo = [
    QGVAR(takeAmmo),
    localize ([LSTRING(Rearm), LSTRING(TakeAmmo)] select (GVAR(level) > 0)),
    QPATHTOF(ui\icon_rearm_interact.paa),
    {},
    {_this call FUNC(canTakeAmmo)},
    {_this call FUNC(addRearmActions)}
] call EFUNC(interact_menu,createAction);

private _actionStoreAmmo = [
    QGVAR(StoreAmmo),
    localize LSTRING(StoreAmmo), // "Store ammo"
    QPATHTOF(ui\icon_rearm_interact.paa),
    {_this call FUNC(storeAmmo)},
    {_this call FUNC(canStoreAmmo)}
] call EFUNC(interact_menu,createAction);

if (_oldRearmConfig || {_configSupply > 0}) then {
    TRACE_1("Adding Class Actions",_typeOf);
    [_typeOf, 0, ["ACE_MainActions"], _actionReadSupplyCounter] call EFUNC(interact_menu,addActionToClass);
    if (!_oldRearmConfig) then {
        [_typeOf, 0, ["ACE_MainActions"], _actionTakeAmmo] call EFUNC(interact_menu,addActionToClass);
        [_typeOf, 0, ["ACE_MainActions"], _actionStoreAmmo] call EFUNC(interact_menu,addActionToClass);
    } else {
        WARNING_1("Actions already present on [%1].  Old Compat PBO?",_typeOf);
    };
} else {
    TRACE_1("Adding Object Actions",_typeOf);
    [_vehicle, 0, ["ACE_MainActions"], _actionReadSupplyCounter] call EFUNC(interact_menu,addActionToObject);
    [_vehicle, 0, ["ACE_MainActions"], _actionTakeAmmo] call EFUNC(interact_menu,addActionToObject);
    [_vehicle, 0, ["ACE_MainActions"], _actionStoreAmmo] call EFUNC(interact_menu,addActionToObject);
};

