/*
 * Author: commy2
 * Checks if the vehicles class already has the actions initialized, otherwise add all available repair options. Calleed from init EH.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [vehicle] call ace_repair_fnc_addRepairActions
 *
 * Public: No
 */
#define DEBUG_MODE_FULL
#include "script_component.hpp"
#define TRACK_HITPOINTS ["HitLTrack", "HitRTrack"]

params ["_vehicle"];
TRACE_1("params", _vehicle);

if (typeOf _vehicle != "O_Heli_Transport_04_F") exitWith {}; // test

private ["_type", "_initializedClasses"];

_type = typeOf _vehicle;

_initializedClasses = GETMVAR(GVAR(initializedClasses),[]);

// do nothing if the class is already initialized
if (_type in _initializedClasses) exitWith {};
// get all hitpoints
private "_hitPoints";
_hitPoints = [_vehicle] call EFUNC(common,getHitPointsWithSelections) select 0;

// get hitpoints of wheels with their selections
private ["_wheelHitPointsWithSelections", "_wheelHitPoints", "_wheelHitPointSelections"];

_wheelHitPointsWithSelections = [_vehicle] call FUNC(getWheelHitPointsWithSelections);

_wheelHitPoints = _wheelHitPointsWithSelections select 0;
_wheelHitPointSelections = _wheelHitPointsWithSelections select 1;

private ["_hitPointsAddedNames", "_hitPointsAddedStrings", "_hitPointsAddedAmount"];
_hitPointsAddedNames = [];
_hitPointsAddedStrings = [];
_hitPointsAddedAmount = [];

