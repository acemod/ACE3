#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Returns magnetic heading (0..360)
 *
 * Arguments:
 * 0: Object or Bearing <OBJECT><NUMBER> (default: ACE_player)
 *
 * Return Value:
 * Compass Bearing <NUMBER>
 *
 * Example:
 * [player] call ace_common_fnc_getMagneticBearing
 *
 * Public: Yes
 */

params [["_source", ACE_player, [objNull, 0]]];

[
    (if (_source isEqualType 0) then { _source } else { getDir _source })
    + (missionNamespace getVariable [QGVAR(magneticDeclinationOffset), 0])
] call CBA_fnc_simplifyAngle;
