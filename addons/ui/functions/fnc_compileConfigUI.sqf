/*
 * Author: Jonpas
 * Compiles and caches UI from ACE_UI config.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_ui_fnc_compileConfigUI
 *
 * Public: No
 */
#include "script_component.hpp"

{
    private _failure = false;
    private _class = toLower (configName _x);

    private _idd = getNumber (_x >> "idd");

    private _elements = getArray (_x >> "elements");
    if (_elements isEqualTo []) then {
        ERROR_1("Failed compiling ACE_UI for Element: %1 - missing elements",_class);
        _failure = true;
    };

    private _location = getNumber (_x >> "location");
    if !(_location in [ANYWHERE, GROUND_ONLY, VEHICLE_ONLY]) then {
        ERROR_2("Failed compiling ACE_UI for Element: %1 - missing or invalid location %2",_class,_location);
        _failure = true;
    };

    if (!_failure) then {
        private _conditions = [];
        {
            _conditions pushBack [compile (getText _x), configName _x];
            TRACE_1("Caching Condition",_x);
        } forEach (configProperties [_x >> "conditions"]);

        GVAR(configCache) setVariable [_class, [_idd, _elements, _location, _conditions]];
    };
} forEach ("true" configClasses (configFile >> "ACE_UI"));
