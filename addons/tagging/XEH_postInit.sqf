// by esteldunedain
#include "script_component.hpp"


// Cache for static objects
GVAR(cacheStaticModels) = createLocation ["ACE_HashLocation", [-10000,-10000,-10000], 0, 0];
GVAR(cacheStaticModels) setText QGVAR(cacheStaticModels);

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
                GVAR(cacheStaticModels) setVariable [toLower (_array select ((count _array) - 2)), _cfgClass];
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
                GVAR(cacheStaticModels) setVariable [toLower (_array select ((count _array) - 2)), _cfgClass];
            };
        };
    };
};

if (hasInterface) then {
    // Cache tags
    {
        private _failure = false;
        private _class = configName _x;

        private _displayName = getText (_x >> "displayName");
        if (_displayName == "") then {
            ACE_LOGERROR_1("Failed compiling ACE_Tags for tag: %1 - missing displayName",_class);
            _failure = true;
        };

        private _requiredItem = toLower (getText (_x >> "requiredItem"));
        if (_requiredItem == "") then {
            ACE_LOGERROR_1("Failed compiling ACE_Tags for tag: %1 - missing requiredItem",_class);
            _failure = true;
        } else {
            if (!isClass (configFile >> "CfgWeapons" >> _requiredItem)) then {
                ACE_LOGERROR_2("Failed compiling ACE_Tags for tag: %1 - requiredItem %2 does not exist",_class,_requiredItem);
                _failure = true;
            };
        };

        private _textures = getArray (_x >> "textures");
        if (_textures isEqualTo []) then {
            ACE_LOGERROR_1("Failed compiling ACE_Tags for tag: %1 - missing textures",_class);
            _failure = true;
        };

        private _icon = getText (_x >> "icon");

        if (!_failure) then {
            GVAR(cachedTags) pushBack [_class, _displayName, _requiredItem, _textures, _icon];
            if !(_requiredItem in GVAR(cachedRequiredItems)) then {
                GVAR(cachedRequiredItems) pushBack _requiredItem;
            };
        };
    } forEach ("true" configClasses (configFile >> "ACE_Tags"));

    // Scripted tag adding
    [QGVAR(addCustomTag), {
        params ["_identifier", "_displayName", "_requiredItem"];

        // Add only if tag not already added (compare identifiers)
        if (GVAR(cachedTags) select {_x select 0 == _identifier} isEqualTo [])  then {
            GVAR(cachedTags) pushBack _this;
            if !(_requiredItem in GVAR(cachedRequiredItems)) then {
                GVAR(cachedRequiredItems) pushBack _requiredItem;
            };
            TRACE_1("Added custom script tag",_this);
        } else {
            ACE_LOGINFO_2("Tag with selected identifier already exists: %1 (%2)",_identifier,_displayName)
        };
    }] call CBA_fnc_addEventHandler;
};

if (!isServer) exitWith {};

GVAR(testingThread) = false;
GVAR(tagsToTest) = [];

[QGVAR(createTag), DFUNC(createTag)] call CBA_fnc_addEventHandler;
