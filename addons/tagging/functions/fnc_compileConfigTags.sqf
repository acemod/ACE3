#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Compiles and caches tags from ACE_Tags config.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_tagging_fnc_compileConfigTags
 *
 * Public: No
 */

{
    private _class = configName _x;
    private _result = [_x, false] call FUNC(parseConfigTag);

    if (_result isNotEqualTo []) then {
        _result params ["_tagInfo", "_requiredItem"];

        GVAR(cachedTags) pushBack _tagInfo;
        _tagInfo call FUNC(compileTagAction);
    };
} forEach ("true" configClasses (configFile >> "ACE_Tags"));

{
    private _class = configName _x;
    private _result = [_x, true] call FUNC(parseConfigTag);

    if (_result isNotEqualTo []) then {
        _result params ["_tagInfo", "_requiredItem"];

        GVAR(cachedTags) pushBack _tagInfo;
        _tagInfo call FUNC(compileTagAction);
    };
} forEach ("true" configClasses (missionConfigFile >> "ACE_Tags"));
