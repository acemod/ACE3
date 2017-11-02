#include "script_component.hpp"
#include "defines.hpp"

GVAR(EH_ID) = 0;
GVAR(modList) = ["","curator","kart","heli","mark","expansion","expansionpremium"];
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

if (["ACE_dogtags"] call EFUNC(common,isModLoaded)) then {
    [QGVAR(onLoadoutSave), {

        params ["_index", "_loadout"];
        _loadout params ["_loadoutName", "_loadoutData"];

        for "_dataIndex" from 0 to 10 do {
            switch (_dataIndex) do {

                case 3;
                case 4;
                case 5: {
                    if (count (_loadoutData select _dataIndex) > 0) then {
                        private _containerContents = (_loadoutData select _dataIndex) select 1;

                        if (count _containerContents > 0) then {

                            {
                                if (count _x == 2 && {(_x select 0) isEqualType ""}) then {

                                    private _item = _x select 0;
                                    if (_item isKindOf ["ACE_dogtag", (configFile >> "CfgWeapons")]) then {

                                        _containerContents set [_foreachIndex, []];
                                    };
                                };
                            } foreach _containerContents;
                        };
                    };
                };
            };

            _loadoutsData = profileNamespace getVariable [QGVAR(saved_loadouts), []];
            _loadoutsData set [_index, [_loadoutName, _loadoutData]];
        };
    }] call CBA_fnc_addEventHandler;
};