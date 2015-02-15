/**
 * fn_isSetTreatmentMutex.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

// Max locked time is 2 minutes.
#define MAX_LOCKED_TIME 120

(time - ((_this select 0) getvariable [QGVAR(PerformingTreatmentMutex), -MAX_LOCKED_TIME]) <= MAX_LOCKED_TIME);