/*
 * Author: esteldunedain
 *
 * This function diagnoses all explosive ammo types and expost the data required
 * to construct the config files and scripts that hook ammo events.
 *
 * Arguments:
 * None. Parameters inherited from EFUNC(common,firedEH)
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#define DEBUG_MODE_FULL
#include "script_component.hpp"

private _ammoLibrary = [];
private _cfgAmmo = configFile >> "CfgAmmo";
for "_i" from 0 to (count _cfgAmmo)-1 do {
    private _ammoConfig = _cfgAmmo select _i;
    if (isClass _ammoConfig) then {
        private _ammoParent = configName inheritsFrom _ammoConfig;
        private _ammo = configName _ammoConfig;
        private _explosive = getNumber (_ammoConfig >> "explosive");
        if (_explosive > 0) then {
            // This ammo is explosive
            private _explosionEffects = getText (_ammoConfig >> "explosionEffects");

            // Check if the explosionEffect has a parent
            private _explosionEffectsParent = configName inheritsFrom (configFile >> _explosionEffects);
            _ammoLibrary pushBack [_ammo, _ammoParent, _explosionEffects, _explosionEffectsParent];
            diag_log text format ["AmmoEventsData,%1,%2,%3,%4",_ammo, _ammoParent, _explosionEffects, _explosionEffectsParent];
        };
    };
};
