#include "script_component.hpp"
/*
 * Author:gandjustas
 * Hit EH fired once for each "hit" when bullet impacts hitpoint or engine applies physical damage
 * Engine applies vanilla damage only after Hit event
 * We "parse" incoming damages from HandleDamage EH and apply them on after Hit event
 *
 * Arguments:
 * Hit EH
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params ["_unit", "_source", "_damage", "_instigator"];

// Hit sometimes triggers for remote units - ignore.
if !(local _unit) exitWith {nil};

#ifdef DEBUG_MODE_FULL
diag_log formatText ["Hit %1", _this];
#endif

_unit setVariable [QEGVAR(medical,lastDamageSource), _source];
_unit setVariable [QEGVAR(medical,lastInstigator), _instigator];

// Fire damage
if (
    isNull _source && 
    isBurning _unit
) exitWith {
    [QEGVAR(medical,damageReceived), [
        _unit, 
        _source, 
        "fire", 
        _damage
    ]] call CBA_fnc_localEvent;
};

// Drowning damage occurs in consistent increments
if (
    getOxygenRemaining _unit <= 0.5 
    && _damage == 0.005
    && _unit == _source
) exitWith {
    [QEGVAR(medical,damageReceived), [
        _unit, 
        _source, 
        "drowning", 
        _damage
    ]] call CBA_fnc_localEvent;
};

private _hits = _unit getVariable [QGVAR(hits), []];
private _newHits = (_unit getVariable [QGVAR(events), []]) call FUNC(parseDamageEvents);
if (count _newHits > 0) then {
    _hits = _hits select {_x#0 + 100 < diag_frameNo};
    _hits append _newHits;
    _unit setVariable [QGVAR(hits), _hits];
};

// _damage in Hit EH equals to _newDamage from HandleDamage EH for structural damage
private _hitIdx = _hits findIf {
    _x params ["_frameNo","_dmg", "_src", "_inst"];

    _frameNo + 10 > diag_frameNo && 
    abs (_dmg - _damage) < 1e-5 &&
    _src isEqualTo _source &&
    _inst isEqualTo _instigator 
};

if (_hitIdx == -1) then {
    ERROR_4("Can't find handleDamage events for hit _unit=%1 _source=%2 _damage=%3 _instigator=%4",_unit,_source,_damage,_instigator);

    [QEGVAR(medical,damageReceived), [
        _unit, 
        if (!isNull _instigator) then {_instigator} else {_source}, 
        "unknown", 
        _damage
    ]] call CBA_fnc_localEvent;
} else {
    private _hit = _hits deleteAt _hitIdx;
    _hit params ["","", "_source", "_instigator", "_ammo", "_hpDamages"];
    [_unit, _hpDamages] call FUNC(processLimbsDamage);

    [QEGVAR(medical,damageReceived), [
        _unit, 
        if (!isNull _instigator) then {_instigator} else {_source}, 
        _ammo, 
        _damage, 
        _hpDamages
    ]] call CBA_fnc_localEvent;

    ;
};