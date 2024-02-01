#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * 
 *
 * Arguments:
 * 0: Object or Bearing <OBJECT><NUMBER>
 *
 * Return Value:
 * Compass Bearing <NUMBER>
 *
 * Example:
 * [player] call ace_common_fnc_getMagneticBearing
 *
 * Public: Yes
 */

params [["_source", ace_player, [objNull, 0]]];

(missionNamespace getVariable [QGVAR(magneticDeclinationOffset), 0]) + 
(if (_source isEqualType 0) then { _source } else { getDir _source })
