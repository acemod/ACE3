// by commy2, esteldunedain
#include "script_component.hpp"

private ["_unit", "_magazines", "_ammos", "_repackTime", "_magazine", "_ammo", "_count", "_index",   "_i", "_j", "_ammoToTransfer", "_ammoAvailable", "_ammoNeeded"];

_unit = _this select 0;

_magazines = [];
_ammos = [];
_repackTime = [];

// get all mags and ammo count
{
    _magazine = _x select 0;
    _ammo = _x select 1;

    _count = getNumber (configfile >> "CfgMagazines" >> _magazine >> "count");

    if (_ammo != _count && {_count > 1}) then {    // additional checks here
        if !(_magazine in _magazines) then {
            _index = count _magazines;
            _magazines set [_index, _magazine];
            _ammos set [_index, [_ammo]];
        } else {
            _index = _magazines find _magazine;
            _ammos set [_index, (_ammos select _index) + [_ammo]];
        };
    };
} forEach magazinesAmmoFull _unit;

// Remove invalid magazines
{
    if (count _x < 2) then {
        _magazines set [_forEachIndex, -1];
        _ammos     set [_forEachIndex, [-1]];
    };
} forEach _ammos;
_magazines = _magazines - [-1];
_ammos     = _ammos     - [[-1]];

{
    // Calculate actual ammo to transfer during repack
    _count = getNumber (configfile >> "CfgMagazines" >> (_magazines select _forEachIndex) >> "count");

    // Sort Ascending
    _list = _x call BIS_fnc_sortNum;

    ["MagazineRepack", _list] call EFUNC(common,log);

    _i = 0;
    _j = count _x - 1;
    _ammoToTransfer = 0;
    _ammoAvailable = 0;
    while {_i < _j} do {
        _ammoNeeded = _count - (_list select _j);
        _exit = false;
        while {_i < _j && {!_exit}} do {
            _ammoAvailable = _list select _i;
            if (_ammoAvailable >= _ammoNeeded) then {
                _list set [_i, _ammoAvailable - _ammoNeeded];
                _ammoToTransfer = _ammoToTransfer + _ammoNeeded;
                _exit = true;
            } else {
                _ammoNeeded = _ammoNeeded - _ammoAvailable;
                _ammoToTransfer = _ammoToTransfer + _ammoAvailable;
                _i = _i + 1;
            };
        };
        _j = _j - 1;
    };

    _repackTime set [_forEachIndex, _ammoToTransfer * GVAR(TimePerAmmo) + (count _x) * GVAR(TimePerMagazine)];
} forEach _ammos;

["MagazineRepack", [_magazines, _repackTime]] call EFUNC(common,log);

[_unit, _magazines, _repackTime] call FUNC(openSelectMagazineUI);
