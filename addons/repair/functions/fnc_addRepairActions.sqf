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
#include "script_component.hpp"
#define TRACK_HITPOINTS ["HitLTrack", "HitRTrack"]

params ["_vehicle"];
TRACE_1("params", _vehicle);

private ["_type", "_initializedClasses"];

_type = typeOf _vehicle;

_initializedClasses = GETMVAR(GVAR(initializedClasses),[]);

// do nothing if the class is already initialized
if (_type in _initializedClasses) exitWith {};

// get all hitpoints and selections
([_vehicle] call EFUNC(common,getHitPointsWithSelections)) params ["_hitPoints", "_hitPointsSelections"];

// get hitpoints of wheels with their selections
([_vehicle] call FUNC(getWheelHitPointsWithSelections)) params ["_wheelHitPoints", "_wheelHitPointSelections"];


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

        private ["_name", "_text", "_icon", "_selection", "_customSelectionsConfig", "_currentHitpoint", "_condition", "_statement"];

        _name = format ["Repair_%1", _x];

        _text = format ["STR_ACE_Repair_%1", _x];

        if (isLocalized _text) then {
            _text = format [localize LSTRING(RepairHitpoint), localize _text];
        } else {
            _text = format [localize LSTRING(RepairHitpoint), _x];
        };

        _icon = "A3\ui_f\data\igui\cfg\actions\repair_ca.paa";

        _selection = "";

        // Get custom position if available
        _customSelectionsConfig = configFile >> "CfgVehicles" >> _type >> QGVAR(hitpointPositions);
        if (isArray _customSelectionsConfig) then {
            // Loop through custom hitpoint positions array
            _currentHitpoint = _x;
            {
                _x params ["_hitpoint", "_position"];
                // Exit with supplied custom position when same hitpoint name found or print RPT error if it's invalid
                if (_hitpoint == _currentHitpoint) exitWith {
                    if (typeName _position == "ARRAY") exitWith {
                        _selection = _position; // Position in model space
                    };
                    if (typeName _position == "STRING") exitWith {
                        _selection = _vehicle selectionPosition _position; // Selection name
                    };
                    ACE_LOGERROR_3("Invalid custom position %1 of hitpoint %2 in vehicle %3.",_position,_hitpoint,_vehicle);
                };
            } forEach (getArray _customSelectionsConfig);
        };

        // If position still empty (not a position array or selection name) try extracting from model
        if (typeName _selection == "STRING" && {_selection == ""}) then {
            _selection = _vehicle selectionPosition (_hitPointsSelections select (_hitPoints find _x));
        };

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
            // Put inside main actions if no other position was found above
            if (_selection isEqualTo [0, 0, 0]) then {
                [_type, 0, ["ACE_MainActions", QGVAR(Repair)], _action] call EFUNC(interact_menu,addActionToClass);
            } else {
                [_type, 0, [], _action] call EFUNC(interact_menu,addActionToClass);
            };
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
