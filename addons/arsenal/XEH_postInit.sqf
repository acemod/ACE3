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
