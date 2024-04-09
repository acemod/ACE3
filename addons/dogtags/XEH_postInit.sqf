#include "script_component.hpp"

[QGVAR(showDogtag), LINKFUNC(showDogtag)] call CBA_fnc_addEventHandler;
[QGVAR(sendDogtagData), LINKFUNC(sendDogtagData)] call CBA_fnc_addEventHandler;
[QGVAR(getDogtagItem), LINKFUNC(getDogtagItem)] call CBA_fnc_addEventHandler;
[QGVAR(addDogtagItem), LINKFUNC(addDogtagItem)] call CBA_fnc_addEventHandler;

// Add actions and event handlers only if ace_medical is loaded
// - Adding actions via config would create a dependency
if (["ace_medical"] call EFUNC(common,isModLoaded)) then {
    if (hasInterface) then {
        private _checkTagAction = [
            "ACE_CheckDogtag",
            format ["%1: %2", localize LSTRING(itemName), localize LSTRING(checkDogtag)],
            QPATHTOF(data\dogtag_icon_ca.paa),
            {[_player,_target] call FUNC(checkDogtag)},
            {!isNil {_target getVariable QGVAR(dogtagData)}}
        ] call EFUNC(interact_menu,createAction);

        ["ACE_bodyBagObject", 0, ["ACE_MainActions"], _checkTagAction, true] call EFUNC(interact_menu,addActionToClass);

        private _takeTagAction = [
            "ACE_TakeDogtag",
            format ["%1: %2", localize LSTRING(itemName), localize LSTRING(takeDogtag)],
            QPATHTOF(data\dogtag_icon_ca.paa),
            {[_player,_target] call FUNC(takeDogtag)},
            {(!isNil {_target getVariable QGVAR(dogtagData)}) && {((_target getVariable [QGVAR(dogtagTaken), objNull]) != _target)}}
        ] call EFUNC(interact_menu,createAction);

        ["ACE_bodyBagObject", 0, ["ACE_MainActions"], _takeTagAction, true] call EFUNC(interact_menu,addActionToClass);
    };

    if (isServer) then {
        ["ace_placedInBodyBag", {
            params ["_target", "_bodyBag", "_isGrave"];
            if (_isGrave) exitWith {};
            TRACE_2("ace_placedInBodyBag eh",_target,_bodyBag);

            private _dogTagData = [_target] call FUNC(getDogtagData);
            _bodyBag setVariable [QGVAR(dogtagData), _dogTagData, true];

            if ((_target getVariable [QGVAR(dogtagTaken), objNull]) == _target) then {
                _bodyBag setVariable [QGVAR(dogtagTaken), _bodyBag, true];
            };
        }] call CBA_fnc_addEventHandler;
    };
};

// If the arsenal is loaded, show the custom names for dog tags when in the arsenal
if (["ace_arsenal"] call EFUNC(common,isModLoaded)) then {
    [QEGVAR(arsenal,rightPanelFilled), {
        params ["_display", "_leftPanelIDC", "_rightPanelIDC"];

        if (_leftPanelIDC in [2010, 2012, 2014] && {_rightPanelIDC == 38}) then {
            LOG("passed");
            private _rightPanel = _display displayCtrl 15;
            private _allDogtags = missionNamespace getVariable [QGVAR(allDogtags), []];
            private _allDogtagsData = missionNamespace getVariable [QGVAR(allDogtagDatas), []];
            private _cfgWeapons = configFile >> "CfgWeapons";
            private _item = "";
            private _dogtagData = [];

            for "_i" from 0 to (lnbSize _rightPanel select 0) - 1 do {
                _item = _rightPanel lnbData [_i, 0];

                if (_item isKindOf ["ACE_dogtag", _cfgWeapons]) then {
                    _dogtagData = _allDogtagsData param [_allDogtags find _item, []];

                    // If data doesn't exist, put name as "unknown"
                    _rightPanel lnbSetText [[_i, 1], [LLSTRING(itemName), ": ", _dogtagData param [0, LELSTRING(common,unknown)]] joinString ""];
                };
            };
        };
    }] call CBA_fnc_addEventHandler;
};

// Disable dogtags for civilians
"CIV_F" call FUNC(disableFactionDogtags);
