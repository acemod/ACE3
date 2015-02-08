/*
 * Author: PabstMirror (based on repack from commy2, esteldunedain, Ruthberg)
 * Starts repacking a specific magazine classname.
 * Precalcs all the event timings and starts the progressBar.
 *
 * Arguments:
 * 0: Magazine Classname <STRING>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * ["30Rnd_65x39_caseless_mag"] call ace_magazinerepack_fnc_startRepackingMagazine
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_unit", "_fullMagazineCount", "_startingAmmoCounts", "_simEvents", "_totalTime"];

PARAMS_1(_magazineClassname);
if (isNil "_magazineClassname" || {_magazineClassname == ""}) exitWith {ERROR("Bad Mag Classname");};

_unit = ACE_player;

[ACE_player] call EFUNC(common,goKneeling);
call EFUNC(interaction,hideMenu);

// Calculate actual ammo to transfer during repack
_fullMagazineCount = getNumber (configfile >> "CfgMagazines" >> _magazineClassname >> "count");

_startingAmmoCounts = [];
{
    EXPLODE_4_PVT(_x,_xClassname,_xCount,_xLoaded,_xType);
    if ((_xClassname == _magazineClassname) && {(_xCount != _fullMagazineCount) && {_xCount > 0}}) then {
        if (_xLoaded) then {
            //Try to Remove from weapon and add to inventory, otherwise ignore
            if (_unit canAdd _magazineClassname) then {
                switch (_xType) do {
                case (1): {_unit removePrimaryWeaponItem _magazineClassname;};
                case (2): {_unit removeHandgunItem _magazineClassname;};
                case (4): {_unit removeSecondaryWeaponItem _magazineClassname;};
                    default {ERROR("Loaded Location Invalid");};
                };
                _unit addMagazine [_magazineClassname, _xCount];
                _startingAmmoCounts pushBack _xCount;
            };
        } else {
            _startingAmmoCounts pushBack _xCount;
        };
    };
} forEach (magazinesAmmoFull _unit);

if ((count _startingAmmoCounts) < 2) exitwith {ERROR("Not Enough Mags to Repack");};

_simEvents = [_fullMagazineCount, _startingAmmoCounts] call FUNC(simulateRepackEvents);
_totalTime = (_simEvents select ((count _simEvents) - 1) select 0);

[
_totalTime,
[_magazineClassname, _startingAmmoCounts, _simEvents],
{_this call FUNC(magazineRepackFinish)},
{_this call FUNC(magazineRepackFinish)},
(localize "STR_ACE_MagazineRepack_RepackingMagazine"),
{_this call FUNC(magazineRepackProgress)}
] call EFUNC(common,progressBar);
