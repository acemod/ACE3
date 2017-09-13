/*
 * Author: 654wak654
 * Shows the aircraft loadout dialog for given aircraft
 *
 * Arguments:
 * 0: The aircraft <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [vehicle ace_player] call ace_aircraft_fnc_showDialog
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_aircraft"];

GVAR(currentAircraft) = _aircraft;

createDialog QGVAR(DialogLoadout);

private _config = configFile >> "CfgVehicles" >> typeOf _aircraft;
private _pylonComponent = _config >> "Components" >> "TransportPylonsComponent";

ctrlSetText [120, getText (_pylonComponent >> "uiPicture")];

private _display = findDisplay 654654;

GVAR(comboBoxes) = [];
{
    private _pylon = _x;
    private _ctrl = _display ctrlCreate ["RscCombo", -1];

    private _uiPos = getArray (_pylon >> "UIposition");
    private _picturePos = ctrlPosition (_display displayCtrl 111);
    _ctrl ctrlsetPosition [
        (_picturePos select 0) + (_uiPos select 0),
        (_picturePos select 1) + (_uiPos select 1),
        0.100000 * safezoneW,
        0.028 * safezoneH
    ];

    _ctrl lbAdd "<empty>";
    _ctrl lbSetData [0, ""];

    private _mag = (getPylonMagazines _aircraft) select _forEachIndex;
    private _mags = [_pylon] call EFUNC(rearm,getHardpointMagazines);
    private _index = 0;
    {
        _ctrl lbAdd getText (configFile >> "CfgMagazines" >> _x >> "displayName");
        _ctrl lbSetData [_forEachIndex + 1, _x];
        _ctrl ctrlAddEventHandler ["LBSelChanged", {call FUNC(onComboSelChange)}];

        if (_mag == _x) then {
            _index = _forEachIndex + 1;
        };
    } forEach _mags;
    _ctrl lbSetCurSel _index;

    _ctrl ctrlCommit 0;

    private _mirroredIndex = if (isNumber (_pylon >> "mirroredMissilePos")) then {getNumber (_pylon >> "mirroredMissilePos")} else {0};
    GVAR(comboBoxes) pushBack [_ctrl, _mirroredIndex - 1];
} forEach ("true" configClasses (_pylonComponent >> "Pylons"));

GVAR(defaultLoadoutNames) = [];

{
    lbAdd [160, getText (_x >> "displayName")];
    GVAR(defaultLoadoutNames) pushBack getText (_x >> "displayName");
} forEach ("true" configClasses (_pylonComponent >> "Presets"));

{
    if ((_x select 2) == typeOf _aircraft) then {
        lbAdd [160, _x select 0];
    };
} forEach (profileNamespace getVariable [QGVAR(aircraftLoadouts), []]);

private _displayName = getText (_config >> "displayName"); 
ctrlSetText [150, format [localize LSTRING(LoadoutsFor), _displayName]];

private _list = _display displayCtrl 160;
_list ctrlAddEventHandler ["LBSelChanged", {
    params ["_ctrl"];

    ctrlSetText [170, _ctrl lbText (lbCurSel _ctrl)];
    call FUNC(onNameChange);
}];

private _edit = _display displayCtrl 170;
_edit ctrlAddEventHandler ["KeyUp", {call FUNC(onNameChange)}];

private _checkbox = _display displayCtrl 130;
_checkbox ctrlAddEventHandler ["CheckedChanged", {[(_this select 1) == 1] call FUNC(onPylonMirror)}];
