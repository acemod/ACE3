/*
 * Author: PabstMirror
 * Opens the ace_setting display for a given category
 *
 * Arguments:
 * 0: Menu <CONTROL>
 * 1: Menu Selection Array <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [menuControl, [8,1]] call ACE_optionsmenu_fnc_3den_openSettingsDisplay
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_menuCtrl", "_selectionArray"];
TRACE_2("params",_menuCtrl,_selectionArray);
_selectionArray params ["", "_menuIndex2"];

private _categoryLocalized = GVAR(categories) select _menuIndex2;
TRACE_1("",_categoryLocalized);

private _currentSavedSettings = QUOTE(ADDON) get3DENMissionAttribute "ACE_MissionSettings";
if (isNil "_currentSavedSettings") then { ACE_LOGERROR("_currentSavedSettings nil"); };

private _subCatagoriesNames = [];
private _subCatagoriesSettings = [];
{
    if ((_x select 8) == _categoryLocalized) then {

        private _xSubCatName = "";
        if (_x select 2) then { //Client Settable, put into own category at bottom
            _xSubCatName = localize LSTRING(3den_clientSetting);
        } else {
            _xSubCatName = getText (configFile >> "ACE_Settings" >> (_x select 0) >> "subCategory");
            if (_xSubCatName == "") then {
                //Lets try to guess subCategory based on setting name (will work for CBA's `GVAR` pattern but var name can be anything)
                ((_x select 0) splitString "_") params [["_varPrefix", "", [""]], ["_varComponent", "", [""]], ["_varReal", "", [""]]];
                if (_varReal != "") then {
                    _xSubCatName = toUpper format ["%1 - %2", _varPrefix, _varComponent];
                };
            };
            if (_xSubCatName == "") then { //Non Conforming var name (eg. "mySetting" instead of "ace_x_y")
                _xSubCatName = localize LSTRING(3den_Uncategorized);
            };
        };
        private _subCatIndex = _subCatagoriesNames find _xSubCatName;
        if (_subCatIndex == -1) then {
            _subCatIndex = _subCatagoriesNames pushBack _xSubCatName;
            _subCatagoriesSettings pushBack [];
        };
        (_subCatagoriesSettings select _subCatIndex) pushBack _x;
    };
} forEach EGVAR(common,settings);

//Move Client Settable to bottom of list (if present):
private _clientSettingsIndex = _subCatagoriesNames find (localize LSTRING(3den_clientSetting));
if (_clientSettingsIndex != -1) then {
    _subCatagoriesNames pushBack (_subCatagoriesNames deleteAt _clientSettingsIndex);
    _subCatagoriesSettings pushBack (_subCatagoriesSettings deleteAt _clientSettingsIndex);
};


disableSerialization;
private _display = (findDisplay 313) createDisplay QGVAR(settingsDisplay);

private _title = _display displayCtrl 200;
private _categoriesBase = _display displayCtrl 201;

if (_categoryLocalized == "") then {
    _categoryLocalized = localize LSTRING(3den_Uncategorized);
};
_title ctrlSetText format ["ACE Settings: %1", _categoryLocalized];


{
    private _subCatSettings = _subCatagoriesSettings select _forEachIndex;
    TRACE_2("",_x,count _subCatSettings);

    private _subCatBase = _display ctrlCreate [QGVAR(AttributeCategory), (10 + _forEachIndex), _categoriesBase];
    private _subCatMinimize = _subCatBase controlsGroupCtrl 7001;
    private _subCatTitle = _subCatBase controlsGroupCtrl 7002;
    private _subCatControlGroup = _subCatBase controlsGroupCtrl 7003;

    _subCatMinimize cbSetChecked true;

    _subCatTitle ctrlSetText format ["%1", _x];
    _subCatTitle buttonSetAction QUOTE(_this call FUNC(3den_resizeSubcatagoies););

    private _totalY = 0;
    {
        _x params ["_varName", "_typeName", "", "_locName", "_locDescrp", "_possibleValues", "", "_defaultValue"];
        private _ctrlType = switch (toUpper _typeName) do {
        case ("SCALAR"): {if (_possibleValues isEqualTo []) then {QGVAR(scalar)} else {QGVAR(scalarCombo)};};
        case ("BOOL"): {QGVAR(bool)};
            //ToDo: Color/Array: really not nessacary for now (not in modules) - possibly add a few general colors??
            default {""};
        };
        TRACE_4("",_varName,_typeName,_ctrlType,_possibleValues);
        if (_ctrlType != "") then {

            //See if we have set this value in the mission attributes and load that value and set forced flag
            private _currentValue = _defaultValue;
            private _currentForced = false;
            {
                _x params ["_xVarName", "_xValue"];
                if (_xVarName == _varName) exitWith {
                    _currentValue = _xValue;
                    _currentForced = true;
                    TRACE_1("found",_currentForced);
                };
            } forEach _currentSavedSettings;


            _settingGroup = _display ctrlCreate [_ctrlType, (10000 + _forEachIndex), _subCatControlGroup];

            (ctrlPosition _settingGroup) params ["", "", "_width", "_height"];
            _settingGroup ctrlSetPosition [0, _totalY, _width, _height];
            _settingGroup ctrlCommit 0;
            _totalY = _totalY + _height + pixelH;

            private _check = _settingGroup controlsGroupCtrl 1000;
            private _title = _settingGroup controlsGroupCtrl 2000;
            private _value = _settingGroup controlsGroupCtrl 3000;

            _settingGroup setVariable [QGVAR(varName), _varName];

            if (_locName == "") then {_locName = _varName};
            _title ctrlSetText _locName;
            _title ctrlSetTooltip _locDescrp;

            switch (_ctrlType) do {
            case (QGVAR(scalar)): {
                    _value ctrlSetText str _currentValue;
                };
            case (QGVAR(bool)): {
                    _value lbSetCurSel ([0,1] select _currentValue);
                };
            case (QGVAR(scalarCombo)): {
                    {
                        _value lbAdd _x;
                    } forEach _possibleValues;
                    _value lbSetCurSel _currentValue;
                };
            };
            _check cbSetChecked _currentForced;
            _check ctrlSetTooltip format ["Check to set: %1",_varName];
        };
    } forEach _subCatSettings;

    private _cgPos = ctrlPosition _subCatControlGroup;
    _cgPos set [3, _totalY];
    TRACE_2("Setting Height",_x,_totalY);
    _subCatControlGroup setVariable [QGVAR(height), _totalY]; //resize will use this to restore full height
    _subCatControlGroup ctrlSetPosition _cgPos;
    _subCatControlGroup ctrlCommit 0;

} forEach _subCatagoriesNames;

[] call FUNC(3den_resizeSubcatagoies);
