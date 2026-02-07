#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Gets viewports for a vehicle from config. Caches results to a hashmap.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * Viewport information <ARRAY>
 *
 * Example:
 * [vehicle player] call ace_viewports_fnc_getViewports
 *
 * Public: No
 */

params ["_vehicle"];

GVAR(viewports) getOrDefaultCall [typeOf _vehicle, {
    private _viewports = (configProperties [configOf _vehicle >> QUOTE(ADDON), "isClass _x", true]) apply {
        // name [STRING] is just used for debug
        private _name = configName _x;
        // type [STRING] - Optional
        private _type = getText (_x >> "type");
        // camLocation [ARRAY or STRING] - Required
        private _camLocation = if (isArray (_x >> "camLocation")) then {
            getArray (_x >> "camLocation") // modelOffset
        } else {
            getText (_x >> "camLocation") // memPoint
        };
        // camAttach [ARRAY or NUMBER] - Required
        private _camAttach = if (isArray (_x >> "camAttach")) then {
            getArray (_x >> "camAttach") // turret
        } else {
            getNumber (_x >> "camAttach") // angle
        };
        // screenLocation [ARRAY or STRING] - Optional (will be converted to ARRAY here!)
        private _screenLocation = if (isArray (_x >> "screenLocation")) then {
            getArray (_x >> "screenLocation") // modelOffset
        } else {
            getText (_x >> "screenLocation") // memPoint
        };
        if (_screenLocation isEqualType "") then {
            // screens should be on the hull (IE non-animated) so we can do all the mem-point calculations here
            if (_screenLocation == "") exitWith { // use generic periscope drop height from cam
                private _camLocArray = if (_camLocation isEqualType []) then {
                    _camLocation
                } else {
                    _vehicle selectionPosition [_camLocation, "Memory"];
                };
                _screenLocation = _camLocArray vectorAdd [0,0,-0.175]
            };
            _screenLocation = _vehicle selectionPosition [_screenLocation, "Memory"];
        };
        // maxDistance [NUMBER] - Optional
        private _maxDistance = getNumber (_x >> "maxDistance");
        if (_maxDistance == 0) then {
            _maxDistance = 0.8;
        };
        // compartments [ARRAY] - Optional
        private _compartments = (getArray (_x >> "compartments")) apply {toLowerANSI _x};
        // roles [ARRAY] - Optional
        private _roles = (getArray (_x >> "roles")) apply {toLowerANSI _x};

        [_name, _type, _camLocation, _camAttach, _screenLocation, _maxDistance, _compartments, _roles]
    };
    TRACE_3("getViewports",_vehicle,typeOf _vehicle,count _viewports);
    _viewports
}, true] // return
