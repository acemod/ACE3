// #define DEBUG_MODE_FULL
#include "script_component.hpp"

[QEGVAR(medical,setUnconscious), LINKFUNC(setUnconscious)] call CBA_fnc_addEventHandler;

if (!hasInterface) exitWith {};

[missionNamespace, "ACE_setCustomAimCoef", QUOTE(ADDON), {
    // pain has a 1:1 effect on sway, each untreated fracture doubles it
    (1 + GET_PAIN_PERCEIVED(ACE_player)) * (linearConversion [0, 8, (ACE_player getVariable [QEGVAR(medical_engine,aimFracture), 0]), 1, 4, true])
}] call EFUNC(common,arithmeticSetSource);

#ifdef DEBUG_MODE_FULL
    call compile preprocessFileLineNumbers QPATHTOF(dev\reportSettings.sqf);
    call compile preprocessFileLineNumbers QPATHTOF(dev\watchVariable.sqf);
    call compile preprocessFileLineNumbers QPATHTOF(dev\debugDisplay.sqf);
#endif
