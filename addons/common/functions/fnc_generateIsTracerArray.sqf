/*
 * Author: PabstMirror
 * Generates a array of which bullets are tracers for a given magazine.
 * Note: it is zero indexed, so for a 30 round magazine, first shot will be 29, last will be 0
 * Array will be empty if all rounds are tracers, use `_magTracers param [(_unit ammo _muzzle), true];`
 *
 * Arguments:
 * 0: magazine classname <STRING>
 *
 * Return Value:
 * Bools indicating if it is a tracer<ARRAY>
 *
 * Example:
 * ["100Rnd_65x39_caseless_mag"] call ace_attach_fnc_attach;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_magazine"];

private _isTracerArray = [];
private _count = getNumber(configFile >> "CfgMagazines" >> _magazine >> "count");
private _tracersEvery = getNumber(configFile >> "CfgMagazines" >> _magazine >> "tracersEvery");
private _lastRoundsTracer = getNumber(configFile >> "CfgMagazines" >> _magazine >> "lastRoundsTracer");
TRACE_4("",_magazine,_count,_tracersEvery,_lastRoundsTracer);


if (_tracersEvery != 1) then { // If every round will be a tracer just return an empty array
    _isTracerArray resize _count;
    for "_index" from 0 to (_count - 1) do {
        private _ammoCount = _index + 1;
        private _isTracer = (_ammoCount < _lastRoundsTracer) || {(_tracersEvery != 0) && {(_ammoCount - _lastRoundsTracer) % _tracersEvery == 0}};
        _isTracerArray set [_index, _isTracer];
    };
};
GVAR(isTracerNamespace) setVariable [_magazine, _isTracerArray];

TRACE_1("return",_isTracerArray);
_isTracerArray
