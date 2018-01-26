#include "script_component.hpp"

[QEGVAR(common,initSettingsFromModules), {
    // TODO This is a basic and limited implementation that mimics some of the functionality from the A3 module framework, but not all of it.
    // We have to execute this in the postInit XEH because on object init, the parameters of the modules are not yet available. They are if we execute it at the start of postInit execution.

    private _uniqueModulesHandled = [];
    {
        [_x] call {
            params ["_logic"];
            private _logicType = typeOf _logic;
            _logic hideObject true;

            if (_logic getVariable [QGVAR(initalized), false]) exitWith {};
            private _config = (configFile >> "CfgVehicles" >> _logicType);
            if !(isClass _config) exitWith {};

            private _isGlobal = getNumber (_config >> "isGlobal") > 0;
            private _isDisposable = getNumber (_config >> "isDisposable") > 0;
            private _isPersistent = getNumber (_config >> "isPersistent") > 0 || getNumber (_config >> "isGlobal") > 1;
            private _isSingular  = getNumber (_config >> "isSingular") > 0;
            private _function = getText (_config >> "function");
            if (isNil _function) then {
                _function = compile _function;
            } else {
                _function = missionNamespace getVariable _function;
            };
            if (_isSingular && {_logicType in _uniqueModulesHandled}) then { //ToDo: should this be an exit?
                WARNING_1("Module [%1] - More than 1 singular module placed", _logicType);
            };
            if (_isSingular) then {_uniqueModulesHandled pushBack _logicType;};

            if (_isGlobal || isServer) then {
                [_logic, (synchronizedObjects _logic), true] call _function;
            };

            if !(_isPersistent) then {
                _logic setVariable [QGVAR(initalized), true];
            };

            if (_isDisposable) then {
                if (_isGlobal) then {WARNING_1("Deleting Global Module??? [%1]",_logicType);};
                deleteVehicle _logic;
            };
        };
    } forEach GVAR(moduleInitCollection);

    if (isServer) then {
        GVAR(serverModulesRead) = true;
        publicVariable QGVAR(serverModulesRead);
    };
}] call CBA_fnc_addEventHandler;
