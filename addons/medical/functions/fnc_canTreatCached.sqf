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
 * ReturnValue:
 * Can Treat <BOOL>
 *
 * Public: No
 */

#include "script_component.hpp"

#define MAX_DURATION_CACHE 2

// parameters, function, namespace, uid
[_this, DFUNC(canTreat), _this select 1, format[QGVAR(canTreat_%1_%2), _this select 2, _this select 3], MAX_DURATION_CACHE, "clearConditionCaches"] call EFUNC(common,cachedCall);
