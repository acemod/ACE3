
#include "script_component.hpp"

["InitSettingsFromModules", {
    // TODO This is a basic and limited implementation that mimics some of the functionality from the A3 module framework, but not all of it.
    // We have to execute this in the postInit XEH because on object init, the parameters of the modules are not yet available. They are if we execute it at the start of postInit execution.
    {
        [_x] call {
            private ["_logic", "_logicType", "_config", "_isGlobal", "_isDisposable", "_isPersistent","_function"];
            _logic = _this select 0;
            _logicType = typeof _logic;
            _logic hideobject true;

            if (_logic getvariable [QGVAR(initalized), false]) exitwith {};
            _config = (configFile >> "CfgVehicles" >> _logicType);
            if !(isClass _config) exitwith {};

            // isGlobal = 1;
            _isGlobal = getNumber (_config >> "isGlobal") > 0;
            _isDisposable = getNumber (_config >> "isDisposable") > 0;
            _isPersistent = getNumber (_config >> "isPersistent") > 0 || getnumber (_config >> "isGlobal") > 1;
            _function = getText (_config >> "function");
            if (isnil _function) then {
                _function = compile _function;
            } else {
                _function = missionNamespace getvariable _function;
            };

            if (_isGlobal) then {
                [_logic, [], true] call _function;
            } else {
                if (isServer) then {
                    [_logic, [], true] call _function;
                };
            };

            if !(_isPersistent) then {
                _logic setvariable [QGVAR(initalized), true];
            };

            if (_isDisposable) then {
                deleteVehicle _logic;
            };
        };
    }foreach GVAR(moduleInitCollection);
}] call EFUNC(common,addEventhandler);
