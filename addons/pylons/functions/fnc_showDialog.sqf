/*
* Author: 654wak654
* Shows the aircraft loadout dialog for given aircraft.
*
* Arguments:
* 0: The aircraft <OBJECT>
*
* Return Value:
* None
*
* Example:
* [vehicle ace_player] call ace_pylons_fnc_showDialog
*
* Public: Yes
*/
#include "script_component.hpp"

params ["_aircraft"];

if (!GVAR(enabled) || {!(typeOf _aircraft in GVAR(aircraftWithPylons))}) exitWith {};

createDialog QGVAR(DialogLoadout);
private _display = findDisplay 654654;
_display ctrlAddEventHandler ["Unload", {call FUNC(onButtonClose)}];

[_aircraft, "blockEngine", QUOTE(ADDON), true] call EFUNC(common,statusEffect_set);
GVAR(currentAircraft) = _aircraft;

if (GVAR(rearmNewPylons)) then {
    ctrlShow [220, false];
    ctrlShow [230, false];
} else {
    ctrlSetText [220, "    " + (ctrlText 220)]; // Spacing for the icon
};

private _config = configFile >> "CfgVehicles" >> typeOf _aircraft;
private _pylonComponent = _config >> "Components" >> "TransportPylonsComponent";

ctrlSetText [120, getText (_pylonComponent >> "uiPicture")];

GVAR(comboBoxes) = [];
{
    private _pylonConfig = _x;

    private _combo = _display ctrlCreate ["RscCombo", -1];
    private _picturePos = ctrlPosition (_display displayCtrl 111);
    private _uiPos = getArray (_pylonConfig >> "UIposition");
    _combo ctrlsetPosition [
        (_picturePos select 0) + (_uiPos select 0),
        (_picturePos select 1) + (_uiPos select 1),
        0.09 * safezoneW,
        0.028 * safezoneH
    ];

    _combo lbAdd LSTRING(Empty);
    _combo lbSetData [0, ""];

    private _mag = (getPylonMagazines _aircraft) select _forEachIndex;
    private _mags = [_pylonConfig] call EFUNC(rearm,getHardpointMagazines);
    private _index = 0;
    {
        _combo lbAdd getText (configFile >> "CfgMagazines" >> _x >> "displayName");
        _combo lbSetData [_forEachIndex + 1, _x];
        _combo ctrlAddEventHandler ["LBSelChanged", {call FUNC(onComboSelChange)}];

        if (_mag == _x) then {
            _index = _forEachIndex + 1;
        };
    } forEach _mags;
    _combo lbSetCurSel _index;
    _combo ctrlCommit 0;

    private _mirroredIndex = [_pylonConfig >> "mirroredMissilePos", "number", 0] call CBA_fnc_getConfigEntry;

    private _icon = controlNull;
    if (!GVAR(rearmNewPylons)) then {
        _icon = _display ctrlCreate ["RscPicture", -1];
        _icon ctrlsetPosition [
            (_picturePos select 0) + (_uiPos select 0) - (0.0131354 * safezoneW),
            (_picturePos select 1) + (_uiPos select 1),
            0.0131354 * safezoneW,
            0.028 * safezoneH
        ];
        _icon ctrlCommit 0;
    };

    GVAR(comboBoxes) pushBack [_combo, _mirroredIndex - 1, _icon, _index];
} forEach ("true" configClasses (_pylonComponent >> "Pylons"));

GVAR(defaultLoadoutNames) = [];

{
    lbAdd [160, getText (_x >> "displayName")];
    lbSetPicture [160, _forEachIndex, "a3\data_f_jets\logos\jets_logo_small_ca.paa"];
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
_edit ctrlAddEventHandler ["KeyDown", {call FUNC(onNameChange)}];

private _checkbox = _display displayCtrl 130;
_checkbox ctrlAddEventHandler ["CheckedChanged", {[(_this select 1) == 1] call FUNC(onPylonMirror)}];
