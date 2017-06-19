// by esteldunedain
#include "script_component.hpp"


// Cache for static objects
GVAR(cacheStaticModels) = [false] call CBA_fnc_createNamespace;

// Consider static everything vehicle that inherit from Static
// This include houses (which we don't need), but also walls, that we do
private _cfgBase = configFile >> "CfgVehicles";
private _countOptions = count _cfgBase;
for "_index" from 0 to (_countOptions - 1) do {
    private _cfgClass = _cfgBase select _index;
    if (isClass _cfgClass) then {
        if ((configName _cfgClass) isKindOf "Static") then {
            private _model = getText (_cfgClass >> "model");
            if (_model != "") then {
                private _array = _model splitString "\";
                GVAR(cacheStaticModels) setVariable [(_array select ((count _array) - 1)), true];
            };
        };
    };
};

// Also consider static all object inheriting from bridges
_cfgBase = configFile >> "CfgNonAIVehicles";
_countOptions = count _cfgBase;
for "_index" from 0 to (_countOptions - 1) do {
    private _cfgClass = _cfgBase select _index;
    if (isClass _cfgClass) then {
        if ((configName _cfgClass) isKindOf ["Bridge_base_F", _cfgBase]) then {
            private _model = getText (_cfgClass >> "model");
            if (_model != "") then {
                private _array = _model splitString "\";
                GVAR(cacheStaticModels) setVariable [(_array select ((count _array) - 1)), true];
            };
        };
    };
};

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