// add repair events to this vehicle class
{
    if (_x in _wheelHitPoints) then {
        // add wheel repair action

        private ["_icon", "_selection"];

        _icon = QUOTE(PATHTOF(ui\tire_ca.paa));
        _icon = "A3\ui_f\data\igui\cfg\actions\repair_ca.paa";
        // textDefault = "<img image='\A3\ui_f\data\igui\cfg\actions\repair_ca.paa' size='1.8' shadow=2 />";
        _selection = _wheelHitPointSelections select (_wheelHitPoints find _x);

        private ["_name", "_text", "_condition", "_statement"];

        // remove wheel action
        _name = format  ["Remove_%1", _x];
        _text = localize "STR_ACE_Repair_RemoveWheel";

        _condition = {[_this select 1, _this select 0, _this select 2 select 0, "RemoveWheel"] call DFUNC(canRepair)};
        _statement = {[_this select 1, _this select 0, _this select 2 select 0, "RemoveWheel"] call DFUNC(repair)};

        private "_action";
        _action = [_name, _text, _icon, _statement, _condition, {}, [_x], _selection, 2] call EFUNC(interact_menu,createAction);
        [_type, 0, [], _action] call EFUNC(interact_menu,addActionToClass);

        // replace wheel action
        _name = format  ["Replace_%1", _x];
        _text = localize LSTRING(ReplaceWheel);

        _condition = {[_this select 1, _this select 0, _this select 2 select 0, "ReplaceWheel"] call DFUNC(canRepair)};
        _statement = {[_this select 1, _this select 0, _this select 2 select 0, "ReplaceWheel"] call DFUNC(repair)};

        _action = [_name, _text, _icon, _statement, _condition, {}, [_x], _selection, 2] call EFUNC(interact_menu,createAction);
        [_type, 0, [], _action] call EFUNC(interact_menu,addActionToClass);

    } else {
        // exit if the hitpoint is in the blacklist, e.g. glasses
        if (_x in IGNORED_HITPOINTS) exitWith {};

        // exit if the hitpoint is virtual
        if (isText (configFile >> "CfgVehicles" >> _type >> "HitPoints" >> _x >> "depends")) exitWith {};

        // add misc repair action

        private ["_name", "_text", "_icon", "_selection", "_condition", "_statement", "_toFind", "_hitPointFoundIndex", "_combinedString"];

        _name = format ["Repair_%1", _x];

        // Prepare first part of the string from stringtable
        _text = LSTRING(Hit);

        // Remove "Hit" from hitpoint name if one exists
        _toFind = if (_x find "Hit" == 0) then {
            [_x, 3] call CBA_fnc_substr
        } else {
            _x
        };

        // Loop through always shorter part of the hitpoint name to find the string from stringtable or use an already found one
        for "_i" from 0 to (count _x) do {
            // Loop through already added hitpoints and save index
            _hitPointFoundIndex = -1;
            {
                if (_x == _toFind) exitWith {
                    _hitPointFoundIndex = _forEachIndex;
                };
            } forEach _hitPointsAddedNames;

            // Use already added hitpoint if one found above and numerize
            if (_hitPointFoundIndex != -1) exitWith {
                _text = (_hitPointsAddedNames select _hitPointFoundIndex) + " " + str(_hitPointsAddedAmount select _hitPointFoundIndex);
                _hitPointsAddedAmount set [_hitPointFoundIndex, (_hitPointsAddedAmount select _hitPointFoundIndex) + 1]; // Set amount
                TRACE_2("Same hitpoint found",_toFind,_hitPointsAddedNames);
            };

            // Localize if localization found and save all variables for possible hitpoints of same type
            _combinedString = _text + _toFind;
            if (isLocalized _combinedString) exitWith {
                // Add hitpoint to the list
                _hitPointsAddedNames pushBack _toFind;
                _hitPointsAddedStrings pushBack _combinedString;
                _hitPointsAddedAmount pushBack 2;

                // Localize text
                _text = localize _combinedString;
                TRACE_1("Hitpoint localized",_toFind);
            };

            // Cut off one character
            _toFind = [_toFind, 0, count _toFind - 1] call CBA_fnc_substr;
        };

        // Display part name directly if no string is found in stringtable
        if (_text == LSTRING(Hit)) then {
            _text = _x;
        };



        _icon = "A3\ui_f\data\igui\cfg\actions\repair_ca.paa";
        _selection = "";
        _condition = {[_this select 1, _this select 0, _this select 2 select 0, _this select 2 select 1] call DFUNC(canRepair)};
        _statement = {[_this select 1, _this select 0, _this select 2 select 0, _this select 2 select 1] call DFUNC(repair)};

        if (_x in TRACK_HITPOINTS) then {
            if (_x == "HitLTrack") then {
                _selection = [-1.75, 0, -1.75];
            } else {
                _selection = [1.75, 0, -1.75];
            };
            private "_action";
            _action = [_name, _text, _icon, _statement, _condition, {}, [_x, "RepairTrack"], _selection, 4] call EFUNC(interact_menu,createAction);
            [_type, 0, [], _action] call EFUNC(interact_menu,addActionToClass);
        } else {
            private "_action";
            _action = [_name, _text, _icon, _statement, _condition, {}, [_x, "MiscRepair"], _selection, 4] call EFUNC(interact_menu,createAction);
            [_type, 0, ["ACE_MainActions", QGVAR(Repair)], _action] call EFUNC(interact_menu,addActionToClass);
        };
    };
} forEach _hitPoints;

private ["_action", "_condition", "_statement"];

_condition = {[_this select 1, _this select 0, _this select 2 select 0, _this select 2 select 1] call DFUNC(canRepair)};
_statement = {[_this select 1, _this select 0, _this select 2 select 0, _this select 2 select 1] call DFUNC(repair)};
_action = [QGVAR(fullRepair), localize LSTRING(fullRepair), "A3\ui_f\data\igui\cfg\actions\repair_ca.paa", _statement, _condition, {}, ["", "fullRepair"], "", 4] call EFUNC(interact_menu,createAction);
[_type, 0, ["ACE_MainActions", QGVAR(Repair)], _action] call EFUNC(interact_menu,addActionToClass);
// set class as initialized
_initializedClasses pushBack _type;

SETMVAR(GVAR(initializedClasses),_initializedClasses);
