
#include "script_component.hpp"

["InitSettingsFromModules", {
    // TODO This is a basic and limited implementation that mimics some of the functionality from the A3 module framework, but not all of it.
    // We have to execute this in the postInit XEH because on object init, the parameters of the modules are not yet available. They are if we execute it at the start of postInit execution.
    {
        [_x] call {
            private ["_logic", "_logicType", "_config", "_isGlobal", "_isDisposable", "_isPersistent","_function"];
            _logic = _this select 0;
            _logicType = typeOf _logic;
            _logic hideobject true;

            if (_logic getVariable [QGVAR(initalized), false]) exitWith {};
            _config = (configFile >> "CfgVehicles" >> _logicType);
            if !(isClass _config) exitWith {};

            // isGlobal = 1;
            _isGlobal = getNumber (_config >> "isGlobal") > 0;
            _isDisposable = getNumber (_config >> "isDisposable") > 0;
            _isPersistent = getNumber (_config >> "isPersistent") > 0 || getnumber (_config >> "isGlobal") > 1;
            _function = getText (_config >> "function");
            if (isNil _function) then {
                _function = compile _function;
            } else {
                _function = missionNamespace getVariable _function;
            };

            if (_isGlobal || isServer) then {
                [_logic, (synchronizedObjects _logic), true] call _function;
            };

            if !(_isPersistent) then {
                _logic setVariable [QGVAR(initalized), true];
            };

            if (_isDisposable) then {
                deleteVehicle _logic;
            };
        };
    }forEach GVAR(moduleInitCollection);
    
    if (isServer) then {
        GVAR(serverModulesRead) = true;
        publicVariable QGVAR(serverModulesRead);
    };
}] call EFUNC(common,addEventhandler);
