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

private _currentUser = _aircraft getVariable [QGVAR(currentUser), objNull];
if (!isNull _currentUser) exitWith {
    [format [localize LSTRING(InUse), name _currentUser], false, 5] call EFUNC(common,displayText);
};
_aircraft setVariable [QGVAR(currentUser), ace_player, true];
GVAR(currentAircraftNamespace) setVariable [getPlayerUID ace_player, _aircraft, true];
[_aircraft, "blockEngine", QUOTE(ADDON), true] call EFUNC(common,statusEffect_set);

GVAR(currentAircraft) = _aircraft;

createDialog QGVAR(DialogLoadout);
private _display = findDisplay 654654;
_display displayAddEventHandler ["Unload", LINKFUNC(onButtonClose)];

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
    private _combo = _display ctrlCreate ["RscCombo", -1];
    private _picturePos = ctrlPosition (_display displayCtrl 111);
    private _uiPos = getArray (_x >> "UIposition");
    _combo ctrlSetPosition [
        (_picturePos select 0) + (_uiPos select 0),
        (_picturePos select 1) + (_uiPos select 1),
        0.1 * safezoneW,
        0.028 * safezoneH
    ];
    _combo ctrlCommit 0;

    _combo lbAdd localize LSTRING(Empty);
    _combo lbSetData [0, ""];

    private _mag = (getPylonMagazines _aircraft) select _forEachIndex;
    private _mags = _aircraft getCompatiblePylonMagazines (_forEachIndex + 1);
    private _index = 0;
    {
        _combo lbAdd getText (configFile >> "CfgMagazines" >> _x >> "displayName");
        _combo lbSetData [_forEachIndex + 1, _x];

        if (_x == _mag) then {
            _index = _forEachIndex + 1;
        };
    } forEach _mags;
    _combo lbSetCurSel _index;
    _combo ctrlAddEventHandler ["LBSelChanged", LINKFUNC(onComboSelChange)];
    // TODO: Allow pylon priority selection?

    private _mirroredIndex = [_x >> "mirroredMissilePos", "number", 0] call CBA_fnc_getConfigEntry;

    private _icon = controlNull;
    if (!GVAR(rearmNewPylons)) then {
        _icon = _display ctrlCreate ["RscPicture", -1];
        _icon ctrlSetPosition [
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
_edit ctrlAddEventHandler ["KeyUp", LINKFUNC(onNameChange)];
_edit ctrlAddEventHandler ["KeyDown", LINKFUNC(onNameChange)];

private _checkbox = _display displayCtrl 130;
_checkbox ctrlAddEventHandler ["CheckedChanged", {[(_this select 1) == 1] call FUNC(onPylonMirror)}];
