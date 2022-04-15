#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

if (hasInterface) then {
    ["CBA_settingsInitialized", {
        private _ejectAction = configFile >> "CfgActions" >> "Eject";
        private _hideEjectAction = missionNamespace getVariable [QEGVAR(vehicles,hideEjectAction), false];

        private _text = getText (_ejectAction >> "text");
        if (_hideEjectAction) then {
            _text = format ["<t color='#808080'>%1</t>", _text];
        };

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
                [getNumber (_ejectAction >> "priority"), -999] select _hideEjectAction,
                false,
                true,
                getText (_ejectAction >> "shortcut"),
                '[_this, _target] call DFUNC(canShowEject)'
            ],
            _text,
            getText (_ejectAction >> "textDefault")
        ];

        ["Helicopter", "InitPost", LINKFUNC(initEjectAction), nil, nil, true] call CBA_fnc_addClassEventHandler;
    }] call CBA_fnc_addEventHandler;
};

ADDON = true;
