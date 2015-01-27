/**
 * fnc_hasTourniquetAppliedTo.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

((([(_this select 0),QGVAR(tourniquets)] call EFUNC(common,getDefinedVariable)) select ([(_this select 1)] call FUNC(getBodyPartNumber))) > 0);