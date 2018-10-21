#include "script_component.hpp"

["ace_addCargo", {_this call FUNC(addCargoItem)}] call CBA_fnc_addEventHandler;
[QGVAR(paradropItem), {_this call FUNC(paradropItem)}] call CBA_fnc_addEventHandler;

["ace_loadCargo", {
    params ["_item", "_vehicle"];
    TRACE_2("LoadCargo EH",_item,_vehicle);

    private _loaded = [_item, _vehicle] call FUNC(loadItem);

    // Show hint as feedback
    private _hint = [LSTRING(LoadingFailed), LSTRING(LoadedItem)] select _loaded;
    private _itemName = getText (configFile >> "CfgVehicles" >> typeOf _item >> "displayName");
    private _vehicleName = getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName");

    [[_hint, _itemName, _vehicleName], 3.0] call EFUNC(common,displayTextStructured);

    if (_loaded) then {
        // Invoke listenable event
        ["ace_cargoLoaded", [_item, _vehicle]] call CBA_fnc_globalEvent;
    };
}] call CBA_fnc_addEventHandler;

["ace_unloadCargo", {
    params ["_item", "_vehicle", ["_unloader", objNull]];
    TRACE_3("UnloadCargo EH",_item,_vehicle,_unloader);

    private _unloaded = [_item, _vehicle, _unloader] call FUNC(unloadItem); //returns true if sucessful

    private _itemClass = if (_item isEqualType "") then {_item} else {typeOf _item};

    // Show hint as feedback
    private _hint = [LSTRING(UnloadingFailed), LSTRING(UnloadedItem)] select _unloaded;
    private _itemName = getText (configFile >> "CfgVehicles" >> _itemClass >> "displayName");
    private _vehicleName = getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName");

    [[_hint, _itemName, _vehicleName], 3.0] call EFUNC(common,displayTextStructured);

    if (_unloaded) then {
        // Invoke listenable event
        ["ace_cargoUnloaded", [_item, _vehicle]] call CBA_fnc_globalEvent;
    };

    // TOOO maybe drag/carry the unloaded item?
}] call CBA_fnc_addEventHandler;

[QGVAR(serverUnload), {
    params ["_item", "_emptyPosAGL"];

    _item hideObjectGlobal false;
    _item setPosASL (AGLtoASL _emptyPosAGL);

    if ((getText (configFile >> "CfgVehicles" >> (typeOf _item) >> "simulation")) == "carx") then {
        TRACE_1("re-enabling car damage",_item);
        [_item, "blockDamage", "ACE_cargo", false] call EFUNC(common,statusEffect_set);
    };
}] call CBA_fnc_addEventHandler;

// Private events to handle adding actions globally via public functions
[QGVAR(initObject), DFUNC(initObject)] call CBA_fnc_addEventHandler;
[QGVAR(initVehicle), DFUNC(initVehicle)] call CBA_fnc_addEventHandler;


GVAR(vehicleAction) = [
    QGVAR(openMenu), localize LSTRING(openMenu), "",
    {
        //IGNORE_PRIVATE_WARNING ["_target", "_player"];
        GVAR(interactionVehicle) = _target;
        GVAR(interactionParadrop) = false;
        createDialog QGVAR(menu);
    },
    {
        //IGNORE_PRIVATE_WARNING ["_target", "_player"];
        GVAR(enable) &&
        {(_target getVariable [QGVAR(hasCargo), getNumber (configFile >> "CfgVehicles" >> (typeOf _target) >> QGVAR(hasCargo)) == 1])} &&
        {locked _target < 2} &&
        {([_player, _target] call EFUNC(interaction,getInteractionDistance)) < MAX_LOAD_DISTANCE} &&
        {alive _target} &&
        {[_player, _target, ["isNotSwimming"]] call EFUNC(common,canInteractWith)}
    }
] call EFUNC(interact_menu,createAction);

GVAR(objectAction) = [
    QGVAR(load), localize LSTRING(loadObject), "a3\ui_f\data\IGUI\Cfg\Actions\loadVehicle_ca.paa",
    {
        params ["_target", "_player"];
        [_player, _target] call FUNC(startLoadIn);
    },
    {
        //IGNORE_PRIVATE_WARNING ["_target", "_player"];
        GVAR(enable) &&
        {(_target getVariable [QGVAR(canLoad), getNumber (configFile >> "CfgVehicles" >> (typeOf _target) >> QGVAR(canLoad))]) in [true, 1]} &&
        {locked _target < 2} &&
        {alive _target} &&
        {[_player, _target, ["isNotSwimming"]] call EFUNC(common,canInteractWith)} &&
        {0 < {
                private _type = typeOf _x;
                private _hasCargoPublic = _x getVariable [QGVAR(hasCargo), false];
                private _hasCargoConfig = getNumber (configFile >> "CfgVehicles" >> _type >> QGVAR(hasCargo)) == 1;
                (_hasCargoPublic || _hasCargoConfig) && {_x != _target} &&
                {([_target, _x] call EFUNC(interaction,getInteractionDistance)) < MAX_LOAD_DISTANCE}
            } count (nearestObjects [_player, GVAR(cargoHolderTypes), (MAX_LOAD_DISTANCE + 10)])}
    },
    LINKFUNC(addCargoVehiclesActions)
] call EFUNC(interact_menu,createAction);


private _initVehicleClasses = ["ThingX", "LandVehicle", "Air", "Ship_F"];
private _initObjectClasses = ["ThingX", "StaticWeapon"];
{
    [_x, "initPost", DFUNC(initVehicle), nil, nil, true] call CBA_fnc_addClassEventHandler;
} forEach _initVehicleClasses;
{
    [_x, "initPost", DFUNC(initObject), nil, nil, true] call CBA_fnc_addClassEventHandler;
} forEach _initObjectClasses;

// find all remaining configured classes and init them
{
    private _class = configName _x;
    // init vehicle
    if (
        1 == getNumber (_x >> QGVAR(hasCargo))
        && {{if (_class isKindOf _x) exitWith {false}; true} forEach _initVehicleClasses}
    ) then {
        if (_class isKindOf "Static") then {
            if (2 == getNumber (_x >> "scope")) then {
                [_class, 0, ["ACE_MainActions"], GVAR(vehicleAction)] call EFUNC(interact_menu,addActionToClass);
                GVAR(initializedVehicleClasses) pushBack _class;
            };
        } else {
            [_class, "initPost", DFUNC(initVehicle), nil, nil, true] call CBA_fnc_addClassEventHandler;
            _initVehicleClasses pushBack _class;
        };
    };
    // init object
    if (
        1 == getNumber (_x >> QGVAR(canLoad))
        && {{if (_class isKindOf _x) exitWith {false}; true} forEach _initObjectClasses}
    ) then {
        if (_class isKindOf "Static") then {
            if (2 == getNumber (_x >> "scope")) then {
                [_class, 0, ["ACE_MainActions"], GVAR(objectAction)] call EFUNC(interact_menu,addActionToClass);
                GVAR(initializedItemClasses) pushBack _class;
            };
        } else {
            [_class, "initPost", DFUNC(initObject), nil, nil, true] call CBA_fnc_addClassEventHandler;
            _initObjectClasses pushBack _class;
        };
    };
} forEach ("true" configClasses (configFile >> "CfgVehicles"));
