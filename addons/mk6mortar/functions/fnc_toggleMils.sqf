/*
 * Author: PabstMirror
 *
 *
 * Arguments:
 *
 * Return Value:
 *
 * Example:
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_2(_mortarVeh,_unit);

private "_currentSetting";

_currentSetting = _mortarVeh getVariable [QGVAR(useMils), true];
_mortarVeh setVariable [QGVAR(useMils), (!_currentSetting)];
