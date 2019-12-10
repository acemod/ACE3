#include "script_component.hpp"
/*
 * Author: PabstMirror, mharis001
 * Initializes the ace_cargo attribute of the zeus vehicle attributes display.
 * (the display shown on double click)
 *
 * Arguments:
 * 0: ace_cargo controls group <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [CONTROL] call ace_zeus_fnc_ui_attributeCargo
 *
 * Public: No
 */

params ["_control"];
TRACE_1("params",_control);

private _vehicle = GETMVAR(BIS_fnc_initCuratorAttributes_target,objNull);
TRACE_1("",_vehicle);

private _loaded = _vehicle getVariable [QEGVAR(cargo,loaded), []];
TRACE_1("",_loaded);

_control ctrlRemoveAllEventHandlers "SetFocus";

// Init cargo list
private _listbox = _control controlsGroupCtrl 80086;

{
    private _class = if (_x isEqualType "") then {_x} else {typeOf _x};
    private _displayName = getText (configFile >> "CfgVehicles" >> _class >> "displayName");
    _listbox lbAdd _displayName;
} forEach _loaded;

// Init unload button
private _button = _control controlsGroupCtrl 80087;

private _fnc_onButtonUnload = {
    params ["_button"];

    // Validate vehicle
    private _vehicle = GETMVAR(BIS_fnc_initCuratorAttributes_target,objNull);
    if (isNull _vehicle || {!alive _vehicle}) exitWith {
        LOG("Vehicle deleted or killed, cannot unload");
    };

    // Handle selection
    private _index = lbCurSel ((ctrlParent _button) displayCtrl 80086);
    private _cargoArray = _vehicle getVariable [QEGVAR(cargo,loaded), []];
    if ((_index < 0) || {_index >= (count _cargoArray)}) exitWith {
        [LSTRING(SelectCargo)] call FUNC(showMessage);
    };

    // Unload selected cargo
    private _item = _cargoArray select _index;
    private _class = if (_item isEqualType "") then {_item} else {typeOf _item};
    private _itemName = getText (configFile >> "CfgVehicles" >> _class >> "displayName");
    if ([_item, _vehicle] call EFUNC(cargo,unloadItem)) then {
        private _vehicleName = getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName");
        private _message = [localize ELSTRING(cargo,UnloadedItem), "<br/>", " "] call CBA_fnc_replace;
        [_message, _itemName, _vehicleName] call FUNC(showMessage);
    } else {
        private _message = [localize ELSTRING(cargo,UnloadingFailed), "<br/>", " "] call CBA_fnc_replace;
        [_message, _itemName] call FUNC(showMessage);
    };
};

_button ctrlAddEventHandler ["ButtonClick", _fnc_onButtonUnload];

// Add PFH to update cargo list
[{
    params ["_args", "_pfhID"];
    _args params ["_vehicle", "_listbox"];

    // Display closed or vehicle deleted
    if (isNull _listbox || {isNull _vehicle || {!alive _vehicle}}) exitWith {
        [_pfhID] call CBA_fnc_removePerFrameHandler;
        LOG("Display closed or vehicle deleted, PFH removed");
    };

    // Update cargo list
    private _loaded = _vehicle getVariable [QEGVAR(cargo,loaded), []];

    lbClear _listbox;
    {
        private _class = if (_x isEqualType "") then {_x} else {typeOf _x};
        private _displayName = getText (configFile >> "CfgVehicles" >> _class >> "displayName");
        _listbox lbAdd _displayName;
    } forEach _loaded;
}, 0.25, [_vehicle, _listbox]] call CBA_fnc_addPerFrameHandler;
