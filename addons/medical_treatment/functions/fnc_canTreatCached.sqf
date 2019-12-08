#include "script_component.hpp"
/*
 * Author: Glowbal
 * Cached check to determine if given treatment can be performed.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Body Part <STRING>
 * 3: Treatment <STRING>
 *
 * Return Value:
 * Can Treat <BOOL>
 *
 * Example:
 * [player, cursorObject, "Head", "SurgicalKit"] call ace_medical_treatment_fnc_canTreatCached
 *
 * Public: No
 */

params ["", "_patient", "_bodyPart", "_classname"];

[_this, FUNC(canTreat), _patient, format [QGVAR(canTreat_%1_%2), _bodyPart, _classname], CAN_TREAT_CONDITION_CACHE_EXPIRY, QEGVAR(interact_menu,clearConditionCaches)] call EFUNC(common,cachedCall);
