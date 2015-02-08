#include "script_component.hpp"

private ["_fullMagazineCount", "_magazines", "_newMag", "_time", "_events", "_swapAmmo", "_ammoSwaped", "_lowIndex", "_highIndex", "_ammoToTransfer", "_ammoAvailable", "_ammoNeeded"];

PARAMS_2(_magazineClassname,_arrayOfAmmoCounts);

// Calculate actual ammo to transfer during repack
_fullMagazineCount = getNumber (configfile >> "CfgMagazines" >> _magazineClassname >> "count");

// Sort Ascending - Don't modify orginal
_arrayOfAmmoCounts = (+_arrayOfAmmoCounts) call BIS_fnc_sortNum;

_newMag = {
    _time = _time + GVAR(TimePerMagazine);
    _events pushBack [_time, 1, +_arrayOfAmmoCounts];
};
_swapAmmo = {
    for "_swapProgress" from 1 to _ammoSwaped do {
        _time = _time + GVAR(TimePerAmmo);
        _arrayOfAmmoCounts set [_lowIndex, ((_arrayOfAmmoCounts select _lowIndex) - 1)];
        _arrayOfAmmoCounts set [_highIndex, ((_arrayOfAmmoCounts select _highIndex) + 1)];
        _events pushBack [_time, 0, +_arrayOfAmmoCounts];
    };
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
        call _newMag;
    } else {
        if (_ammoNeeded == 0) then {
            _highIndex = _highIndex - 1;
            call _newMag;
        } else {
            _ammoSwaped = _ammoAvailable min _ammoNeeded;
            call _swapAmmo;
        };
    };
};

_events
