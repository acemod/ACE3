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
}] call CBA_fnc_addEventHandler;
