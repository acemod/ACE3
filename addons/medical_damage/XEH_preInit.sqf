#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.sqf"

call FUNC(parseConfigForInjuries);

addMissionEventHandler ["Loaded",{
    INFO("Mission Loaded - Reloading medical configs for extension");
    // Reload configs into extension (handle full game restart)
    call FUNC(parseConfigForInjuries);
}];

// decide which woundsHandler to use by whether the extension is present or not
// if ("ace_medical" callExtension "version" != "") then {

    // DFUNC(woundsHandlerActive) = LINKFUNC(woundsHandler);
// } else {
    // INFO("Using woundsHandlerSQF");
    DFUNC(woundsHandlerActive) = LINKFUNC(woundsHandlerSQF);
// };

[QEGVAR(medical,damageReceived), LINKFUNC(applyDamage)] call CBA_fnc_addEventHandler;
[QEGVAR(medical,woundReceived), {_this call FUNC(woundsHandlerActive);}] call CBA_fnc_addEventHandler;

GVAR(bodyPartsToHitpoints) = [
    ["Head", ["hitface", "hitneck", "hithead"]],
    ["Body", ["hitchest", "hitdiaphragm", "hitabdomen", "hitpelvis"]],
    ["LeftArm",["hitleftarm"]],
    ["RightArm",["hitrightarm"]],
    ["LeftLeg",["hitleftleg"]],
    ["RightLeg",["hitrightleg"]]
];

GVAR(structuralDamageToBodyPartCoeff) = [0.8, 0.33, 0.7, 0.7, 0.7, 0.7];


GVAR(usefulHitpoints) = [];
{ 
    {
        GVAR(usefulHitpoints) pushBack _x;
    } forEach _x#1; 
} forEach GVAR(bodyPartsToHitpoints);

ADDON = true;
