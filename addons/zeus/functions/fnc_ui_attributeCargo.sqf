/*
 * Author: PabstMirror, mharis001
 * Initalises the ace_cargo attribute of the zeus vehicle attributes display
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
#include "script_component.hpp"

params ["_control"];
TRACE_1("params",_control);

private _veh = GETMVAR(BIS_fnc_initCuratorAttributes_target,objNull);
TRACE_1("",_veh);

private _loaded = _veh getVariable [QEGVAR(cargo,loaded), []];
TRACE_1("",_loaded);

_control ctrlRemoveAllEventHandlers "setFocus";

private _listbox = _control controlsGroupCtrl 80086;

{
    private _class = if (_x isEqualType "") then {_x} else {typeOf _x};
    private _displayName = getText (configFile >> "CfgVehicles" >> _class >> "displayName");
    _listbox lbAdd _displayName;
} forEach _loaded;
