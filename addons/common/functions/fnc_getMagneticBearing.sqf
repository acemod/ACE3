#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Returns magnetic heading (0..360)
 *
 * Arguments:
 * 0: Object or Bearing <OBJECT or NUMBER> (default: ACE_player)
 * 1: Use Declination <BOOL> (Default: true)
 *
 * Return Value:
 * Compass Bearing <NUMBER>
 *
 * Example:
 * [player] call ace_common_fnc_getMagneticBearing
 *
 * Public: Yes
 */

params [["_source", ACE_player, [objNull, 0]], ["_useDeclination", true]];

[
    (if (_source isEqualType 0) then { _source } else { getDir _source })
    + (if (_useDeclination) then {
        (missionNamespace getVariable [QGVAR(magneticDeclinationOffset), 0])
        } else { 0 }
    )
] call CBA_fnc_simplifyAngle;
