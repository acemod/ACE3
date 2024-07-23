#include "..\script_component.hpp"
/*
 * Author: commy2, kymckay, LinkIsGrim
 * Get list of vehicle hitpoints to ignore and depends hitpoints
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * 0: HitPoint indexes to ignore <ARRAY>
 * 1: Depends hitpoints with parents <HASHMAP>
 *   <KEY>: Depends Index <NUMBER>
 *   <VALUE>: Parent Index <NUMBER>
 * 2: Depends hitpoints with complex/multiple parents <HASHMAP>
 *   <KEY>: Depends Index <NUMBER>
 *   <VALUE>: Parent <ARRAY>
 *     0: Parent Hitpoint <STRING>
 *     1: Individual, valid parent hitpoints <ARRAY>
 *
 * Example:
 * [vehicle] call ace_repair_fnc_getSelectionsToIgnore
 *
 * Public: No
 */

params ["_vehicle"];

private _type = typeOf _vehicle;
TRACE_2("getSelectionsToIgnore",_vehicle,_type);
private _initializedClasses = missionNamespace getVariable [QGVAR(hitPointsToIgnoreInitializedClasses), createHashMap];
if (_type in _initializedClasses) exitWith {_initializedClasses get _type};

private _vehCfg = configOf _vehicle;
private _hitpointGroups = getArray (_vehCfg >> QGVAR(hitpointGroups));
private _turretPaths = ((fullCrew [_vehicle, "gunner", true]) + (fullCrew [_vehicle, "commander", true])) apply {_x # 3};

(getAllHitPointsDamage _vehicle) params [["_hitPoints", []], ["_hitSelections", []]];
// get hitpoints of wheels with their selections
([_vehicle] call EFUNC(common,getWheelHitPointsWithSelections)) params ["_wheelHitPoints", "_wheelHitSelections"];

private _indexesToIgnore = [];
private _processedSelections = [];
private _dependsIndexMap = createHashMap;
private _complexDependsMap = createHashMap;

{
    private _selection = _x;
    private _hitpoint = toLowerANSI (_hitPoints select _forEachIndex);
    private _isWheelOrTrack = _selection in _wheelHitSelections || {_hitpoint in _wheelHitPoints} || {_hitpoint in TRACK_HITPOINTS};

    if (_hitpoint isEqualTo "") then { // skip empty hitpoint
        _indexesToIgnore pushBack _forEachIndex;
        continue
    };

    if (_isWheelOrTrack && {_selection in _processedSelections || {_selection isEqualTo ""}}) then { // skip duplicate or empty selection wheel/track
        TRACE_3("Skipping duplicate Wheel/Track or empty selection",_hitpoint,_forEachIndex,_selection);
        /*#ifdef DEBUG_MODE_FULL
        systemChat format ["Skipping duplicate wheel, hitpoint %1, index %2, selection %3", _hitpoint, _forEachIndex, _selection];
        #endif*/
        _indexesToIgnore pushBack _forEachIndex;
        _processedSelections pushBack _selection;
        continue
    };

    if ("glass" in _hitpoint) then { // skip glass
        TRACE_3("Skipping glass",_hitpoint,_forEachIndex,_selection);
        /*#ifdef DEBUG_MODE_FULL
        systemChat format ["Skipping glass, hitpoint %1, index %2, selection %3", _hitpoint, _forEachIndex, _selection];
        #endif*/
        _indexesToIgnore pushBack _forEachIndex;
        _processedSelections pushBack _selection;
        continue
    };

    if (_hitpoint select [0,7] isEqualTo "hitera_" || {_hitpoint select [0,4] isEqualTo "era_"}  // skip era/slat
    || {_hitpoint select [0,8] isEqualTo "hitslat_"}  || {_hitpoint select [0,5] isEqualTo "slat_"}
    || {_hitpoint select [0,9] isEqualTo "sideskirt"} || {_hitpoint select [0,6] isEqualTo "armor_"}
    || {_hitpoint select [0,3] isEqualTo "mud"} || {_hitpoint select [0,9] isEqualTo "smoketube"}) then {
        TRACE_3("Skipping ERA/Slat/Sideskirt/Armor/Mudguard/Smoketube HitPoint",_hitpoint,_forEachIndex,_selection);
        /*#ifdef DEBUG_MODE_FULL
        systemChat format ["Skipping ERA/Slat/Sideskirt/Armor/Mudguard/Smoketube HitPoint, hitpoint %1, index %2, selection %3", _hitpoint, _forEachIndex, _selection];
        #endif*/
        _indexesToIgnore pushBack _forEachIndex;
        _processedSelections pushBack _selection;
        continue
    };

    private _armorComponent = "";
    if (_selection == "") then { // some hitpoints have empty selection but defined armor component (mostly RHS)
        {
            private _turretHitpointCfg = ([_vehCfg, _x] call CBA_fnc_getTurret) >> "HitPoints";
            private _hitpointsCfg = "configName _x == _hitpoint" configClasses _turretHitpointCfg;
            if (_hitpointsCfg isNotEqualTo []) exitWith {
                TRACE_2("turret hitpoint configFound",_hitpoint,_x);
                _hitpointsCfg = _hitpointsCfg # 0;
                // only do turret hitpoints and stuff linked to visuals
                if (
                    (_hitpoint in ["hitturret", "hitgun"]) ||
                    {(getNumber (_hitpointsCfg >> "isGun")) == 1} ||
                    {(getNumber (_hitpointsCfg >> "isTurret")) == 1} ||
                    {(getText (_hitpointsCfg >> "visual")) != ""}
                ) then {
                    _armorComponent = getText (_hitpointsCfg >> "armorComponent");
                };
            };
        } forEach _turretPaths;
        if (_armorComponent == "") then {
            private _hitpointsCfg = "configName _x == _hitpoint" configClasses (_vehCfg >> "HitPoints");
            if (_hitpointsCfg isNotEqualTo []) then {
                _hitpointsCfg = _hitpointsCfg # 0;
                if (
                    (getNumber (_hitpointsCfg >> "isGun")) == 1 ||
                    {(getNumber (_hitpointsCfg >> "isTurret")) == 1} ||
                    {(getText (_hitpointsCfg >> "visual")) != ""}
                ) then {
                    _armorComponent = getText (_hitpointsCfg >> "armorComponent");
                };
            };
        };
    };

    if ((_selection == "") && {_armorComponent == ""}) then {
        TRACE_3("Skipping no selection OR armor component",_hitpoint,_forEachIndex,_selection);
        /*#ifdef DEBUG_MODE_FULL
        systemChat format ["Skipping no selection OR armor component, hitpoint %1, index %2, selection %3", _hitpoint, _forEachIndex, _selection];
        #endif*/
        _indexesToIgnore pushBack _forEachIndex;
        _processedSelections pushBack _selection;
        continue
    };

    if !(getText (_vehCfg >> "HitPoints" >> _hitpoint >> "depends") in ["", "0"]) then {
        // Caches depends hitpoints and their parents
        private _parentHitPoint = getText (_vehCfg >> "HitPoints" >> _hitpoint >> "depends");
        private _parentHitPointIndex = _hitPoints findIf {_x == _parentHitPoint};

        if (_parentHitPointIndex != -1) then {
            _dependsIndexMap set [_forEachIndex, _parentHitPointIndex];
            TRACE_3("Depends hitpoint and parent index",_hitpoint,_forEachIndex,_parentHitPoint);
        } else {
            // Multiple/Complex parents or broken parents
            _indexesToIgnore pushBack _forEachIndex;
            private _parentHitPoints = _parentHitPoint splitString "+*() ";
            private _validComplexHitPoint = true;
            {
                if !(_x regexMatch ".*[a-z]+.*") then {
                    _parentHitPoints deleteAt _forEachIndex;
                } else {
                    if !(_x in _hitPoints) then {
                        _validComplexHitPoint = false;
                        break;
                    };
                };
            } forEachReversed _parentHitPoints;

            if (_validComplexHitPoint || _parentHitPoint == "total") then {
                TRACE_3("Skipping depends and setting complex parent",_hitpoint,_forEachIndex,_parentHitPoint);
                _complexDependsMap set [_forEachIndex, [_parentHitPoint, _parentHitPoints]];
                _dependsIndexMap set [_forEachIndex, _parentHitPointIndex];
            } else {
                TRACE_3("Skipping depends with broken complex parent",_hitpoint,_forEachIndex,_parentHitPoint);
                private _groupIndex = _hitpointGroups findIf {_x # 0 == _hitpoint};
                if (_groupIndex != -1) then {
                    ERROR_2("[%1] hitpoint [%2] is both a group-parent and an ignored depends and will be unrepairable",_type,_hitpoint);
                    ERROR_1("group: %1",_hitpointGroups # _groupIndex);
                };
            };
        };
        _processedSelections pushBack _selection;
        continue
    };

    if (ANY_OF(_hitpointGroups,ANY_OF(_x select 1,_x == _hitpoint))) then { // skip child hitpoints
        TRACE_3("Skipping child hitpoint",_hitpoint,_forEachIndex,_selection);
        /*#ifdef DEBUG_MODE_FULL
        systemChat format ["Skipping child hitpoint, hitpoint %1, index %2, selection %3", _hitpoint, _forEachIndex, _selection];
        #endif*/
        _indexesToIgnore pushBack _forEachIndex;
        _processedSelections pushBack _selection;
        continue
    };

    _processedSelections pushBack _selection;
} forEach _hitSelections;

_initializedClasses set [_type, [_indexesToIgnore, _dependsIndexMap, _complexDependsMap]];
missionNamespace setVariable [QGVAR(hitPointsToIgnoreInitializedClasses), _initializedClasses];

[_indexesToIgnore, _dependsIndexMap, _complexDependsMap]
