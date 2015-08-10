#include "script_component.hpp"

private ["_initialData", "_hpData", "_round", "_hpRound", "_hpDirect"];
//player sideChat format["f: %1 c: %2", (_this select 0), (count GVAR(spallHPData))];

if ((_this select 0) <= (count GVAR(spallHPData))) then {
    _initialData = GVAR(spallHPData) select (_this select 0);
    if (!isNil "_initialData") then {
        _hpRound = ((_this select 1) select 0) select 2;
        _round = _initialData select 3;
        _hpDirect = ((_this select 1) select 0) select 10;
        if (_hpDirect && {_round == _hpRound}) then {
            {
                _hpData =  _x;
                _round = _initialData select 3;
                // diag_log text format["HPDUMP-------------------------------------"];
                // {
                    // _hp = _x;
                    // diag_log text format["%1 --", _forEachIndex];
                    // {
                        // diag_log text format["%1: %2", _forEachIndex, _x];
                    // } forEach _hp;
                // } forEach (_this select 1);
                [DFUNC(doSpall), [_this, _forEachIndex]] call EFUNC(common,execNextFrame);
                // player sideChat "WEEE";
            } forEach (_this select 1);
        };
    };
};
