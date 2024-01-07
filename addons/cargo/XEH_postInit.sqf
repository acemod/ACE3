#include "script_component.hpp"

["ace_addCargo", LINKFUNC(addCargoItem)] call CBA_fnc_addEventHandler;

["ace_loadCargo", {
    params ["_item", "_vehicle"];
    TRACE_2("LoadCargo EH",_item,_vehicle);

    private _loaded = [_item, _vehicle] call FUNC(loadItem); // returns true if successful

    // Show hint as feedback
    private _hint = [LSTRING(loadingFailed), LSTRING(loadedItem)] select _loaded;
    private _itemName = [_item, true] call FUNC(getNameItem);
    private _vehicleName = getText (configOf _vehicle >> "displayName");

    [[_hint, _itemName, _vehicleName], 3] call EFUNC(common,displayTextStructured);
}] call CBA_fnc_addEventHandler;

["ace_unloadCargo", {
    params ["_item", "_vehicle", ["_unloader", objNull]];
    TRACE_3("UnloadCargo EH",_item,_vehicle,_unloader);

    private _unloaded = [_item, _vehicle, _unloader] call FUNC(unloadItem); // returns true if successful

    // Show hint as feedback
    private _hint = [LSTRING(unloadingFailed), LSTRING(unloadedItem)] select _unloaded;
    private _itemName = [_item, true] call FUNC(getNameItem);
    private _vehicleName = getText (configOf _vehicle >> "displayName");

    [[_hint, _itemName, _vehicleName], 3] call EFUNC(common,displayTextStructured);

    if (_unloaded && {GVAR(openAfterUnload) in [1, 3]}) then {
        GVAR(interactionVehicle) = _vehicle;
        GVAR(interactionParadrop) = false;
        createDialog QGVAR(menu);
    };
}] call CBA_fnc_addEventHandler;

[QGVAR(serverUnload), {
    params ["_item", "_emptyPosAGL"];

    _item hideObjectGlobal false;
    _item setPosASL (AGLtoASL _emptyPosAGL);

    [_item, "blockDamage", QUOTE(ADDON), false] call EFUNC(common,statusEffect_set);
}] call CBA_fnc_addEventHandler;

[QGVAR(paradropItem), {
    params ["_item", "_vehicle", ["_showHint", true]];

    private _unloaded = [_item, _vehicle, _showHint] call FUNC(paradropItem);

    if (_unloaded && {GVAR(openAfterUnload) in [2, 3]}) then {
        GVAR(interactionVehicle) = _vehicle;
        GVAR(interactionParadrop) = true;
        createDialog QGVAR(menu);
    };
}] call CBA_fnc_addEventHandler;

// Private events to handle adding actions globally via public functions
[QGVAR(initObject), LINKFUNC(initObject)] call CBA_fnc_addEventHandler;
[QGVAR(initVehicle), LINKFUNC(initVehicle)] call CBA_fnc_addEventHandler;

GVAR(vehicleAction) = [
    QGVAR(openMenu), LLSTRING(openMenu), "",
    {
        //IGNORE_PRIVATE_WARNING ["_target", "_player"];
        GVAR(interactionVehicle) = _target;
        GVAR(interactionParadrop) = false;
        createDialog QGVAR(menu);
    },
    {
        //IGNORE_PRIVATE_WARNING ["_target", "_player"];
        GVAR(enable) &&
        {alive _target} &&
        {locked _target < 2} &&
        {(_target getVariable [QGVAR(hasCargo), getNumber (configOf _target >> QGVAR(hasCargo)) == 1])} &&
        {[_player, _target, ["isNotSwimming"]] call EFUNC(common,canInteractWith)} &&
        {[_player, _target] call EFUNC(interaction,canInteractWithVehicleCrew)} &&
        {([_player, _target] call EFUNC(interaction,getInteractionDistance)) < MAX_LOAD_DISTANCE}
    }
] call EFUNC(interact_menu,createAction);

GVAR(objectActions) = [
    [QGVAR(renameObject), LELSTRING(common,rename), "\a3\Modules_F_Curator\Data\iconMissionName_ca.paa",
        {
            //IGNORE_PRIVATE_WARNING ["_target", "_player"];
            GVAR(interactionVehicle) = _target;
            createDialog QGVAR(renameMenu);
        },
        {
            //IGNORE_PRIVATE_WARNING ["_target", "_player"];
            GVAR(enable) &&
            {GVAR(enableRename)} &&
            {alive _target} &&
            {_target getVariable [QGVAR(canLoad), getNumber (configOf _target >> QGVAR(canLoad)) == 1]} &&
            {!(_target getVariable [QGVAR(noRename), getNumber (configOf _target >> QGVAR(noRename)) == 1])} &&
            {[_player, _target, ["isNotSwimming"]] call EFUNC(common,canInteractWith)} &&
            {[_player, _target] call EFUNC(interaction,canInteractWithVehicleCrew)}
        }
    ] call EFUNC(interact_menu,createAction),
    [QGVAR(load), LLSTRING(loadObject), "a3\ui_f\data\IGUI\Cfg\Actions\loadVehicle_ca.paa",
        {
            //IGNORE_PRIVATE_WARNING ["_target", "_player"];
            [_player, _target] call FUNC(startLoadIn);
        },
        {
            //IGNORE_PRIVATE_WARNING ["_target", "_player"];
            GVAR(enable) &&
            {alive _target} &&
            {locked _target < 2} &&
            {_target getVariable [QGVAR(canLoad), getNumber (configOf _target >> QGVAR(canLoad)) == 1]} &&
            {[_player, _target, ["isNotSwimming"]] call EFUNC(common,canInteractWith)} &&
            {[_player, _target] call EFUNC(interaction,canInteractWithVehicleCrew)} &&
            {((nearestObjects [_target, GVAR(cargoHolderTypes), MAX_LOAD_DISTANCE + 10]) findIf {
                _x != _target &&
                {alive _x} &&
                {locked _x < 2} &&
                {_x getVariable [QGVAR(hasCargo), getNumber (configOf _x >> QGVAR(hasCargo)) == 1]} &&
                {([_target, _x] call EFUNC(interaction,getInteractionDistance)) < MAX_LOAD_DISTANCE}
            }) != -1}
        },
        LINKFUNC(addCargoVehiclesActions)
    ] call EFUNC(interact_menu,createAction)
];

// Find all remaining configured classes and init them, see XEH_preStart.sqf
private _vehicleClassesAddAction = call (uiNamespace getVariable [QGVAR(initializedVehicleClasses), {[]}]);

{
    [_x, 0, ["ACE_MainActions"], GVAR(vehicleAction)] call EFUNC(interact_menu,addActionToClass);
} forEach _vehicleClassesAddAction;

GVAR(initializedVehicleClasses) append _vehicleClassesAddAction;

private _objectClassesAddAction = call (uiNamespace getVariable [QGVAR(initializedItemClasses), {[]}]);

{
    private _objectClass = _x;

    {
        [_objectClass, 0, ["ACE_MainActions"], _x] call EFUNC(interact_menu,addActionToClass);
    } forEach GVAR(objectActions);
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

if (isServer) then {
    ["ace_placedInBodyBag", {
        params ["_target", "_bodyBag", "_isGrave"];

        if (_isGrave) exitWith {}; // assume graves aren't cargo

        _bodyBag setVariable [QGVAR(customName), [_target, false, true] call EFUNC(common,getName), true];
    }] call CBA_fnc_addEventHandler;
};
