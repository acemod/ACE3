#include "script_component.hpp"
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

if (!hasInterface) exitWith {};

params ["_vehicle"];
private _type = typeOf _vehicle;
TRACE_2("addRepairActions", _vehicle,_type);

// do nothing if the class is already initialized
private _initializedClasses = GETMVAR(GVAR(initializedClasses),[]);
if (_type in _initializedClasses) exitWith {};

// get all hitpoints and selections
(getAllHitPointsDamage _vehicle) params [["_hitPoints", []], ["_hitSelections", []]];  // Since 1.82 these are all lower case

// get hitpoints of wheels with their selections
([_vehicle] call FUNC(getWheelHitPointsWithSelections)) params ["_wheelHitPoints", "_wheelHitSelections"];

private _hitPointsAddedNames = [];
private _hitPointsAddedStrings = [];
private _hitPointsAddedAmount = [];
private _processedSelections = [];
private _icon = ["a3\ui_f\data\igui\cfg\actions\repair_ca.paa", "#FFFFFF"];

private _vehCfg = configOf _vehicle;
// Custom position can be defined via config for associated hitpoint
private _hitpointPositions = getArray (_vehCfg >> QGVAR(hitpointPositions));
// Associated hitpoints can be grouped via config to produce a single repair action
private _hitpointGroups = getArray (_vehCfg >> QGVAR(hitpointGroups));
// Get turret paths
private _turretPaths = ((fullCrew [_vehicle, "gunner", true]) + (fullCrew [_vehicle, "commander", true])) apply {_x # 3};

{
    private _selection = _x;
    private _hitpoint = toLower (_hitPoints select _forEachIndex);
    if (_selection in _wheelHitSelections) then {
        // Wheels should always be unique
        if (_selection in _processedSelections) exitWith {TRACE_3("Duplicate Wheel",_hitpoint,_forEachIndex,_selection);};

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

        _processedSelections pushBack _selection;
    } else {
        // Empty hitpoints don't contain enough information
        if (_hitpoint isEqualTo "") exitWith { TRACE_3("Skipping Empty Hit",_hitpoint,_forEachIndex,_selection); };
        // Ignore glass hitpoints
        if ((_hitpoint find "glass") != -1) exitWith { TRACE_3("Skipping Glass",_hitpoint,_forEachIndex,_selection); };
        // Ignore hitpoints starting with # (seems to be lights)
        if ((_hitpoint select [0,1]) == "#") exitWith { TRACE_3("Skipping # hit",_hitpoint,_forEachIndex,_selection); };
        // Ignore ERA/Slat armor (vanilla uses hitera_/hitslat_, pre-1.82 RHS uses era_)
        // ToDo: see how community utilizes new armor system, could also check getText (_hitpointConfig >> "simulation")
        if (((_hitpoint select [0,7]) == "hitera_") || {(_hitpoint select [0,8]) == "hitslat_"} || {(_hitpoint select [0,4]) == "era_"}) exitWith { TRACE_3("Skipping ERA/SLAT",_hitpoint,_forEachIndex,_selection); };

        // Some hitpoints do not have a selection but do have an armorComponent value (seems to mainly be RHS)
        // Ref https://community.bistudio.com/wiki/Arma_3_Damage_Enhancement
        // this code won't support identically named hitpoints (e.g. commander turret: Duplicate HitPoint name 'HitTurret')
        private _armorComponent = "";
        if (_selection == "") then {
            {
                private _turretHitpointCfg = ([_vehCfg, _x] call CBA_fnc_getTurret) >> "HitPoints";
                private _hitpointsCfg = "configName _x == _hitpoint" configClasses _turretHitpointCfg;
                if (_hitpointsCfg isNotEqualTo []) exitWith {
                    TRACE_2("turret hitpoint configFound",_hitpoint,_x);
                     // only do turret hitpoints or stuff linked to visuals for now or we apparently get some weird stuff
                    if ((_hitpoint in ["hitturret", "hitgun"]) || {(getNumber (_hitpointsCfg # 0 >> "isGun")) == 1} || {(getNumber (_hitpointsCfg # 0 >> "isTurret")) == 1} || {(getText (_hitpointsCfg # 0 >> "visual")) != ""}) then {
                        _armorComponent = getText (_hitpointsCfg # 0 >> "armorComponent");
                    };
                };
            } forEach _turretPaths;
            if (_armorComponent == "") then {
                private _hitpointsCfg = "configName _x == _hitpoint" configClasses (_vehCfg >> "HitPoints");
                if ((getText (_hitpointsCfg # 0 >> "visual")) != "") then {
                    _armorComponent = getText (_hitpointsCfg # 0 >> "armorComponent");
                };
            };
            if (_armorComponent != "") then { INFO_3("%1: %2 no selection: using armorComponent %3",_type,_hitpoint,_armorComponent); };
        };
        if ((_selection == "") && {_armorComponent == ""}) exitWith { TRACE_3("Skipping no selection OR armor component",_hitpoint,_forEachIndex,_selection); };


        //Depends hitpoints shouldn't be modified directly (will be normalized)
        // Biki: Clearing 'depends' in case of inheritance cannot be an empty string (rpt warnings), but rather a "0" value.
        if (!((getText (_vehCfg >> "HitPoints" >> _hitpoint >> "depends")) in ["", "0"])) exitWith {
            TRACE_3("Skip Depends",_hitpoint,_forEachIndex,_selection);
        };

        private _childHitPoint = false;
        {
            {
                if (_hitpoint == _x) exitWith {
                    _childHitPoint = true;
                };
            } forEach (_x select 1);
        } forEach _hitpointGroups;
        // If the current selection is associated with a child hitpoint, then skip
        if (_childHitPoint) exitWith { TRACE_3("childHitpoint",_hitpoint,_forEachIndex,_selection); };

        // Find the action position
        private _position = compile format ["_target selectionPosition ['%1', 'HitPoints'];", _selection];
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
        } forEach _hitpointPositions;

        // if no selection then use the FireLOD to position the action
        if ((_selection == "") && {_position isEqualTo {_target selectionPosition ['', 'HitPoints'];}}) then {
            if ((_vehicle selectionPosition [_armorComponent, "FireGeometry"]) isEqualTo [0,0,0]) then {
                WARNING_3("[%1: %2: %3] armorComponent does not exist?",_type,_hitpoint,_armorComponent);
                _position = [0,0,0]; // just stick it on mainActions
            } else {
                _position = compile format ["_target selectionPosition ['%1', 'FireGeometry'];", _armorComponent];
            };
            TRACE_1("using armorComponent position",_position);
        };

        // Prepare the repair action
        private _name = format ["Repair_%1_%2", _forEachIndex, _selection];

        // Find localized string and track those added for numerization
        ([_hitpoint, "%1", _hitpoint, [_hitPointsAddedNames, _hitPointsAddedStrings, _hitPointsAddedAmount]] call FUNC(getHitPointString)) params ["_text", "_trackArray"];
        _hitPointsAddedNames = _trackArray select 0;
        _hitPointsAddedStrings = _trackArray select 1;
        _hitPointsAddedAmount = _trackArray select 2;

        if (_hitpoint in TRACK_HITPOINTS) then {
            // Tracks should always be unique
            if (_selection in _processedSelections) exitWith {TRACE_3("Duplicate Track",_hitpoint,_forEachIndex,_selection);};
            _position = compile format ["private _return = _target selectionPosition ['%1', 'HitPoints']; _return set [1, 0]; _return", _selection];
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

        _processedSelections pushBack _selection;
    };
} forEach _hitSelections;

private _condition = {[_this select 1, _this select 0, "", "fullRepair"] call DFUNC(canRepair)};
private _statement = {[_this select 1, _this select 0, "", "fullRepair"] call DFUNC(repair)};
private _action = [QGVAR(fullRepair), localize LSTRING(fullRepair), _icon, _statement, _condition, {}, [], "", 4] call EFUNC(interact_menu,createAction);
[_type, 0, ["ACE_MainActions", QGVAR(Repair)], _action] call EFUNC(interact_menu,addActionToClass);

// set class as initialized
_initializedClasses pushBack _type;

SETMVAR(GVAR(initializedClasses),_initializedClasses);
