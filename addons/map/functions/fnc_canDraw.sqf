// by CAA-Picard

#include "script_component.hpp"

(missionNameSpace getVariable [QGVAR(drawing_syncMarkers), true] && {GVAR(EveryoneCanDrawOnBriefing)}) ||
{(!isNull player) && {"ACE_MapTools" in items player}}
