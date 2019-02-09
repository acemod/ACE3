// by esteldunedain
#include "script_component.hpp"


// Cache for static objects
GVAR(cacheStaticModels) = [false] call CBA_fnc_createNamespace;

// Consider static everything vehicle that inherit from Static
// This include houses (which we don't need), but also walls, that we do


private _cacheStaticModels = uiNamespace getVariable [QGVAR(cacheStaticModels), []];

{
    if (_x isEqualType "") then {
            GVAR(cacheStaticModels) setVariable [_x, true];
    };
} forEach ([[], _cacheStaticModels] select (_cacheStaticModels isEqualType []));

if (hasInterface) then {
    // Compile and cache config tags
    call FUNC(compileConfigTags);

    // Scripted tag adding EH
    [QGVAR(applyCustomTag), FUNC(applyCustomTag)] call CBA_fnc_addEventHandler;

    // Keybind
    ["ACE3 Equipment", QGVAR(quickTag), localize LSTRING(QuickTag), {
        // Conditions
        if !(ACE_player call FUNC(checkTaggable)) exitWith {false};

        // Statement
        ACE_player call FUNC(quickTag);
        true
    }, {false}, [0, [false, false, false]], false] call CBA_fnc_addKeybind; // Unbound
};

if (!isServer) exitWith {};

GVAR(testingThread) = false;
GVAR(tagsToTest) = [];

[QGVAR(createTag), DFUNC(createTag)] call CBA_fnc_addEventHandler;
