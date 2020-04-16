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
&& {CBA_missionTime - (_this getVariable [QGVAR(lastFired), -30]) > 30}
&& {!(_this getVariable [QEGVAR(captives,isHandcuffed), false])}
