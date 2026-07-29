#include "..\script_component.hpp"
/*
 * Author: LinkIsGrim
 * Tests whether a magazine source is close enough to a CSW and still holds the magazine.
 *
 * A null source passes. Callers that picked their source from FUNC(getNearbySources) already know
 * both, and only want to know whether the magazine fits the turret.
 *
 * Arguments:
 * 0: CSW <OBJECT>
 * 1: Carryable Magazine <STRING>
 * 2: Magazine source <OBJECT> (default: objNull)
 *
 * Return Value:
 * Source is usable <BOOL>
 *
 * Example:
 * [cursorObject, "ACE_csw_100Rnd_127x99_mag_red", backpackContainer player] call ace_csw_fnc_reload_canUseSource
 *
 * Public: No
 */

params ["_vehicle", "_carryMag", ["_magSource", objNull]];

if (isNull _magSource) exitWith {true};

if !(_carryMag in (magazineCargo _magSource)) exitWith {
    TRACE_2("source does not have carry mag",_magSource,_carryMag);
    false
};

// objectParent covers a container inside another container, whose own position is not meaningful
if (
    ((_vehicle distance _magSource) > DISTANCE_SEARCH_RADIUS) &&
    {(_vehicle distance (objectParent _magSource)) > DISTANCE_SEARCH_RADIUS}
) exitWith {
    TRACE_2("source too far",_vehicle,_magSource);
    false
};

true
