#include "script_component.hpp"
#include "defines.hpp"

GVAR(EH_ID) = 0;
GVAR(lastSearchTextLeft) = "";
GVAR(lastSearchTextRight) = "";

[QGVAR(initBox), {_this call FUNC(initBox)}] call CBA_fnc_addEventHandler;
[QGVAR(removeBox), {_this call FUNC(removeBox)}] call CBA_fnc_addEventHandler;

[QGVAR(broadcastFace), {
    params ["_unit", "_face"];

    _unit setFace _face;
}] call CBA_fnc_addEventHandler;

[QGVAR(broadcastVoice), {
    params ["_unit", "_voice"];

    _unit setSpeaker _voice;
}] call CBA_fnc_addEventHandler;

[QGVAR(loadoutUnshared), {
    params ["_contentPanelCtrl" , "_playerName", "_loadoutName"];

    if (!(isNil QGVAR(currentLoadoutsTab)) && {GVAR(currentLoadoutsTab) == IDC_buttonSharedLoadouts}) then {

        private _dataToCheck = _playerName + _loadoutName;

        for '_i' from 0 to (((lnbsize _contentPanelCtrl) select 0) - 1) do {
            if ((_contentPanelCtrl lnbData [_i, 1]) == _dataToCheck) exitwith {_contentPanelCtrl lnbDeleteRow _i};
        };
    } else {

        if (
            profileName == _playerName &&
            {!(isNil QGVAR(currentLoadoutsTab) && {GVAR(currentLoadoutsTab) == IDC_buttonMyLoadouts})}
        ) then {

            for '_i' from 0 to (((lnbsize _contentPanelCtrl) select 0) - 1) do {
                if ((_contentPanelCtrl lnbText [_i, 1]) == _loadoutName) exitwith {
                    _contentPanelCtrl lnbSetPicture [[_i, 0], QPATHTOF(data\iconPublicBlank.paa)];
                    _contentPanelCtrl lnbSetValue [[_i, 0], 0];
                };
            };
        };
    };
}] call CBA_fnc_addEventHandler;

[QGVAR(loadoutShared), {
    params ["_contentPanelCtrl" ,"_loadoutArgs"];
    _loadoutArgs params ["_playerName", "_loadoutName", "_loadoutData"];

    if (!(isNil QGVAR(currentLoadoutsTab)) && {GVAR(currentLoadoutsTab) == IDC_buttonSharedLoadouts}) then {

        private _curSelData =_contentPanelCtrl lnbData [(lnbCurSelRow _contentPanelCtrl), 1];
        ([_loadoutData] call FUNC(verifyLoadout)) params ["_loadout", "_nullItemsAmount", "_unavailableItemsAmount"];

        private _newRow = _contentPanelCtrl lnbAddRow [_playerName, _loadoutName];

        ADD_LOADOUTS_LIST_PICTURES

        _contentPanelCtrl lnbSetData [[_newRow, 1], _playerName + _loadoutName];

        if (_nullItemsAmount > 0) then {

            _contentPanelCtrl lnbSetColor [[_newRow, 1], [1, 0, 0, 0.5]];
        } else {

            if (_unavailableItemsAmount > 0) then {
                _contentPanelCtrl lnbSetColor [[_newRow, 1], [1, 1, 1, 0.25]];
            };
        };

        _contentPanelCtrl lnbSort [1, false];

        // Select previously selected loadout
        for '_i' from 0 to (((lnbsize _contentPanelCtrl) select 0) - 1) do {
            if ((_contentPanelCtrl lnbText [_i, 1]) == _curSelData) exitwith {_contentPanelCtrl lnbSetCurSelRow _i};
        };
    };
}] call CBA_fnc_addEventHandler;

if (["ACE_Medical"] call EFUNC(common,isModLoaded)) then {
    [QGVAR(displayOpened), {
        GVAR(virtualItems) set [17, (GVAR(virtualItems) select 17) -  ["FirstAidKit", "Medikit"]];
    }] call CBA_fnc_addEventHandler;
};

if (["ACE_dogtags"] call EFUNC(common,isModLoaded)) then {
    [QGVAR(rightPanelFilled), {

        params ["_display", "_leftPanelIDC", "_rightPanelIDC"];

        if (_leftPanelIDC in [IDC_buttonUniform, IDC_buttonVest, IDC_buttonBackpack] && {_rightPanelIDC == IDC_buttonMisc}) then {

            private _rightPanel = _display displayCtrl IDC_rightTabContentListnBox;
            (lnbSize _rightPanel) params ["_rows", "_columns"];

            private _allDogtags = missionNameSpace getVariable [QEGVAR(dogtags,allDogtags), []];
            private _allDogtagDatas = missionNameSpace getVariable [QEGVAR(dogtags,allDogtagDatas), []];

            for "_r" from 0 to (_rows - 1) do {
                private _data = _rightPanel lnbData [_r, 0];

                if (_data isKindOf ["ACE_dogtag", (configFile >> "CfgWeapons")]) then {

                    private _dogtagData = [];
                    private _index = _allDogtags find _data;
                    _dogtagData = _allDogtagDatas select _index;
                    private _dogtagString =  [localize ELSTRING(dogtags,itemName), ": ", (_dogtagData select 0)] joinString "";

                    _rightPanel lnbSetText [[_r, 1], _dogtagString];
                };
            };
        };
    }] call CBA_fnc_addEventHandler;
};
