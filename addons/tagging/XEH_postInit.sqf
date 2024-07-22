// by esteldunedain
#include "script_component.hpp"

if (hasInterface) then {
    // Compile and cache config tags
    call FUNC(compileConfigTags);

    // Scripted tag adding EH
    [QGVAR(applyCustomTag), LINKFUNC(applyCustomTag)] call CBA_fnc_addEventHandler;

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

[QGVAR(createTag), LINKFUNC(createTag)] call CBA_fnc_addEventHandler;
