#include "script_component.hpp"
/*
* Author: PabstMirror
* Gets viewports for a vehicle. Caches results to a setVar on the vic.
*
* Arguments:
* 0: vehicle <OBJECT>
*
* Return Value:
* ARRAY
*
* Example:
* [vehicle player] call ace_viewports_fnc_getViewports
*
* Public: No
*/

params ["_vehicle"];

private _viewports = _vehicle getVariable [QGVAR(viewports), nil];

if (isNil {_viewports}) then {
    private _configs = "true" configClasses ((configOf _vehicle) >> "ace_viewports");
    _viewports = _configs apply {
        private _name = configName _x;
        private _type = getText (_x >> "type");
        private _camLocation = getArray (_x >> "camLocation");
        private _camAttach = getArray (_x >> "camAttach");
        if (_camAttach isEqualTo []) then { 
            _camAttach = getNumber (_x >> "camAttach");
        };
        private _screenLocation = getArray (_x >> "screenLocation");
        if (_screenLocation isEqualTo []) then {
            _screenLocation =_camLocation vectorAdd [0,0,-0.175] // generic periscope drop height from cam
        };
        private _maxDistance = getNumber (_x  >> "maxDistance");
        if (_maxDistance == 0) then {
            _maxDistance = 0.75;
        };
        private _compartments = (getArray (_x >> "compartments")) apply {toLower _x};
        private _roles = (getArray (_x >> "roles")) apply {toLower _x};

        [_name, _type, _camLocation, _camAttach, _screenLocation, _maxDistance, _compartments, _roles]
    };
    TRACE_2("getViewports",typeOf _vehicle,count _viewports);
    _vehicle setVariable [QGVAR(viewports), _viewports];
};

_viewports
