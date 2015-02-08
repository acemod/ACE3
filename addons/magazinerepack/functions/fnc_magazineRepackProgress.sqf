// by commy2, esteldunedain
#include "script_component.hpp"

PARAMS_3(_args,_elapsedTime,_totalTime);
EXPLODE_3_PVT(_args,_magazineClassname,_lastAmmoCount,_simEvents);

if ((count _simEvents) == 0) exitWith {ERROR("No Event"); false};
EXPLODE_3_PVT((_simEvents select 0),_nextEventTime,_nextEventType,_nextEventMags);



if (_nextEventTime > _elapsedTime) exitWith {true};//waiting on next event
systemChat format ["Event %1-%2-%3", _nextEventTime,_nextEventType,_nextEventMags];


//Verify we aren't missing any ammo
_currentAmmoCount = [];
{
    EXPLODE_2_PVT(_x,_xClassname,_xCount);
    if (_xClassname == _magazineClassname) then {
        _currentAmmoCount pushBack _xCount;
    };
} forEach (magazinesAmmo ACE_player);  //only inventory mags

_addedMagazines = +_currentAmmoCount;
_missingAmmo = false;
{
    if (_x > 0) then {
        _index = _addedMagazines find _x;
        if (_index != -1) then {
            _addedMagazines deleteAt _index;
        } else {
            _missingAmmo = true;
        };
    };
} forEach _lastAmmoCount;

if (_missingAmmo) exitWith {false};  //something removed ammo that was being repacked
if ((count _addedMagazines) > 0) then {
    TRACE_1("Added Magazine While Repacking",_addedMagazines);
};

_updateMagazinesOnPlayer = {
    systemChat format ["Updating mags"];
    _newMagazineList = _addedMagazines + _nextEventMags;
    ACE_player removeMagazines _magazineClassname;
    {
        if (_x > 0) then {
            ACE_player addMagazine [_magazineClassname, _x];
        };
    } forEach _newMagazineList;
    _args set [1, _nextEventMags];
};


if (_nextEventType == 0) then {
    systemChat "reloading bullet";
    playSound QGVAR(soundMagazineFinished);
    if (((count _simEvents) % 3) == 0) then {
        call _updateMagazinesOnPlayer;
    };
} else {
    systemChat "Moving to next mag";
    playSound QGVAR(soundRoundFinished);
    call _updateMagazinesOnPlayer;
};

_simEvents deleteAt 0; //pop off the event

true;
