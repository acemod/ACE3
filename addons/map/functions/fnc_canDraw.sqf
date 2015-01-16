// by CAA-Picard

#include "script_component.hpp"

(missionNameSpace getVariable [QGVAR(drawing_syncMarkers), true] && {GVAR(EveryoneCanDrawOnBriefing)}) ||
{(!isNull ACE_player) && {"ACE_MapTools" in items ACE_player}}
