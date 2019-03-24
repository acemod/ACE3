#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.sqf"

// config to determine animation acceleration coefficient
// adjusting these is trail and error
// if the animation is cut of ingame, increase these values
// if the unit idles too much, decrease them
GVAR(animDurations) = [] call CBA_fnc_createNamespace;

{
    GVAR(animDurations) setVariable _x;
} forEach [
    ["AinvPknlMstpSlayWnonDnon_medic", 7.5],
    ["AinvPpneMstpSlayWnonDnon_medic", 7],
    ["AinvPknlMstpSlayWrflDnon_medic", 7],
    ["AinvPpneMstpSlayWrflDnon_medic", 9.5],
    ["AinvPknlMstpSlayWlnrDnon_medic", 9],
    ["AinvPknlMstpSlayWpstDnon_medic", 9.5],
    ["AinvPpneMstpSlayWpstDnon_medic", 10],
    ["AinvPknlMstpSlayWnonDnon_medicOther", 8.5],
    ["AinvPpneMstpSlayWnonDnon_medicOther", 8.5],
    ["AinvPknlMstpSlayWrflDnon_medicOther", 7],
    ["AinvPpneMstpSlayWrflDnon_medicOther", 9],
    ["AinvPknlMstpSlayWlnrDnon_medicOther", 9],
    ["AinvPknlMstpSlayWpstDnon_medicOther", 10],
    ["AinvPpneMstpSlayWpstDnon_medicOther", 8.5],
    ["AinvPknlMstpSnonWnonDnon_medic1", 10]
];

ADDON = true;
