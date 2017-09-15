#include "script_component.hpp"

if (!hasInterface) exitWith {};

private _cfgAction = configFile >> "CfgActions" >> "Eject";
GVAR(ejectActionParams) = [
    [
        "", // will be set with setUserActionText
        {
            params ["_vehicle", "_unit"];
            private _preserveEngineOn = (_unit == driver _vehicle) && {isEngineOn _vehicle};
            moveOut _unit;
            if (_preserveEngineOn) then {
                // vehicle is local to last driver, no need to care
                _vehicle engineOn true;
            };
        },
        nil,
        getNumber (_cfgAction >> "priority"),
        false,
        true,
        getText (_cfgAction >> "shortcut"),
        '[_this, _target] call DFUNC(canShowEject)'
    ],
    getText (_cfgAction >> "text"),
    getText (_cfgAction >> "textDefault")
];

["Helicopter", "initPost", LINKFUNC(initEjectAction)] call CBA_fnc_addClassEventHandler;
