/*
* Author: 654wak654
* Shows the aircraft loadout dialog for given aircraft.
*
* Arguments:
* 0: Aircraft <OBJECT>
* 1: Is curator. Disables time and resource requirements. <BOOL> (default: false)
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

params ["_aircraft", ["_isCurator", false]];

if (!GVAR(enabled) || {!(typeOf _aircraft in GVAR(aircraftWithPylons))}) exitWith {};

private _currentUser = _aircraft getVariable [QGVAR(currentUser), objNull];
if (!isNull _currentUser) exitWith {
    [format [localize LSTRING(InUse), name _currentUser], false, 5] call EFUNC(common,displayText);
};
_aircraft setVariable [QGVAR(currentUser), ace_player, true];
GVAR(currentAircraftNamespace) setVariable [getPlayerUID ace_player, _aircraft, true];

GVAR(isCurator) = _isCurator;
GVAR(currentAircraft) = _aircraft;

createDialog QGVAR(DialogLoadout);
private _display = DISPLAY(ID_DIALOG);
_display displayAddEventHandler ["Unload", LINKFUNC(onButtonClose)];

if (GVAR(rearmNewPylons) || {_isCurator}) then {
    ctrlShow [ID_TEXT_BANNER, false];
};

private _config = configFile >> "CfgVehicles" >> typeOf _aircraft;
private _pylonComponent = _config >> "Components" >> "TransportPylonsComponent";

ctrlSetText [ID_PICTURE_AIRCRAFT, getText (_pylonComponent >> "uiPicture")];

private _hasFRIES = getNumber (_config >> QEGVAR(fastroping,enabled));
if (["ace_fastroping"] call EFUNC(common,isModLoaded) && {_hasFRIES > 1}) then {
    private _checkbox = _display displayCtrl ID_CHECKBOX_FRIES;
    private _fries = _aircraft getVariable [QEGVAR(fastroping,FRIES), objNull];
    _checkbox cbSetChecked (!isNull _fries);
    _checkbox setVariable [QGVAR(originalState), !isNull _fries];
} else {
    ctrlShow [ID_CHECKBOX_FRIES, false];
    ctrlShow [ID_TEXT_FRIES, false];
};

GVAR(comboBoxes) = [];
{
    private _combo = _display ctrlCreate [QGVAR(CtrlCombo), -1];
    private _picturePos = ctrlPosition (_display displayCtrl ID_PICTURE_AIRCRAFT);
    private _uiPos = getArray (_x >> "UIposition");
    MAP(_uiPos,if (_x isEqualType 0) then {_x} else {call compile _x}); // Handle string positions
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
    private _userWhitelist = _aircraft getVariable [QGVAR(magazineWhitelist), _mags];
    private _userBlacklist = _aircraft getVariable [QGVAR(magazineBlacklist), []];
    
    _mags = _mags arrayIntersect _userWhitelist;
    _mags = _mags - _userBlacklist;
    
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

    private _mirroredIndex = getNumber (_x >> "mirroredMissilePos");

    private _button = controlNull;
    if (count allTurrets [_aircraft, false] > 0) then {
        _button = _display ctrlCreate ["ctrlButtonPictureKeepAspect", -1];
        private _turret = [_aircraft, _forEachIndex] call EFUNC(common,getPylonTurret);
        [_button, false, _turret] call FUNC(onButtonTurret);
        _button ctrlAddEventHandler ["ButtonClick", {[_this select 0, true, []] call FUNC(onButtonTurret)}];
        _button ctrlSetPosition [
            (_picturePos select 0) + (_uiPos select 0) - (0.0165 * safezoneW),
            (_picturePos select 1) + (_uiPos select 1),
            0.0165 * safezoneW,
            0.028 * safezoneH
        ];
        _button ctrlCommit 0;
    };

    GVAR(comboBoxes) pushBack [_combo, _mirroredIndex - 1, _button, _index];
} forEach ("true" configClasses (_pylonComponent >> "Pylons"));

GVAR(defaultLoadoutNames) = [];
{
    lbAdd [ID_LIST_LOADOUTS, getText (_x >> "displayName")];
    lbSetPicture [ID_LIST_LOADOUTS, _forEachIndex, "a3\data_f_jets\logos\jets_logo_small_ca.paa"];

    GVAR(defaultLoadoutNames) pushBack getText (_x >> "displayName");
} forEach ("true" configClasses (_pylonComponent >> "Presets"));

{
    if ((_x select 3) == typeOf _aircraft) then {
        lbAdd [ID_LIST_LOADOUTS, _x select 0];
    };
} forEach (profileNamespace getVariable [QGVAR(aircraftLoadouts), []]);

private _displayName = getText (_config >> "displayName");
ctrlSetText [ID_TEXT_LISTTITLE, format [localize LSTRING(LoadoutsFor), _displayName]];

private _list = _display displayCtrl ID_LIST_LOADOUTS;
_list ctrlAddEventHandler ["LBSelChanged", {
    params ["_ctrl"];

    ctrlSetText [ID_EDIT_LOADOUTNAME, _ctrl lbText (lbCurSel _ctrl)];
    call FUNC(onNameChange);
}];

private _edit = _display displayCtrl ID_EDIT_LOADOUTNAME;
_edit ctrlAddEventHandler ["KeyUp", LINKFUNC(onNameChange)];
_edit ctrlAddEventHandler ["KeyDown", LINKFUNC(onNameChange)];

private _checkbox = _display displayCtrl ID_CHECKBOX_MIRROR;
_checkbox ctrlAddEventHandler ["CheckedChanged", {[(_this select 1) == 1] call FUNC(onPylonMirror)}];

if (!GVAR(isCurator)) then {
    [{
        isNull (GVAR(currentAircraft) getVariable [QGVAR(currentUser), objNull]) ||
        {(ace_player distanceSqr GVAR(currentAircraft)) > GVAR(searchDistanceSqr)}
    }, {
        TRACE_3("disconnect/far",GVAR(currentAircraft),ace_player distance GVAR(currentAircraft),GVAR(currentAircraft) getVariable QGVAR(currentUser));
        if ((ace_player distanceSqr GVAR(currentAircraft)) > GVAR(searchDistanceSqr)) then {
            [localize LSTRING(TooFar), false, 5] call EFUNC(common,displayText);
        };
        call FUNC(onButtonClose);
    }] call CBA_fnc_waitUntilAndExecute;
};
