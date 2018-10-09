#include "script_component.hpp"

[QGVAR(showDogtag), DFUNC(showDogtag)] call CBA_fnc_addEventHandler;
[QGVAR(sendDogtagData), DFUNC(sendDogtagData)] call CBA_fnc_addEventHandler;
[QGVAR(getDogtagItem), DFUNC(getDogtagItem)] call CBA_fnc_addEventHandler;
[QGVAR(addDogtagItem), DFUNC(addDogtagItem)] call CBA_fnc_addEventHandler;


//Add actions and event handlers only if ace_medical is loaded
// - Adding actions via config would create a dependency
if (["ACE_Medical"] call EFUNC(common,isModLoaded)) then {
    if (hasInterface) then {
        private _checkTagAction = [
            "ACE_CheckDogtag",
            format ["%1: %2", localize LSTRING(itemName), localize LSTRING(checkDogtag)],
            QPATHTOF(data\dogtag_icon_ca.paa),
            {[_player,_target] call FUNC(checkDogtag)},
            {!isNil {_target getVariable QGVAR(dogtagData)}}
        ] call EFUNC(interact_menu,createAction);

        ["ACE_bodyBagObject", 0, ["ACE_MainActions"], _checkTagAction] call EFUNC(interact_menu,addActionToClass);

        private _takeTagAction = [
            "ACE_TakeDogtag",
            format ["%1: %2", localize LSTRING(itemName), localize LSTRING(takeDogtag)],
            QPATHTOF(data\dogtag_icon_ca.paa),
            {[_player,_target] call FUNC(takeDogtag)},
            {(!isNil {_target getVariable QGVAR(dogtagData)}) && {((_target getVariable [QGVAR(dogtagTaken), objNull]) != _target)}}
        ] call EFUNC(interact_menu,createAction);

        ["ACE_bodyBagObject", 0, ["ACE_MainActions"], _takeTagAction] call EFUNC(interact_menu,addActionToClass);
    };

    if (isServer) then {
        ["ace_placedInBodyBag", {
            params ["_target", "_bodyBag"];
            TRACE_2("ace_placedInBodyBag eh",_target,_bodyBag);

            private _dogTagData = [_target] call FUNC(getDogtagData);
            _bodyBag setVariable [QGVAR(dogtagData), _dogTagData, true];

            if ((_target getVariable [QGVAR(dogtagTaken), objNull]) == _target) then {
                _bodyBag setVariable [QGVAR(dogtagTaken), _bodyBag, true];
            };
        }] call CBA_fnc_addEventHandler;
    };
};

if (["ACE_Arsenal"] call EFUNC(common,isModLoaded)) then {
    [QEGVAR(arsenal,rightPanelFilled), {

        params ["_display", "_leftPanelIDC", "_rightPanelIDC"];

        if (_leftPanelIDC in [2010, 2012, 2014] && {_rightPanelIDC == 38}) then {
            LOG("passed");
            private _rightPanel = _display displayCtrl 15;
            (lnbSize _rightPanel) params ["_rows", "_columns"];

            private _allDogtags = missionNameSpace getVariable [QGVAR(allDogtags), []];
            private _allDogtagDatas = missionNameSpace getVariable [QGVAR(allDogtagDatas), []];

            for "_r" from 0 to (_rows - 1) do {
                private _data = _rightPanel lnbData [_r, 0];

                if (_data isKindOf ["ACE_dogtag", (configFile >> "CfgWeapons")]) then {

                    private _dogtagData = [];
                    private _index = _allDogtags find _data;
                    _dogtagData = _allDogtagDatas select _index;
                    private _dogtagString =  [localize LSTRING(itemName), ": ", (_dogtagData select 0)] joinString "";

                    _rightPanel lnbSetText [[_r, 1], _dogtagString];
                };
            };
        };
    }] call CBA_fnc_addEventHandler;
};

// disable dogtags for civilians
"CIV_F" call FUNC(disableFactionDogtags);
