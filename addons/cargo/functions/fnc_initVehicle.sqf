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
private _hasCargoPublic = _item getVariable QGVAR(hasCargo);
private _hasCargoPublicDefined = !isNil "_canLoadPublic";

if (_hasCargoPublicDefined && {!(_hasCargoPublic isEqualType false)}) then {
    WARNING_4("%1[%2] - Variable %3 is %4 - Should be bool",_item,_type,QGVAR(hasCargo),_hasCargoPublic);
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

// Unnecessary to add actions to a vehicle class that's already got them
if (_type in GVAR(initializedVehicleClasses)) exitWith {};

// Vehicles given cargo via eden have their actions added to the object
// So this function may run for multiple of the same class in that case
if (_hasCargoConfig) then {
    GVAR(initializedVehicleClasses) pushBack _type;

    TRACE_1("Adding unload cargo action to class",_type);

    [_type, 0, ["ACE_MainActions"], GVAR(vehicleAction)] call EFUNC(interact_menu,addActionToClass);
} else {
    _vehicle setVariable [QGVAR(initVehicle), true];

    TRACE_1("Adding unload cargo action to object",_vehicle);

    [_vehicle, 0, ["ACE_MainActions"], GVAR(vehicleAction)] call EFUNC(interact_menu,addActionToObject);
};

// Add the paradrop self interaction for planes and helicopters
if (_vehicle isKindOf "Air") then {
    private _condition = {
        //IGNORE_PRIVATE_WARNING ["_target", "_player"];
        GVAR(enable) &&
        {[_player, _target, []] call EFUNC(common,canInteractWith)} && {
            private _turretPath = _target unitTurret _player;

            (_player == currentPilot _target) || // Pilot/Co-pilot
            {(getNumber ([_target, _turretPath] call CBA_fnc_getTurret >> "isCopilot")) == 1} || // Co-pilot
            {_turretPath in (getArray (configOf _target >> QGVAR(loadmasterTurrets)))}
        }
    };

    private _statement = {
        //IGNORE_PRIVATE_WARNING ["_target", "_player"];
        GVAR(interactionVehicle) = _target;
        GVAR(interactionParadrop) = true;
        createDialog QGVAR(menu);
    };

    private _text = LLSTRING(openMenu);
    private _icon = "";

    private _action = [QGVAR(openMenu), _text, _icon, _statement, _condition] call EFUNC(interact_menu,createAction);

    // Self action on the vehicle
    if (_hasCargoConfig) then {
        [_type, 1, ["ACE_SelfActions"], _action] call EFUNC(interact_menu,addActionToClass);
    } else {
        [_vehicle, 1, ["ACE_SelfActions"], _action] call EFUNC(interact_menu,addActionToObject);
    };
};
