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
    params ["_contentPanel" , "_playerName", "_loadoutName"];

    if (!(isNil QGVAR(currentLoadoutsTab)) && {GVAR(currentLoadoutsTab) == IDC_buttonSharedLoadouts}) then {

        private _dataToCheck = _playerName + _loadoutName;

        for '_i' from 0 to (((lnbsize _contentPanel) select 0) - 1) do {
            if ((_contentPanel lnbData [_i, 1]) == _dataToCheck) exitwith {_contentPanel lnbDeleteRow _i};
        };
    };
}] call CBA_fnc_addEventHandler;

[QGVAR(loadoutShared), {
    params ["_contentPanel" ,"_loadoutArgs"];
    _loadoutArgs params ["_playerName", "_loadoutName", "_loadoutData"];

    if (!(isNil QGVAR(currentLoadoutsTab)) && {GVAR(currentLoadoutsTab) == IDC_buttonSharedLoadouts}) then {

        private _curSelData =_contentPanel lnbData [(lnbCurSelRow _contentPanel), 1];
        ([_loadoutData] call FUNC(verifyLoadout)) params ["_loadout", "_nullItemsAmount", "_unavailableItemsAmount"];

        private _newRow = _contentPanel lnbAddRow [_playerName, _loadoutName];

        _contentPanel lnbSetPicture [[_newRow, 2], getText (configFile >> "cfgWeapons" >> ((_loadout select 0) select 0) >> "picture")];
        _contentPanel lnbSetPicture [[_newRow, 3], getText (configFile >> "cfgWeapons" >> ((_loadout select 1) select 0) >> "picture")];
        _contentPanel lnbSetPicture [[_newRow, 4], getText (configFile >> "cfgWeapons" >> ((_loadout select 2) select 0) >> "picture")];
        _contentPanel lnbSetPicture [[_newRow, 5], getText (configFile >> "cfgWeapons" >> ((_loadout select 3) select 0) >> "picture")];
        _contentPanel lnbSetPicture [[_newRow, 6], getText (configFile >> "cfgWeapons" >> ((_loadout select 4) select 0) >> "picture")];
        _contentPanel lnbSetPicture [[_newRow, 7], getText (configFile >> "cfgVehicles" >> ((_loadout select 5) select 0) >> "picture")];
        _contentPanel lnbSetPicture [[_newRow, 8], getText (configFile >> "cfgWeapons" >> (_loadout select 6) >> "picture")];
        _contentPanel lnbSetPicture [[_newRow, 9], getText (configFile >> "cfgGlasses" >> (_loadout select 7) >> "picture")];

        _contentPanel lnbSetData [[_newRow, 1], _playerName + _loadoutName];

        if (_nullItemsAmount > 0) then {

            _contentPanel lnbSetColor [[_newRow, 1], [1, 0, 0, 0.5]];
        } else {

            if (_unavailableItemsAmount > 0) then {
                _contentPanel lnbSetColor [[_newRow, 1], [1, 1, 1, 0.25]];
            };
        };

        _contentPanel lnbSort [1, false];

        // Select previously selected loadout
        for '_i' from 0 to (((lnbsize _contentPanel) select 0) - 1) do {
            if ((_contentPanel lnbText [_i, 1]) == _curSelData) exitwith {_contentPanel lnbSetCurSelRow _i};
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

        if (GVAR(currentLeftPanel) in [IDC_buttonUniform, IDC_buttonVest, IDC_buttonBackpack] && {GVAR(currentRightPanel) == IDC_buttonMisc}) then {

            private _rightPanel = (findDisplay IDD_ace_arsenal) displayCtrl IDC_rightTabContentListnBox;
            (lnbSize _rightPanel) params ["_rows", "_columns"];

            private _allDogtags = missionNameSpace getVariable [QEGVAR(dogtags,allDogtags), []];
            private _allDogtagDatas = missionNameSpace getVariable [QEGVAR(dogtags,allDogtagDatas), []];

            for "_r" from 0 to (_rows - 1) do {
                private _data = _rightPanel lnbData [_r, 0];

                if (_data isKindOf ["ACE_dogtag", (configFile >> "CfgWeapons")]) then {

                    private _dogtagData = [];
                    private _index = _allDogtags find _data;
                    _dogtagData = _allDogtagDatas select _index;

                    _rightPanel lnbSetText [[_r, 1], _dogtagData select 0];
                };
            };
        };
    }] call CBA_fnc_addEventHandler;
};
