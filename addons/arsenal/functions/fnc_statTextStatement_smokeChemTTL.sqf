#include "script_component.hpp"
/*
 * Author: Alganthe
 * Text statement for the smoke / chemlight time to live stat.
 *
 * Arguments:
 * 0: not used
 * 1: item config path (CONFIG)
 *
 * Return Value:
 * String to display
 *
 * Public: No
 */

params ["", "_config"];

private _TTL = getNumber (configFile >> "CfgAmmo" >> getText (_config >> "ammo") >> "timeToLive");

if (_TTL > 3600) then {

    _TTL = _TTL / 60^2;
    _TTL = str _TTL splitString ".";

    if (count _TTL > 1) then  {
        format [
            "%1h %2m",
            parseNumber (_TTL select 0),
            round (60 * parseNumber  ("0." + (_TTL select 1)))
        ]
    } else {
        format [
            "%1h",
            parseNumber (_TTL select 0)
        ]
    };
} else {

    format ["%1m", round (_TTL / 60)];
};
