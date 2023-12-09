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
private _initializedClasses = GETMVAR(GVAR(ignoredAndDependsInitializedClasses),createHashMap);
if (_type in _initializedClasses) exitWith {
    TRACE_2("retrieved cached selections",_vehicle,_type);
    _initializedClasses get _type;
}; //you return different amount of values each time

private _vehCfg = configOf _vehicle;
private _hitPointGroups = getArray (_vehCfg >> QGVAR(hitpointGroups));
private _turretPaths = ((fullCrew [_vehicle, "gunner", true]) + (fullCrew [_vehicle, "commander", true])) apply {_x # 3};

(getAllHitPointsDamage _vehicle) params [["_hitPoints", []], ["_hitSelections", []]];
// get hitpoints of wheels with their selections
([_vehicle] call FUNC(getWheelHitPointsWithSelections)) params ["_wheelHitPoints", "_wheelHitSelections"];

private _indexesToIgnore = [];
private _processedSelections = [];
private _dependsIndexMap = createHashMap;
private _complexDependsMap = createHashMap;

{
    private _selection = _x;
    private _hitPoint = toLower (_hitPoints select _forEachIndex);
    private _isWheelOrTrack = _selection in _wheelHitSelections || {_hitPoint in _wheelHitPoints} || {_hitPoint in TRACK_HITPOINTS};

    if (_hitPoint isEqualTo "") then { // skip empty hitpoint
        _indexesToIgnore pushBack _forEachIndex;
        continue
    };

    if (_isWheelOrTrack && {_selection in _processedSelections || {_selection isEqualTo ""}}) then { 
        TRACE_3("Skipping duplicate Wheel/Track or empty selection",_hitPoint,_forEachIndex,_selection);
        _indexesToIgnore pushBack _forEachIndex;
        _processedSelections pushBack _selection;
        continue
    };

    if ("glass" in _hitPoint) then {
        TRACE_3("Skipping glass",_hitPoint,_forEachIndex,_selection);
        _indexesToIgnore pushBack _forEachIndex;
        _processedSelections pushBack _selection;
        continue
    };

    if (_hitPoint select [0,7] isEqualTo "hitera_" || {_hitPoint select [0,4] isEqualTo "era_"}
    || {_hitPoint select [0,8] isEqualTo "hitslat_"}  || {_hitPoint select [0,5] isEqualTo "slat_"}
    || {_hitPoint select [0,9] isEqualTo "sideskirt"} || {_hitPoint select [0,6] isEqualTo "armor_"}
    || {_hitPoint select [0,3] isEqualTo "mud"} || {_hitPoint select [0,9] isEqualTo "smoketube"}) then {
        TRACE_3("Skipping ERA/Slat/Sideskirt/Armor/Mudguard/Smoketube HitPoint",_hitPoint,_forEachIndex,_selection);
        _indexesToIgnore pushBack _forEachIndex;
        _processedSelections pushBack _selection;
        continue
    };

    private _armorComponent = "";
    if (_selection == "") then { // some hitpoints have empty selection but defined armor component (mostly RHS)
        {
            private _turretHitPointCfg = ([_vehCfg, _x] call CBA_fnc_getTurret) >> "HitPoints";
            private _hitPointsCfg = "configName _x == _hitPoint" configClasses _turretHitPointCfg;
            if (_hitPointsCfg isNotEqualTo []) exitWith {
                TRACE_2("turret hitpoint config found",_hitPoint,_x);
                _hitPointsCfg = _hitPointsCfg # 0;
                // only do turret hitpoints and stuff linked to visuals
                if (
                    (_hitPoint in ["hitturret", "hitgun"]) ||
                    {(getNumber (_hitPointsCfg >> "isGun")) == 1} ||
                    {(getNumber (_hitPointsCfg >> "isTurret")) == 1} ||
                    {(getText (_hitPointsCfg >> "visual")) != ""}
                ) then {
                    _armorComponent = getText (_hitPointsCfg >> "armorComponent");
                };
            };
        } forEach _turretPaths;
        if (_armorComponent == "") then {
            private _hitPointsCfg = "configName _x == _hitPoint" configClasses (_vehCfg >> "HitPoints");
            if (_hitPointsCfg isNotEqualTo []) then {
                _hitPointsCfg = _hitPointsCfg # 0;
                if (
                    (getNumber (_hitPointsCfg >> "isGun")) == 1 ||
                    {(getNumber (_hitPointsCfg >> "isTurret")) == 1} ||
                    {(getText (_hitPointsCfg >> "visual")) != ""}
                ) then {
                    _armorComponent = getText (_hitPointsCfg >> "armorComponent");
                };
            };
        };
    };

    if ((_selection == "") && {_armorComponent == ""}) then {
        TRACE_3("Skipping no selection OR armor component",_hitPoint,_forEachIndex,_selection);
        _indexesToIgnore pushBack _forEachIndex;
        _processedSelections pushBack _selection;
        continue
    };

    if (!(getText (_vehCfg >> "HitPoints" >> _hitPoint >> "depends") in ["", "0"])) then { 
        // Caches depends hitpoints and their parents
        private _parentHitPoint = toLower (getText (_vehCfg >> "HitPoints" >> _hitPoint >> "depends"));
        private _parentHitPointIndex = _hitPoints findIf {_x == _parentHitPoint};

        if (_parentHitPointIndex != -1) then {
            _dependsIndexMap set [_forEachIndex, _parentHitPointIndex];
            TRACE_3("Depends hitpoint and parent index",_hitPoint,_forEachIndex,_parentHitPoint);
        } else { 
            // Multiple parents or broken parents
            _indexesToIgnore pushBack _forEachIndex;
            private _parentHitPoints = _parentHitPoint splitString "+*() ";
            {
                if !(_x regexMatch ".*[a-z]+.*") then {
                    _parentHitPoints deleteAt _forEachIndex;
                };
            } forEachReversed _parentHitPoints;
            private _validComplexHitPoint = true;
            {
                if !(_x in _hitPoints) then {
                    _validComplexHitPoint = false;
                    break;
                };
            } forEach _parentHitPoints;

            if (_validComplexHitPoint) then {
                TRACE_3("Skipping depends and setting complex parent",_hitPoint,_forEachIndex,_parentHitPoint);
                _complexDependsMap set [_forEachIndex, [_parentHitPoint, _parentHitPoints]];
                _dependsIndexMap set [_forEachIndex, _parentHitPointIndex];
            } else {
                TRACE_4("Skipping depends with broken complex parent",_hitPoint,_forEachIndex,_parentHitPoint,_parentHitPoints);
                private _groupIndex = _hitPointGroups findIf {_x # 0 == _hitPoint};
                if (_groupIndex != -1) then {
                    ERROR_2("[%1] hitpoint [%2] is both a group-parent and an ignored depends and will be unrepairable",_type,_hitPoint);
                    ERROR_1("group: %1",_hitPointGroups # _groupIndex);
                };
            };
        };
        _processedSelections pushBack _selection;
        continue
    };

    if (ANY_OF(_hitPointGroups, ANY_OF(_x select 1, _x == _hitPoint))) then {
        TRACE_3("Skipping child hitpoint",_hitPoint,_forEachIndex,_selection);
        _indexesToIgnore pushBack _forEachIndex;
        _processedSelections pushBack _selection;
        continue
    };

    _processedSelections pushBack _selection;
} forEach _hitSelections;

_initializedClasses set [_type, [_indexesToIgnore, _dependsIndexMap, _complexDependsMap]];
SETMVAR(GVAR(ignoredAndDependsInitializedClasses),_initializedClasses);

[_indexesToIgnore, _dependsIndexMap, _complexDependsMap]
