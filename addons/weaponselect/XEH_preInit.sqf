#include "script_component.hpp"

ADDON = false;

PREP(countMagazinesForGrenadeMuzzle);
PREP(displayGrenadeTypeAndNumber);
PREP(findNextGrenadeMagazine);
PREP(findNextGrenadeMuzzle);
PREP(fireSmokeLauncher);
PREP(getSelectedGrenade);
PREP(playChangeFiremodeSound);
PREP(putWeaponAway);
PREP(selectGrenadeAll);
PREP(selectGrenadeFrag);
PREP(selectGrenadeOther);
PREP(selectWeaponMode);
PREP(selectWeaponMuzzle);
PREP(selectWeaponVehicle);
PREP(setNextGrenadeMuzzle);
PREP(throwGrenade);

// prepare grenades from config
GVAR(CurrentGrenadeMuzzleIsFrag) = true;
GVAR(CurrentGrenadeMuzzleFrag)   = "";
GVAR(CurrentGrenadeMuzzleOther)  = "";

// Collect frag and other muzzles separately
with uiNamespace do {
    private ["_magazines", "_magazine", "_ammo", "_explosive"];
    if (isNil QGVAR(FragMuzzles)) then {
        GVAR(FragMuzzles)    = [];
        GVAR(NonFragMuzzles) = [];
        GVAR(AllMuzzles)     = [];

        GVAR(FragMagazines)    = [];
        GVAR(NonFragMagazines) = [];
        GVAR(AllMagazines)     = [];

        {
            _magazines = getArray (configFile >> "CfgWeapons" >> "Throw" >> _x >> "magazines");
            _magazine = _magazines select 0;

            _ammo = getText (configfile >> "CfgMagazines" >> _magazine >> "ammo");
            _explosive = getNumber (configfile >> "CfgAmmo" >> _ammo >> "explosive");

            if (_explosive == 0) then {
                GVAR(NonFragMuzzles)   pushBack _x;
                GVAR(NonFragMagazines) pushBack _magazines;
            } else {
                GVAR(FragMuzzles)   pushBack _x;
                GVAR(FragMagazines) pushBack _magazines;
            };

            GVAR(AllMuzzles)   pushBack _x;
            GVAR(AllMagazines) pushBack _magazines;

        } forEach getArray (configfile >> "CfgWeapons" >> "Throw" >> "muzzles");
    };
};

GVAR(FragMuzzles)      = uiNamespace getVariable QGVAR(FragMuzzles);
GVAR(NonFragMuzzles)   = uiNamespace getVariable QGVAR(NonFragMuzzles);
GVAR(AllMuzzles)       = uiNamespace getVariable QGVAR(AllMuzzles);
GVAR(FragMagazines)    = uiNamespace getVariable QGVAR(FragMagazines);
GVAR(NonFragMagazines) = uiNamespace getVariable QGVAR(NonFragMagazines);
GVAR(AllMagazines)     = uiNamespace getVariable QGVAR(AllMagazines);

ADDON = true;
