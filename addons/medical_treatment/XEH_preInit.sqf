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
    ["AinvPknlMstpSnonWnonDnon_medic1", 10],
    ["AinvPknlMstpSnonWnonDr_medic0", 12]
];

// class names of medical facilities (config case)
GVAR(facilityClasses) = [];
{
    {
        private _name = configName (configFile >> "CfgVehicles" >> _x);
        if (_name != "") then { GVAR(facilityClasses) pushBackUnique _name; };
    } forEach getArray _x;
} forEach configProperties [configFile >> QEGVAR(medical,facilities), "isArray _x"];

// replace medical items with their ACE equivalents
configProperties [configFile >> QEGVAR(medical,replacementItems), "isArray _x"] apply {
    // turn [["stuff", 2], ...] into ["stuff", "stuff", ...]
    private _replacements = [];
    {
        _x params ["_item", "_count"];
        for "_i" from 1 to _count do {
            _replacements pushBack _item;
        };
    } forEach getArray _x;

    // check if replacement is for item type or class name
    private _configName = configName _x;
    private _toReplace = if (_configName find "ItemType_" == 0) then {
        parseNumber (_configName select [9])
    } else {
        _configName
    };

    // register replacement
    [_toReplace, _replacements] call EFUNC(common,registerItemReplacement);
};

ADDON = true;
