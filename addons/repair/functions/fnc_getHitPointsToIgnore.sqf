#include "script_component.hpp"
/*
 * Author: GhostIsSpooky, based on Commy2 & SilentSpike logic
 * Get list of vehicle hitpoints to ignore
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * HitPoints to ignore <ARRAY>
 *
 * Example:
 * [vehicle] call ace_repair_fnc_getHitpointsToIgnore
 *
 * Public: No
 */

params ["_vehicle"];

private _type = typeOf _vehicle;
TRACE_2("getHitPointsToIgnore", _vehicle,_type);
private _initializedClasses = missionNamespace getVariable [QGVAR(hitPointsToIgnoreInitializedClasses), createHashMap];
if (_type in _initializedClasses) exitWith {_initializedClasses get _type};

private _vehCfg = configOf _vehicle;
private _hitpointGroups = getArray (_vehCfg >> QGVAR(hitpointGroups));
private _turretPaths = ((fullCrew [_vehicle, "gunner", true]) + (fullCrew [_vehicle, "commander", true])) apply {_x # 3};

(getAllHitPointsDamage _vehicle) params [["_hitPoints", []], ["_hitSelections", []]];
// get hitpoints of wheels with their selections
([_vehicle] call FUNC(getWheelHitPointsWithSelections)) params ["_wheelHitPoints", "_wheelHitSelections"];

private _hitPointsToIgnore = [];
private _processedSelections = [];

{
    private _selection = _x;
    private _hitpoint = toLower (_hitPoints select _forEachIndex);
    private _isWheelOrTrack = _selection in _wheelHitSelections || {_selection in TRACK_HITPOINTS};

    if (_hitPoint isEqualTo "") exitWith { // skip empty hitpoint
        _hitPointsToIgnore pushBackUnique _hitPoint;
    };

    if (_isWheelOrTrack && {_x in _processedSelections || {_x isEqualTo ""}}) exitWith { // skip duplicate or empty selection wheel/track
        TRACE_3("Skipping duplicate Wheel/Track or empty selection",_hitpoint,_forEachIndex,_selection);
        _hitPointsToIgnore pushBackUnique _hitPoint;
    };

    if ("glass" in _hitpoint) exitWith { // skip glass
        TRACE_3("Skipping glass",_hitpoint,_forEachIndex,_selection);
        _hitPointsToIgnore pushBackUnique _hitPoint;
    };

    if (_hitPoint select [0,1] isEqualTo "#") exitWith { // skip lights
        TRACE_3("Skipping light",_hitpoint,_forEachIndex,_selection);
        _hitPointsToIgnore pushBackUnique _hitPoint;
    };

    if (_hitPoint select [0,7] isEqualTo "hitera_" || {_hitPoint select [0,8] isEqualTo "hitslat_"} || {_hitPoint select [0,4] isEqualTo "era_"}) exitWith { // skip era/slat
        TRACE_3("Skipping ERA/Slat HitPoint",_hitpoint,_forEachIndex,_selection);
        _hitPointsToIgnore pushBackUnique _hitPoint;
    };

    if ((_hitpointGroups findIf {(_x select 1) == _hitpoint}) != -1) exitWith { // skip child hitpoints
        TRACE_3("Skipping child hitpoint",_hitpoint,_forEachIndex,_selection);
        _hitPointsToIgnore pushBackUnique _hitPoint;
    };

    if (!((getText (_vehCfg >> "HitPoints" >> _hitPoint >> "depends")) in ["", "0"])) exitWith { // skip depends hitpoints, normalized by engine
        TRACE_3("Skipping depends hitpoint",_hitpoint,_forEachIndex,_selection);
        _hitPointsToIgnore pushBackUnique _hitPoint;
    };

    private _armorComponent = ""; // check for armor component if empty selection
    if (_selection == "") then {
        {
            private _turretHitpointCfg = ([_vehCfg, _x] call CBA_fnc_getTurret) >> "HitPoints";
            private _hitpointsCfg = "configName _x == _hitpoint" configClasses _turretHitpointCfg;
            if (_hitpointsCfg isNotEqualTo []) exitWith {
                if ((_hitpoint in ["hitturret", "hitgun"]) || {(getNumber (_hitpointsCfg # 0 >> "isGun")) == 1} || {(getNumber (_hitpointsCfg # 0 >> "isTurret")) == 1} || {(getText (_hitpointsCfg # 0 >> "visual")) != ""}) then {
                    _armorComponent = getText (_hitpointsCfg # 0 >> "armorComponent");
                };
            };
        } forEach _turretPaths;
    };
    if (_selection == "" && {_armorComponent == ""}) exitWith { // skip hitpoint without an armorComponent
        _hitPointsToIgnore pushBackUnique _hitPoint;
    };
    _processedSelections pushBack _x;
} forEach _hitSelections;

_initializedClasses set [_type, _hitPointsToIgnore];
missionNamespace setVariable [QGVAR(hitPointsToIgnoreInitializedClasses), _initializedClasses];

_hitPointsToIgnore
