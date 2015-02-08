// by commy2, esteldunedain
#include "script_component.hpp"

private ["_unit", "_magazines", "_ammos", "_repackTime", "_magazine", "_ammo", "_count", "_index",   "_i", "_j", "_ammoToTransfer", "_ammoAvailable", "_ammoNeeded"];

PARAMS_2(_unit,_magazineClassname);
if (isNil "_magazineClassname" || {_magazineClassname == ""}) exitWith {ERROR("Bad Mag Classname");};

[_unit] call EFUNC(common,goKneeling);
call EFUNC(interaction,hideMenu);

_startingAmmoCounts = [];
{
    EXPLODE_4_PVT(_x,_xClassname,_xCount,_xLoaded,_xType);
    if (_xClassname == _magazineClassname) then {
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

if ((count _startingAmmoCounts) == 0) exitwith {ERROR("No Mags");};

_simEvents = [_magazineClassname, _startingAmmoCounts] call FUNC(simulateRepackEvents);
_totalTime = (_simEvents select ((count _simEvents) - 1) select 0);

[_totalTime, [_magazineClassname, _startingAmmoCounts, _simEvents], {hint "done"}, {hint "fail"}, (localize "STR_ACE_MagazineRepack_RepackingMagazine"), {_this call FUNC(magazineRepackProgress)}] call EFUNC(common,progressBar);
