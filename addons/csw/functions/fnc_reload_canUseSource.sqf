#include "..\script_component.hpp"
/*
 * Author: LinkIsGrim
 * Tests whether a magazine source is close enough to the unit loading, and still holds the magazine.
 *
 * Measured from the unit rather than from the gun: they are the one reaching for it, and
 * FUNC(getNearbySources) gathers around them too. Measuring from both leaves only the overlap.
 *
 * Arguments:
 * 0: Unit loading <OBJECT>
 * 1: Carryable Magazine <STRING>
 * 2: Magazine source <OBJECT>
 *
 * Return Value:
 * Source is usable <BOOL>
 *
 * Example:
 * [player, "ACE_csw_100Rnd_127x99_mag_red", backpackContainer player] call ace_csw_fnc_reload_canUseSource
 *
 * Public: No
 */

params ["_unit", "_carryMag", "_magSource"];

if !(_carryMag in (magazineCargo _magSource)) exitWith {
    TRACE_2("source does not have carry mag",_magSource,_carryMag);
    false
};

// objectParent covers a container inside another container, whose own position is not meaningful
if (
    ((_unit distance _magSource) > DISTANCE_SEARCH_RADIUS) &&
    {(_unit distance (objectParent _magSource)) > DISTANCE_SEARCH_RADIUS}
) exitWith {
    TRACE_2("source too far",_unit,_magSource);
    false
};

true
