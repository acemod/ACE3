// #define DEBUG_MODE_FULL
#include "script_component.hpp"

[QEGVAR(medical,setUnconscious), LINKFUNC(setUnconscious)] call CBA_fnc_addEventHandler;

if (!hasInterface) exitWith {};

// Fractures affect base sway, pain makes it worse
["baseline", {
    ACE_player getVariable [QEGVAR(medical_engine,aimFracture), 0]
}, QUOTE(ADDON)] call EFUNC(common,addSwayFactor);

// Max pain = 5x sway
["multiplier", {
    1 + (GET_PAIN_PERCEIVED(ACE_player) * 4)
}, QUOTE(ADDON)] call EFUNC(common,addSwayFactor);

#ifdef DEBUG_MODE_FULL
    call compile preprocessFileLineNumbers QPATHTOF(dev\reportSettings.sqf);
    call compile preprocessFileLineNumbers QPATHTOF(dev\watchVariable.sqf);
    call compile preprocessFileLineNumbers QPATHTOF(dev\debugDisplay.sqf);
#endif
