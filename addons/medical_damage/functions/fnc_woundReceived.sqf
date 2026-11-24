#include "..\script_component.hpp"
/*
 * Author: Pterolatypus
 * Handle woundReceived event and pass to individual wound handlers
 *
 * Arguments:
 * 0: Unit That Was Hit <OBJECT>
 * 1: Damage done to each body part <ARRAY>
 * 2: Shooter <OBJECT>
 * 3: Ammo classname or damage type <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_target, [[0.5, "LeftLeg", 1]], _shooter, "B_65x39_Caseless"] call ace_medical_damage_fnc_woundReceived
 *
 * Public: No
 */

params ["_unit", "_allDamages", "_shooter", "_ammo"];

private _typeOfDamage = _ammo call FUNC(getTypeOfDamage);

private _woundHandlers = [];
if (_typeOfDamage in GVAR(damageTypeDetails)) then {
    (GVAR(damageTypeDetails) get _typeOfDamage) params ["", "", "_handlers"];
    _woundHandlers = _handlers;
};

private _damageData = [_unit, _allDamages, _typeOfDamage, _ammo, _shooter];
private _originalCount = count _damageData;

// Counts open wounds per classComplex, so wounds added by any handler can be found by comparing counts before and after the chain
private _countWounds = {
    params ["_countUnit"];
    private _counts = createHashMap;
    {
        {
            _x params ["_classComplex", "_amountOf"];
            _counts set [_classComplex, (_counts getOrDefault [_classComplex, 0]) + _amountOf];
        } forEach _x;
    } forEach values GET_OPEN_WOUNDS(_countUnit);
    _counts
};

// Nested woundReceived calls for the same unit (e.g. burning) are part of the outer hit, so only the outermost call fires woundsHandled
// Entries are [unit, counts, frame]. An entry from the same frame belongs to a call still running, an older one was left behind by a script error
private _contextIndex = GVAR(woundContexts) findIf {(_x select 0) isEqualTo _unit};
private _isOutermost = _contextIndex == -1 || {(GVAR(woundContexts) select _contextIndex) select 2 != diag_frameNo};
if (_isOutermost) then {
    if (_contextIndex != -1) then {GVAR(woundContexts) deleteAt _contextIndex};
    GVAR(woundContexts) pushBack [_unit, [_unit] call _countWounds, diag_frameNo];
};

private _lastHandlerName = if (_woundHandlers isEqualTo []) then {""} else {_woundHandlers select -1 select 0}; // will usually be ace_medical_damage_woundsHandlerBase

{
    _x params ["_handlerName", "_handlerCode"];
    _damageData = _damageData call _handlerCode;
    TRACE_2("Wound handler returned",_damageData,_handlerName);

    // Done
    if (_handlerName == _lastHandlerName || {_damageData isEqualTo []}) then {
        TRACE_2("Wound handling done",_damageData,_handlerName);
        break;
    };

    if ((count _damageData) == (_originalCount - 1)) then {
        ERROR_1("Wound handler '%1' missing latest param in return, readding. This will be deprecated in the future, check Medical Framework wiki.",_handlerName);
        _damageData pushBack _shooter;
    };

    // If invalid return and not the last handler, log an error and exit
    if (isNil "_damageData" || {!(_damageData isEqualType [])} || {(count _damageData) < _originalCount}) then {
        ERROR_2("Return for handler '%1' invalid - '%2', skipping wound handling",_handlerName,_damageData);
        break;
    };
} forEach _woundHandlers;

if (!_isOutermost) exitWith {};

private _countsBefore = (GVAR(woundContexts) deleteAt (GVAR(woundContexts) findIf {(_x select 0) isEqualTo _unit})) select 1;
private _countsAfter = [_unit] call _countWounds;

// Wound types (classComplex) added or merged during this hit, from any handler
private _addedWoundTypes = (keys _countsAfter) select {(_countsAfter get _x) > (_countsBefore getOrDefault [_x, 0])};

// Hits that only add noBlood wounds (e.g. contusions) do not spurt blood, a hit with no wounds still spurts
private _bloodWoundTypes = _addedWoundTypes select {!((GVAR(woundDetails) getOrDefault [floor (_x / 10), []]) param [5, false])};
private _spurtBlood = _addedWoundTypes isEqualTo [] || {_bloodWoundTypes isNotEqualTo []};

[QEGVAR(medical,woundsHandled), [_unit, _allDamages, _shooter, _typeOfDamage, _spurtBlood]] call CBA_fnc_localEvent;
