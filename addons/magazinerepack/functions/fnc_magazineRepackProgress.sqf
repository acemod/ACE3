/*
 * Author: PabstMirror (based on repack from commy2, esteldunedain, Ruthberg)
 * Handles each frame durring the repack progressBar.
 * On each event (repacked bullet or move to new mag) it plays a sound and syncs up the new magazines to the player.
 *
 * Arguments:
 * 0: Arguments [classname,lastAmmoStatus,events] <ARRAY>
 * 1: Elapsed Time <NUMBER>
 * 2: Total Time Repacking Will Take <NUMBER>
 *
 * Return Value:
 * Keep going (on missing mags return false) <BOOL>
 *
 * Example:
 * (args from progressBar) call ace_magazinerepack_fnc_magazineRepackProgress
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_args", "_elapsedTime", "_totalTime"];
_args params ["_magazineClassname", "_lastAmmoCount", "_simEvents"];

if !((_simEvents select 0) params ["_nextEventTime", "_nextEventIsBullet", "_nextEventMags"]) exitWith { ERROR("No Event"); false };


if (_nextEventTime > _elapsedTime) exitWith { true };//waiting on next event

//Verify we aren't missing any ammo
private _currentAmmoCount = [];
{
    _x params ["_xClassname", "_xCount"];
    if (_xClassname == _magazineClassname) then {
        _currentAmmoCount pushBack _xCount;
    };
} forEach (magazinesAmmo ACE_player);  //only inventory mags

//Go through mags we currently have and check off the ones we should have
private _addedMagazines = +_currentAmmoCount;
private _missingAmmo = false;
{
    if (_x > 0) then {
        private _index = _addedMagazines find _x;
        if (_index != -1) then {
            _addedMagazines deleteAt _index;
        } else {
            _missingAmmo = true;
        };
    };
} forEach _lastAmmoCount;

if (_missingAmmo) exitWith { false };  //something removed ammo that was being repacked (could be other players or scripts)

private _updateMagazinesOnPlayerFnc = {
    ACE_player removeMagazines _magazineClassname;  //remove inventory magazines
    {
        if (_x > 0) then {
            ACE_player addMagazine [_magazineClassname, _x];
        };
    } forEach (_addedMagazines + _nextEventMags);
    _args set [1, _nextEventMags];  //store the new magazine
};

if (_nextEventIsBullet) then {
    playSound QGVAR(soundRoundFinished);
    if ((((count _simEvents) % 3) == 0) || {(count _simEvents) == 1}) then {
        //For performance - only update mags every 3 bullets (or if it's the last event)
        call _updateMagazinesOnPlayerFnc;
    };
} else {
    playSound QGVAR(soundMagazineFinished);
    call _updateMagazinesOnPlayerFnc;
};

_simEvents deleteAt 0; //pop off the event

true
