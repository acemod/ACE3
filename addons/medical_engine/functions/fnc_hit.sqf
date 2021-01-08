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


// Fire damage can occur as lots of minor damage events
if (
    isNull _source && 
    isBurning _unit
) exitWith {	
	private _combinedDamage = _damage + (_unit getVariable [QGVAR(triviaDamage), 0]);
	if(_combinedDamage > 0.1) then {
		[QEGVAR(medical,damageReceived), [
			_unit, 
			_source, 
			"fire", 
			_damage
        ]] call CBA_fnc_localEvent;
		
		_unit setVariable [QGVAR(triviaDamage), 0];
	} else {
		_unit setVariable [QGVAR(triviaDamage), _combinedDamage];
	};
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

call FUNC(parseDamageEvents);

// _damage in Hit EH equals to _newDamage from HandleDamage EH for hitPointIndex=-1
private _hits = _unit getVariable [QGVAR(hits), []];
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
    private _hit = _hits select _hitIdx;
	_hit params ["","", "_source", "_instigator", "_ammo", "_hpDamages"];
	[_unit, _hpDamages] call FUNC(processLimbsDamage);

	[QEGVAR(medical,damageReceived), [
		_unit, 
		if (!isNull _instigator) then {_instigator} else {_source}, 
		_ammo, 
		_damage, _hpDamages
    ]] call CBA_fnc_localEvent;	

	_hits deleteAt _hitIdx;
};