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

    private _simulationType = toLower getText (configFile >> "CfgVehicles" >> typeOf _item >> "simulation");
    if (_simulationType in ["carx", "tankx"]) then {
        TRACE_1("re-enabling vehicle damage",_item);
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
        {((nearestObjects [_target, GVAR(cargoHolderTypes), (MAX_LOAD_DISTANCE + 10)]) findIf {
            private _hasCargoConfig = 1 == getNumber (configFile >> "CfgVehicles" >> typeOf _x >> QGVAR(hasCargo));
            private _hasCargoPublic = _x getVariable [QGVAR(hasCargo), false];
            (_hasCargoConfig || {_hasCargoPublic}) && {_x != _target} && {alive _x} && {locked _x < 2} &&
            {([_target, _x] call EFUNC(interaction,getInteractionDistance)) < MAX_LOAD_DISTANCE}
        }) > -1}
    },
    LINKFUNC(addCargoVehiclesActions)
] call EFUNC(interact_menu,createAction);

// find all remaining configured classes and init them, see XEH_preStart.sqf
private _vehicleClassesAddAction = call (uiNamespace getVariable [QGVAR(initializedVehicleClasses), {[]}]);
{
    [_x, 0, ["ACE_MainActions"], GVAR(vehicleAction)] call EFUNC(interact_menu,addActionToClass);
} forEach _vehicleClassesAddAction;
GVAR(initializedVehicleClasses) append _vehicleClassesAddAction;

private _objectClassesAddAction = call (uiNamespace getVariable [QGVAR(initializedItemClasses), {[]}]);
{
    [_x, 0, ["ACE_MainActions"], GVAR(objectAction)] call EFUNC(interact_menu,addActionToClass);
} forEach _objectClassesAddAction;
GVAR(initializedItemClasses) append _objectClassesAddAction;

private _vehicleClassesAddClassEH = call (uiNamespace getVariable [QGVAR(vehicleClasses_classEH), {[]}]);
{
    [_x, "initPost", DFUNC(initVehicle), nil, nil, true] call CBA_fnc_addClassEventHandler;
} forEach _vehicleClassesAddClassEH;

private _objectClassesAddClassEH = call (uiNamespace getVariable [QGVAR(objectClasses_classEH), {[]}]);
{
    [_x, "initPost", DFUNC(initObject), nil, nil, true] call CBA_fnc_addClassEventHandler;
} forEach _objectClassesAddClassEH;
