#include "script_component.hpp"

[QGVAR(getDogtagItem), LINKFUNC(getDogtagItem)] call CBA_fnc_addEventHandler;
[QGVAR(sendDogtagData), LINKFUNC(sendDogtagData)] call CBA_fnc_addEventHandler;
[QGVAR(showDogtag), LINKFUNC(showDogtag)] call CBA_fnc_addEventHandler;

// Add actions and event handlers only if ace_medical is enabled
// - Adding actions via config would create a dependency
["CBA_settingsInitialized", {
    if !(GETEGVAR(medical,enabled,false)) exitWith {};

    if (hasInterface) then {
        private _checkTagAction = [
            "ACE_CheckDogtag",
            format ["%1: %2", LLSTRING(itemName), LLSTRING(checkDogtag)],
            QPATHTOF(data\dogtag_icon_ca.paa),
            {[_player, _target] call FUNC(checkDogtag)},
            {!isNil {_target getVariable QGVAR(dogtagData)}}
        ] call EFUNC(interact_menu,createAction);

        ["ACE_bodyBagObject", 0, ["ACE_MainActions"], _checkTagAction, true] call EFUNC(interact_menu,addActionToClass);

        private _takeTagAction = [
            "ACE_TakeDogtag",
            format ["%1: %2", LLSTRING(itemName), LLSTRING(takeDogtag)],
            QPATHTOF(data\dogtag_icon_ca.paa),
            {[_player, _target] call FUNC(takeDogtag)},
            {(!isNil {_target getVariable QGVAR(dogtagData)}) && {((_target getVariable [QGVAR(dogtagTaken), objNull]) != _target)}}
        ] call EFUNC(interact_menu,createAction);

        ["ACE_bodyBagObject", 0, ["ACE_MainActions"], _takeTagAction, true] call EFUNC(interact_menu,addActionToClass);
    };

    if (isServer) then {
        ["ace_placedInBodyBag", {
            params ["_target", "_bodyBag", "_isGrave"];

            if (_isGrave) exitWith {};
            TRACE_2("ace_placedInBodyBag eh",_target,_bodyBag);

            private _dogtagData = _target call FUNC(getDogtagData);
            _bodyBag setVariable [QGVAR(dogtagData), _dogtagData, true];

            if ((_target getVariable [QGVAR(dogtagTaken), objNull]) == _target) then {
                _bodyBag setVariable [QGVAR(dogtagTaken), _bodyBag, true];
            };
        }] call CBA_fnc_addEventHandler;
    };
}] call CBA_fnc_addEventHandler;

// If the arsenal is loaded, show the custom names for dog tags when in the arsenal
if (["ace_arsenal"] call EFUNC(common,isModLoaded)) then {
    [QEGVAR(arsenal,rightPanelFilled), {
        params ["_display", "_leftPanelIDC", "_rightPanelIDC"];

        if !(_leftPanelIDC in [2010, 2012, 2014] && {_rightPanelIDC == 38}) exitWith {};

        private _rightPanel = _display displayCtrl 15;

        TRACE_1("passed",_rightPanel);

        for "_i" from 0 to (lnbSize _rightPanel select 0) - 1 do {
            private _item = _rightPanel lnbData [_i, 0];

            // Check if item classname starts with "ACE_dogtag" (faster than isKindOf)
            if (_item find "ACE_dogtag_" == 0) then {
                private _name = (GVAR(dogtagsData) getOrDefault [_item, []]) param [0, ""];

                // If data doesn't exist or body has no name, set name as "unknown"
                if (_name == "") then {
                    _name = LELSTRING(common,unknown);
                };

                _rightPanel lnbSetText [[_i, 1], [LLSTRING(itemName), ": ", _name] joinString ""];
            };
        };
    }] call CBA_fnc_addEventHandler;
};

// Disable dogtags for civilians
"CIV_F" call FUNC(disableFactionDogtags);
