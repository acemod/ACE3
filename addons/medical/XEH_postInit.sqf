// #define DEBUG_MODE_FULL
#include "script_component.hpp"

[QEGVAR(medical,setUnconscious), LINKFUNC(setUnconscious)] call CBA_fnc_addEventHandler;

// For BETA/RC - debug non-default settings to rpt:
call compile preprocessFileLineNumbers QPATHTOF(dev\reportSettings.sqf);

if (!hasInterface) exitWith {};

[missionNamespace, "ACE_setCustomAimCoef", QUOTE(ADDON), {
    (linearConversion [0, 1, GET_PAIN_PERCEIVED(ACE_player), 1, 5, true]) + (ACE_player getVariable [QEGVAR(medical_engine,aimFracture), 0])
}] call EFUNC(common,arithmeticSetSource);

#ifdef DEBUG_MODE_FULL
    call compile preprocessFileLineNumbers QPATHTOF(dev\watchVariable.sqf);
    call compile preprocessFileLineNumbers QPATHTOF(dev\debugDisplay.sqf);
#endif
