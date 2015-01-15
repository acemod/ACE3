// by CAA-Picard

(missionNameSpace getVariable [QGVAR(syncMarkers), true] && {GVAR(EveryoneCanDrawOnBriefing)}) ||
{(!isNull player) && {"ACE_MapTools" in items player}}
