#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.inc.sqf"

#define ARSENAL_CATEGORY_ICON (["\A3\ui_f\data\igui\cfg\actions\heal_ca.paa", QPATHTOEF(medical_gui,data\categories\bandage_fracture.paa)] select (["ace_medical_gui"] call EFUNC(common,isModLoaded)))

// config to determine animation acceleration coefficient
// adjusting these is trail and error
// if the animation is cut of ingame, increase these values
// if the unit idles too much, decrease them
GVAR(animDurations) = createHashMapFromArray [
    ["ainvpknlmstpslaywnondnon_medic", 7.5],
    ["ainvppnemstpslaywnondnon_medic", 7],
    ["ainvpknlmstpslaywrfldnon_medic", 7],
    ["ainvppnemstpslaywrfldnon_medic", 9.5],
    ["ainvpknlmstpslaywlnrdnon_medic", 9],
    ["ainvpknlmstpslaywpstdnon_medic", 9.5],
    ["ainvppnemstpslaywpstdnon_medic", 10],
    ["ainvpknlmstpslaywnondnon_medicother", 8.5],
    ["ainvppnemstpslaywnondnon_medicother", 8.5],
    ["ainvpknlmstpslaywrfldnon_medicother", 7],
    ["ainvppnemstpslaywrfldnon_medicother", 9],
    ["ainvpknlmstpslaywlnrdnon_medicother", 9],
    ["ainvpknlmstpslaywpstdnon_medicother", 10],
    ["ainvppnemstpslaywpstdnon_medicother", 8.5],
    ["ainvpknlmstpsnonwnondnon_medic1", 10],
    ["ainvpknlmstpsnonwnondr_medic0", 12]
];

// class names of medical facilities (config case)
GVAR(facilityClasses) = [];
{
    {
        private _name = configName (configFile >> "CfgVehicles" >> _x);
        if (_name != "") then { GVAR(facilityClasses) pushBackUnique _name; };
    } forEach getArray _x;
} forEach configProperties [configFile >> QEGVAR(medical,facilities), "isArray _x"];

// Custom Arsenal tab
if (["ace_arsenal"] call EFUNC(common,isModLoaded)) then {
    [MEDICAL_TREATMENT_ITEMS, LLSTRING(medicalTab), ARSENAL_CATEGORY_ICON, -1, true] call EFUNC(arsenal,addRightPanelButton);
};

ADDON = true;
