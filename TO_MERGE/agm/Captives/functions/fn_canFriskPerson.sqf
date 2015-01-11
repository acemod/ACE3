/*
 * By: bux578
 *
 * Checks the conditions for being able to frisk a unit
 *
 * Arguments:
 * 0: caller (player) (Object)
 * 1: target (Object)
 *
 * Return Value:
 * Boolean
 */
 
private ["_unit", "_target"];

_unit = _this select 0;
_target = _this select 1;

    _target getVariable ["AGM_isCaptive", false]
|| {_target getVariable ["AGM_isSearchable", false]}
|| {_target getVariable ["AGM_isUnconscious", false]}
