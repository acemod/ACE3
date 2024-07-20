#include "..\script_component.hpp"
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

   (CBA_missionTime - (_this getVariable [QGVAR(lastFired), -999999]) > GVAR(timeSafe_shoot))
&& {CBA_missionTime - (_this getVariable [QGVAR(lastHit), -999999]) > GVAR(timeSafe_hit)}
&& {CBA_missionTime - (_this getVariable [QGVAR(lastSuppressed), -999999]) > GVAR(timeSafe_suppressed)}
&& {!(_this getVariable [QEGVAR(captives,isHandcuffed), false])}
