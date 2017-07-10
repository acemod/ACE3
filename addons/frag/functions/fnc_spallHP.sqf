/*
 * Author: ACE-Team
 *
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_frag_fnc_spallHP
 *
 * Public: No
 */

#include "script_component.hpp"

//player sideChat format ["f: %1 c: %2", (_this select 0), (count GVAR(spallHPData))];

params ["_index", "_hitPartData"];

private _initialData = GVAR(spallHPData) param [_index, []];
if (_initialData isEqualTo []) exitWith {};

private _hpRound = (_hitPartData select 0) select 2;
private _round = _initialData select 3;
private _hpDirect = (_hitPartData select 0) select 10;

if (_hpDirect && {_round == _hpRound}) then {
    {
        // diag_log text format ["HPDUMP-------------------------------------"];
        // {
            // _hp = _x;
            // diag_log text format ["%1 --", _forEachIndex];
            // {
                // diag_log text format ["%1: %2", _forEachIndex, _x];
            // } forEach _hp;
        // } forEach (_this select 1);
        [DFUNC(doSpall), [_this, _forEachIndex]] call CBA_fnc_execNextFrame;
        // player sideChat "WEEE";
    } forEach _hitPartData;
};
