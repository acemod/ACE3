/*
 * Author: PabstMirror
 * Simulates repacking a set of magazines.
 * Returns the timing and magazines counts at every stage.
 *
 * Arguments:
 * 0: How many rounds in a full magazine <NUMBER>
 * 1: Array of rounds in magazines <ARRAY>
 * 2: Magazine is a belt <BOOL>
 *
 * Return Value:
 * Array in format [ACE_time, isBullet, array of ammo counts] <ARRAY>
 *
 * Example:
 * [10, [1,2,3,8], false] call ace_magazinerepack_fnc_simulateRepackEvents =
 * [[1.5,true,[0,2,3,9]],[3.5,false,[0,2,3,9]],[5,true,[0,1,3,10]],[7,false,[0,1,3,10]],[8.5,true,[0,0,4,10]],[10.5,false,[0,0,4,10]]]
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_newMagFnc", "_time", "_events", "_swapAmmoFnc", "_ammoSwaped", "_lowIndex", "_highIndex", "_ammoToTransfer", "_ammoAvailable", "_ammoNeeded", "_swapProgress"];

PARAMS_3(_fullMagazineCount,_arrayOfAmmoCounts,_isBelt);

// Sort Ascending - Don't modify original
_arrayOfAmmoCounts = +_arrayOfAmmoCounts;
_arrayOfAmmoCounts sort true;

_newMagFnc = {
    _time = _time + GVAR(TimePerMagazine);
    _events pushBack [_time, false, +_arrayOfAmmoCounts];
};

_swapAmmoFnc = if (_isBelt) then {
    {
        _time = _time + GVAR(TimePerBeltLink);
        _arrayOfAmmoCounts set [_lowIndex, ((_arrayOfAmmoCounts select _lowIndex) - _ammoSwaped)];
        _arrayOfAmmoCounts set [_highIndex, ((_arrayOfAmmoCounts select _highIndex) + _ammoSwaped)];
        _events pushBack [_time, true, +_arrayOfAmmoCounts];
    }
} else {
    {
        for "_swapProgress" from 0 to (_ammoSwaped - 1) do {
            _time = _time + GVAR(TimePerAmmo);
            _arrayOfAmmoCounts set [_lowIndex, ((_arrayOfAmmoCounts select _lowIndex) - 1)];
            _arrayOfAmmoCounts set [_highIndex, ((_arrayOfAmmoCounts select _highIndex) + 1)];
            _events pushBack [_time, true, +_arrayOfAmmoCounts];
        };
    }
};

_lowIndex = 0;
_highIndex = (count _arrayOfAmmoCounts) - 1;
_ammoToTransfer = 0;
_ammoAvailable = 0;

_time = 0;
_events = [];

while {_lowIndex < _highIndex} do {
    _ammoNeeded = _fullMagazineCount - (_arrayOfAmmoCounts select _highIndex);
    _ammoAvailable = _arrayOfAmmoCounts select _lowIndex;

    if (_ammoAvailable == 0) then {
        _lowIndex = _lowIndex + 1;
        call _newMagFnc;
    } else {
        if (_ammoNeeded == 0) then {
            _highIndex = _highIndex - 1;
            call _newMagFnc;
        } else {
            _ammoSwaped = _ammoAvailable min _ammoNeeded;
            call _swapAmmoFnc;
        };
    };
};

_events
