#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Checks if a unit is currently considered safe enough to treat itself.
 *
 * Arguments:
 * Unit <OBJECT>
 *
 * Return Value:
 * Is unit safe enough <BOOL>
 *
 * Example:
 * call ACE_medical_ai_fnc_isSafe
 *
 * Public: No
 */

(getSuppression _this == 0)
&& {CBA_missionTime - (_this getVariable [QGVAR(lastFired), -999999]) > GVAR(timeSafe_shoot)}
&& {CBA_missionTime - (_this getVariable [QGVAR(lastHit), -999999]) > GVAR(timeSafe_hit)}
&& {!(_this getVariable [QEGVAR(captives,isHandcuffed), false])}
