// #define DEBUG_MODE_FULL
#include "script_component.hpp"

if (!hasInterface) exitWith {};

[missionNamespace, "ACE_setCustomAimCoef", QUOTE(ADDON), {
    private _pain = GET_PAIN_PERCEIVED(ACE_player);

    linearConversion [0, 1, _pain, 1, 5, true];
}] call EFUNC(common,arithmeticSetSource);

#ifdef DEBUG_MODE_FULL
    call compile preprocessFileLineNumbers QPATHTOF(dev\watchVariable.sqf);
    call compile preprocessFileLineNumbers QPATHTOF(dev\debugDisplay.sqf);
#endif
