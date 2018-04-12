/*
 * Author: commy2, SilentSpike
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

if (!hasInterface) exitWith {};

params ["_vehicle"];
TRACE_2("params", _vehicle,typeOf _vehicle);

private _type = typeOf _vehicle;

private _initializedClasses = GETMVAR(GVAR(initializedClasses),[]);

// do nothing if the class is already initialized
if (_type in _initializedClasses) exitWith {};

// get all hitpoints and selections
(getAllHitPointsDamage _vehicle) params [["_hitPoints", []], ["_hitSelections", []]];  // Since 1.82 these are all lower case

// get hitpoints of wheels with their selections
([_vehicle] call FUNC(getWheelHitPointsWithSelections)) params ["_wheelHitPoints", "_wheelHitSelections"];

private _hitPointsAddedNames = [];
private _hitPointsAddedStrings = [];
private _hitPointsAddedAmount = [];
private _processedHitpoints = [];
private _icon = QPATHTOF(ui\repair_0_ca.paa);

{
    private _selection = _x;
    private _hitpoint = toLower (_hitPoints select _forEachIndex);

    if (_selection in _wheelHitSelections) then {
        // Wheels should always be unique
        if (_hitpoint in _processedHitpoints) exitWith {TRACE_3("Duplicate Wheel",_hitpoint,_forEachIndex,_selection);};

        private _position = compile format ["_target selectionPosition ['%1', 'HitPoints'];", _selection];

        TRACE_3("Adding Wheel Actions",_hitpoint,_forEachIndex,_selection);

        // An action to remove the wheel is required
        private _name = format ["Remove_%1_%2", _forEachIndex, _hitpoint];
        private _text = localize LSTRING(RemoveWheel);
        private _condition = {[_this select 1, _this select 0, _this select 2 select 0, "RemoveWheel"] call DFUNC(canRepair)};
        private _statement = {[_this select 1, _this select 0, _this select 2 select 0, "RemoveWheel"] call DFUNC(repair)};
        private _action = [_name, _text, _icon, _statement, _condition, {}, [_hitpoint], _position, 2, nil, FUNC(modifySelectionInteraction)] call EFUNC(interact_menu,createAction);
        [_type, 0, [], _action] call EFUNC(interact_menu,addActionToClass);

        // An action to replace the wheel is required
        _name = format ["Replace_%1_%2", _forEachIndex, _hitpoint];
        _text = localize LSTRING(ReplaceWheel);
        _condition = {[_this select 1, _this select 0, _this select 2 select 0, "ReplaceWheel"] call DFUNC(canRepair)};
        _statement = {[_this select 1, _this select 0, _this select 2 select 0, "ReplaceWheel"] call DFUNC(repair)};
        _action = [_name, _text, _icon, _statement, _condition, {}, [_hitpoint], _position, 2] call EFUNC(interact_menu,createAction);
        [_type, 0, [], _action] call EFUNC(interact_menu,addActionToClass);
    } else {
        //Skip glass hitpoints
        if ((_hitPoint find "glass") != -1) exitWith {
            TRACE_3("Skipping Glass",_hitpoint,_forEachIndex,_selection);
        };
        // Empty selections don't exist
        // Empty hitpoints don't contain enough information
        if (_selection isEqualTo "") exitWith { TRACE_3("Selection Empty",_hitpoint,_forEachIndex,_selection); };
        if (_hitpoint isEqualTo "") exitWith { TRACE_3("Hitpoint Empty",_hitpoint,_forEachIndex,_selection); };
        //Depends hitpoints shouldn't be modified directly (will be normalized)
        // Biki: Clearing 'depends' in case of inheritance cannot be an empty string (rpt warnings), but rather a "0" value.
        if (!((getText (configFile >> "CfgVehicles" >> _type >> "HitPoints" >> _hitpoint >> "depends")) in ["", "0"])) exitWith {
            TRACE_3("Skip Depends",_hitpoint,_forEachIndex,_selection);
        };

        // Associated hitpoints can be grouped via config to produce a single repair action
        private _groupsConfig = configFile >> "CfgVehicles" >> _type >> QGVAR(hitpointGroups);
        private _childHitPoint = false;
        if (isArray _groupsConfig) then {
            {
                {
                    if (_hitpoint == _x) exitWith {
                        _childHitPoint = true;
                    };
                } forEach (_x select 1);
            } forEach (getArray _groupsConfig);
        };
        // If the current selection is associated with a child hitpoint, then skip
        if (_childHitPoint) exitWith { TRACE_3("childHitpoint",_hitpoint,_forEachIndex,_selection); };

        // Find the action position
        private _position = compile format ["_target selectionPosition ['%1', 'HitPoints'];", _selection];

        // Custom position can be defined via config for associated hitpoint
        private _positionsConfig = configFile >> "CfgVehicles" >> _type >> QGVAR(hitpointPositions);
        if (isArray _positionsConfig) then {
            {
                _x params ["_hit", "_pos"];
                if (_hitpoint == _hit) exitWith {
                    if (_pos isEqualType []) exitWith {
                        _position = _pos; // Position in model space
                    };
                    if (_pos isEqualType "") exitWith {
                        _position = compile format ["_target selectionPosition ['%1', 'HitPoints'];", _pos];
                    };
                    ERROR_3("Invalid custom position %1 of hitpoint %2 in vehicle %3.",_position,_hitpoint,_type);
                };
            } forEach (getArray _positionsConfig);
        };

        // Prepair the repair action
        private _name = format ["Repair_%1_%2", _forEachIndex, _selection];

        // Find localized string and track those added for numerization
        ([_hitpoint, "%1", _hitpoint, [_hitPointsAddedNames, _hitPointsAddedStrings, _hitPointsAddedAmount]] call FUNC(getHitPointString)) params ["_text", "_trackArray"];
        _hitPointsAddedNames = _trackArray select 0;
        _hitPointsAddedStrings = _trackArray select 1;
        _hitPointsAddedAmount = _trackArray select 2;

        if (_hitpoint in TRACK_HITPOINTS) then {
            // Tracks should always be unique
            if (_hitpoint in _processedHitpoints) exitWith {TRACE_3("Duplicate Track",_hitpoint,_forEachIndex,_selection);};
            if (_hitpoint == "HitLTrack") then {
                _position = compile format ["private _return = _target selectionPosition ['%1', 'HitPoints']; _return set [1, 0]; _return", _selection];
            } else {
                _position = compile format ["private _return = _target selectionPosition ['%1', 'HitPoints']; _return set [1, 0]; _return", _selection];
            };
            TRACE_4("Adding RepairTrack",_hitpoint,_forEachIndex,_selection,_text);
            private _condition = {[_this select 1, _this select 0, _this select 2 select 0, "RepairTrack"] call DFUNC(canRepair)};
            private _statement = {[_this select 1, _this select 0, _this select 2 select 0, "RepairTrack"] call DFUNC(repair)};
            private _action = [_name, _text, _icon, _statement, _condition, {}, [_hitpoint], _position, 4] call EFUNC(interact_menu,createAction);
            [_type, 0, [], _action] call EFUNC(interact_menu,addActionToClass);
        } else {
            TRACE_4("Adding MiscRepair",_hitpoint,_forEachIndex,_selection,_text);
            private _condition = {[_this select 1, _this select 0, _this select 2 select 0, "MiscRepair"] call DFUNC(canRepair)};
            private _statement = {[_this select 1, _this select 0, _this select 2 select 0, "MiscRepair"] call DFUNC(repair)};
            private _action = [_name, _text, _icon, _statement, _condition, {}, [_forEachIndex], _position, 5] call EFUNC(interact_menu,createAction);
            // Put inside main actions if no other position was found above
            if (_position isEqualTo [0,0,0]) then {
                [_type, 0, ["ACE_MainActions", QGVAR(Repair)], _action] call EFUNC(interact_menu,addActionToClass);
            } else {
                [_type, 0, [], _action] call EFUNC(interact_menu,addActionToClass);
            };
        };

        _processedHitPoints pushBack _hitPoint;
    };
} forEach _hitSelections;

private _condition = {[_this select 1, _this select 0, "", "fullRepair"] call DFUNC(canRepair)};
private _statement = {[_this select 1, _this select 0, "", "fullRepair"] call DFUNC(repair)};
private _action = [QGVAR(fullRepair), localize LSTRING(fullRepair), _icon, _statement, _condition, {}, [], "", 4] call EFUNC(interact_menu,createAction);
[_type, 0, ["ACE_MainActions", QGVAR(Repair)], _action] call EFUNC(interact_menu,addActionToClass);

// set class as initialized
_initializedClasses pushBack _type;

SETMVAR(GVAR(initializedClasses),_initializedClasses);
