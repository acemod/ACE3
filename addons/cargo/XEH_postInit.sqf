#include "script_component.hpp"

["AddCargoByClass", {_this call FUNC(addCargoItem)}] call CFUNC(addEventHandler);

["LoadCargo", {
    params ["_item", "_vehicle"];
    TRACE_2("LoadCargo EH",_item,_vehicle);

    private _loaded = [_item, _vehicle] call FUNC(loadItem);

    // Show hint as feedback
    private _hint = [LSTRING(LoadingFailed), LSTRING(LoadedItem)] select _loaded;
    private _itemName = getText (configFile >> "CfgVehicles" >> typeOf _item >> "displayName");
    private _vehicleName = getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName");

    ["displayTextStructured", [[_hint, _itemName, _vehicleName], 3.0]] call CFUNC(localEvent);

    if (_loaded) then {
        // Invoke listenable event
        ["cargoLoaded", [_item, _vehicle]] call CFUNC(globalEvent);
    };
}] call CFUNC(addEventHandler);

["UnloadCargo", {
    params ["_item", "_vehicle", ["_unloader", objNull]];
    TRACE_3("UnloadCargo EH",_item,_vehicle,_unloader);

    private _unloaded = [_item, _vehicle, _unloader] call FUNC(unloadItem); //returns true if sucessful

    private _itemClass = if (_item isEqualType "") then {_item} else {typeOf _item};

    // Show hint as feedback
    private _hint = [LSTRING(UnloadingFailed), LSTRING(UnloadedItem)] select _unloaded;
    private _itemName = getText (configFile >> "CfgVehicles" >> _itemClass >> "displayName");
    private _vehicleName = getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName");

    ["displayTextStructured", [[_hint, _itemName, _vehicleName], 3.0]] call CFUNC(localEvent);

    if (_unloaded) then {
        // Invoke listenable event
        ["cargoUnloaded", [_item, _vehicle]] call CFUNC(globalEvent);
    };

    // TOOO maybe drag/carry the unloaded item?
}] call CFUNC(addEventHandler);

["ServerUnloadCargo", {
    params ["_item", "_emptyPosAGL"];

    _item hideObjectGlobal false;
    _item setPosASL (AGLtoASL _emptyPosAGL);
}] call CFUNC(addEventHandler);
