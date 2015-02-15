/**
 * fn_getCurrentSelectedInjuryData.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

private ["_return", "_current"];
_return = "";
if (dialog) then {
    _current = lbCurSel 213;
    _return = lbData [213,_current];
};
_return;