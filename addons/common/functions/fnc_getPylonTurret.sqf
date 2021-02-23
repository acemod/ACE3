#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Returns the turret path that owns the given pylon.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Pylon Index (starting at 0) <NUMBER>
 *
 * Return Value:
 * Turret Path (either [-1] or [0]) <ARRAY>
 *
 * Example:
 * [cursorObject, 0] call ace_common_fnc_getPylonTurret
 *
 * Public: No
 */

params ["_vehicle", "_pylonIndex"];

getAllPylonsInfo _vehicle param [_pylonIndex, []] param [2, [-1]]
