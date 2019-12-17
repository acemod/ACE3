#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Compatibility With ACE_CSW (will be called by ace_csw, no dependency)
 * Setting Init has finished, and this runs before csw attempts to unload weapon, should replicate functionality of mk6_fnc_mortarInit
 *
 * Arguments:
 * 0: static <OBJECT>
 * 1: Turret <ARRAY>
 * 2: current weapon <STRING>
 * 3: need proxy weapon (either assembly mode is true, or weapon has been emptied and is being reloaded) <BOOL>
 *
 * Return Value:
 * Proxy Weapon <STRING>
 *
 * Example:
 * [mortar, "mortar_82mm", true] call ace_mk6mortar_fnc_csw_getProxyWeapon
 *
 * Public: No
 */

params ["_mortar", "_turret", "_currentWeapon", "_proxyWeaponNeeded"];
TRACE_4("csw_getProxyWeapon",_mortar,_turret,_currentWeapon,_proxyWeaponNeeded);

private _newWeapon = "";

if (_proxyWeaponNeeded || GVAR(useAmmoHandling)) then {
    if (_currentWeapon != "mortar_82mm") exitWith { ERROR_2("unknown weapon [%1 - %2]",typeOf _mortar,_currentWeapon); };

    // Replace weapon with fast reloading version
    _newWeapon = "ace_mortar_82mm";
    TRACE_1("replacing weapon",_newWeapon);

    // need to convert 8rnd mags to 1rnd mags for new weapon (we need to do this so the weapon is loaded with a compatible mag)
    private _magsToRemove = [];
    private _convertedMags = [];
    {
        _x params ["_xMag", "_xTurret", "_xAmmo"];

        if (_xTurret isEqualTo _turret) then {
            private _replaceMag = switch (true) do {
            case (_xMag == "8Rnd_82mm_Mo_shells"): {"ACE_1Rnd_82mm_Mo_HE"};
            case (_xMag == "8Rnd_82mm_Mo_Smoke_white"): {"ACE_1Rnd_82mm_Mo_Smoke"};
            case (_xMag == "8Rnd_82mm_Mo_Flare_white"): {"ACE_1Rnd_82mm_Mo_Illum"};
            case (_xMag == "8Rnd_82mm_Mo_guided"): {"ACE_1Rnd_82mm_Mo_HE_Guided"};
            case (_xMag == "8Rnd_82mm_Mo_LG"): {"ACE_1Rnd_82mm_Mo_HE_LaserGuided"};
                default {""};
            };
            if (_replaceMag != "") then {
                _magsToRemove pushBackUnique [_xMag, _xTurret];
                if (!GVAR(useAmmoHandling)) then {
                    TRACE_3("replacing",_xMag,_replaceMag,_xAmmo);
                    for "_i" from 1 to _xAmmo do {
                        _convertedMags pushBack [_replaceMag, _xTurret, 1];
                    };
                };
            } else {
                WARNING("unknown mag %1", _xMag);
            };
        };
    } forEach (magazinesAllTurrets _mortar);

    // remove orignal mags and add 1rnd versions:
    { _mortar removeMagazinesTurret _x; } forEach _magsToRemove;
    { _mortar addMagazineTurret _x; } forEach _convertedMags;
};

_newWeapon
