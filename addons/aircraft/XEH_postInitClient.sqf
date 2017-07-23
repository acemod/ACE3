#include "script_component.hpp"

if (!hasInterface) exitWith {};

private _cfgAction = configFile >> "CfgActions" >> "Eject";
GVAR(ejectActionParams) = [
    [
        "", // will be set with setUserActionText
        {moveOut (_this select 1)},
        nil,
        getNumber (_cfgAction >> "priority"),
        false,
        true,
        getText (_cfgAction >> "shortcut"),
        QUOTE([ARR_2(_this,_target)] call FUNC(canShowEject))
    ],
    getText (_cfgAction >> "text"),
    getText (_cfgAction >> "textDefault")
];

["Helicopter", "initPost", LINKFUNC(initEjectAction)] call CBA_fnc_addClassEventHandler;
