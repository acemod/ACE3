/*
 * Author: Glowbal
 * Cached Check if the treatment action can be performed.
 *
 * Arguments:
 * 0: The caller <OBJECT>
 * 1: The target <OBJECT>
 * 2: Selection name <STRING>
 * 3: ACE_Medical_Treatments Classname <STRING>
 *
 * Return Value:
 * Can Treat <BOOL>
 *
 * Example:
 * [bob, kevin, "selection", "classname"] call ACE_medical_fnc_canTreatCached
 *
 * Public: No
 */

#include "script_component.hpp"

#define MAX_DURATION_CACHE 2
params ["", "_target", "_selection", "_classname"];

// parameters, function, namespace, uid
[_this, DFUNC(canTreat), _target, format [QGVAR(canTreat_%1_%2), _selection, _classname], MAX_DURATION_CACHE, QEGVAR(interact_menu,clearConditionCaches)] call EFUNC(common,cachedCall);
