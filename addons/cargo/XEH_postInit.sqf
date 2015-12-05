#include "script_component.hpp"

["AddCargoByClass", {_this call FUNC(addCargoItem)}] call EFUNC(common,addEventHandler);

["LoadCargo", {
    (_this select 0) params ["_item","_vehicle"];
    private ["_loaded", "_hint", "_itemName", "_vehicleName"];

    _loaded = [_item, _vehicle] call FUNC(loadItem);

    // Show hint as feedback
    _hint = [LSTRING(LoadingFailed), LSTRING(LoadedItem)] select _loaded;
    _itemName = getText (configFile >> "CfgVehicles" >> typeOf _item >> "displayName");
    _vehicleName = getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName");

    ["displayTextStructured", [[_hint, _itemName, _vehicleName], 3.0]] call EFUNC(common,localEvent);

    if (_loaded) then {
        // Invoke listenable event
        ["cargoLoaded", [_item, _vehicle]] call EFUNC(common,globalEvent);
    };
}] call EFUNC(common,addEventHandler);

["UnloadCargo", {
    (_this select 0) params ["_item","_vehicle"];
    private ["_unloaded", "_itemClass", "_hint", "_itemName", "_vehicleName"];

    _unloaded = [_item, _vehicle] call FUNC(unloadItem);

    _itemClass = if (typeName _item == "STRING") then {_item} else {typeOf _item};

    // Show hint as feedback
    _hint = [LSTRING(UnloadingFailed), LSTRING(UnloadedItem)] select _unloaded;
    _itemName = getText (configFile >> "CfgVehicles" >> _itemClass >> "displayName");
    _vehicleName = getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName");

    ["displayTextStructured", [[_hint, _itemName, _vehicleName], 3.0]] call EFUNC(common,localEvent);

    if (_unloaded) then {
        // Invoke listenable event
        ["cargoUnloaded", [_item, _vehicle]] call EFUNC(common,globalEvent);
    };

    // TOOO maybe drag/carry the unloaded item?
}] call EFUNC(common,addEventHandler);
