#include "script_component.hpp"
#include "..\defines.hpp"

params ["", "_args"];
_args params ["_display"];

//--------------- General vars
if (isNil QGVAR(center)) then {
    GVAR(center) = player;
};

GVAR(mouseButtonState) = [[],[]];
if (isNil QGVAR(mode)) then {
    GVAR(mode) = 1;
};

if (isNil QGVAR(virtualItems)) then {
    GVAR(virtualItems) = [[[], [], []], [[], [], [], []], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], []];
};
GVAR(virtualItems) set [18, []];
GVAR(currentItems) = ["", "", "", "", "", "", "", "", "", "", "", "", "", "", "", [], [], [], [], [], []];

GVAR(currentFace) = face GVAR(center);
GVAR(currentVoice) = speaker GVAR(center);
GVAR(currentInsignia) = GVAR(center) param [0, objNull, [objNull]] getVariable ["BIS_fnc_setUnitInsignia_class", ""];

GVAR(currentAction) = "Stand";
GVAR(shiftState) = false;

for "_index" from 0 to 10 do {
    switch (_index) do {
        case 0: {
            private _array = LIST_DEFAULTS select _index;

            if !((_array select 0) isEqualTo "") then {
                ((GVAR(virtualItems) select _index) select 0) pushBackUnique (_array select 0);
            };

            if !((_array select 1) isEqualTo "") then {
                ((GVAR(virtualItems) select _index) select 1) pushBackUnique (_array select 1);
            };

            if !((_array select 2) isEqualTo "") then {
                 ((GVAR(virtualItems) select _index) select 2) pushBackUnique (_array select 2);
            };
        };
        case 1: {
            private _array = LIST_DEFAULTS select _index;

            if !((_array select 0) isEqualTo []) then {
                ((GVAR(virtualItems) select _index) select 0) append (_array select 0);
            };

            if !((_array select 1) isEqualTo []) then {
                ((GVAR(virtualItems) select _index) select 1) append (_array select 1);
            };

            if !((_array select 2) isEqualTo []) then {
                 ((GVAR(virtualItems) select _index) select 2) append (_array select 2);
            };

            if !((_array select 3) isEqualTo []) then {
                 ((GVAR(virtualItems) select _index) select 3) append (_array select 3);
            };
        };
        case 2: {
            private _array = LIST_DEFAULTS select _index;

            private _configCfgWeapons = configFile >> "CfgWeapons";
            private _grenadeList = [];
            {
                _grenadeList append getArray (_configCfgWeapons >> "Throw" >> _x >> "magazines");
                false
            } count getArray (_configCfgWeapons >> "Throw" >> "muzzles");

            private _putList = [];
            {
                _putList append getArray (_configCfgWeapons >> "Put" >> _x >> "magazines");
                false
            } count getArray (_configCfgWeapons >> "Put" >> "muzzles");

            {

                private _configCfgItemInfo = _configCfgWeapons >> _x >> "itemInfo";
                switch true do {
                    case (isClass (configFile >> "CfgMagazines" >> _x) && 
                        {(getNumber (configFile >> "CfgMagazines" >> _x >> "type") in [256,512,1536,16]) &&
                        {!(_x in _grenadeList)} &&
                        {!(_x in _putList)}}): {

                        (GVAR(virtualItems) select 2) pushBackUnique _x;
                    };
                    case (isClass (configFile >> "CfgMagazines" >> _x) && {_x in _grenadeList}): {
                        (GVAR(virtualItems) select 15) pushBackUnique _x;
                    };
                    case (isClass (configFile >> "CfgMagazines" >> _x) && {_x in _putList}): {
                        (GVAR(virtualItems) select 16) pushBackUnique _x;
                    };
                    case (
                            isClass (_configCfgWeapons >> _x) &&
                            {(getNumber (_configCfgWeapons >> _x >> "scope")) == 2} &&
                            {isClass (_configCfgItemInfo)} && {
                            ((getNumber (_configCfgItemInfo >> "type")) in [101, 201, 301, 302] &&
                            {(_x isKindOf ["CBA_MiscItem", (_configCfgWeapons)])}) ||
                            {(getNumber (_configCfgItemInfo >> "type")) in [401, 619, 620]}
                            }
                        ):{
                        (GVAR(virtualItems) select 17) pushBackUnique _x;
                    };
                    default {
                        if (isClass (configFile >> "CfgWeapons" >> _x)) then {
                            (GVAR(virtualItems) select 18) pushBackUnique _x;
                        };
                    };
                };
            } foreach _array;
        };
        default {
            private _array = (LIST_DEFAULTS select _index) select {!(_x isEqualTo "")};
            if !(_array isEqualTo []) then {
                {(GVAR(virtualItems) select _index) pushBackUnique _x} foreach _array;
            };
        };
    };
};

for "_index" from 0 to 15 do {
    switch (_index) do {
        case 0;
        case 1;
        case 2:{
            GVAR(currentItems) set [_index, ((LIST_DEFAULTS select 0) select _index)];
        };
        case 3;
        case 4;
        case 5;
        case 6;
        case 7;
        case 8;
        case 9: {
            GVAR(currentItems) set [_index, (LIST_DEFAULTS select _index) select 0];

        };
        case 10: {
            {(GVAR(currentItems) select 15) pushBack _x} forEach (uniformItems GVAR(center));
        };
        case 11: {
            {(GVAR(currentItems) select 16) pushBack _x} forEach (vestItems GVAR(center));
        };
        case 12: {
            {(GVAR(currentItems) select 17) pushBack _x} forEach (backpackItems GVAR(center));
        };
        case 13: {
            GVAR(currentItems) set [18, (primaryWeaponItems GVAR(center)) + (primaryWeaponMagazine GVAR(center))];
        };
        case 14: {
            GVAR(currentItems) set [19, (secondaryWeaponItems GVAR(center)) + (secondaryWeaponMagazine GVAR(center))];
        };
        case 15: {
            GVAR(currentItems) set [20, (handgunItems GVAR(center)) + (handgunMagazine GVAR(center))];
        };
    };
};

{
    if (getText (configFile >> "CfgWeapons" >> _x >> "simulation") == "ItemMap") then {
        (GVAR(virtualItems) select 10) pushBackUnique _x;
        GVAR(currentItems) set [10, _x];
    };
    if (getText (configFile >> "CfgWeapons" >> _x >> "simulation") == "ItemCompass") then {
        (GVAR(virtualItems) select 11) pushBackUnique _x;
        GVAR(currentItems) set [11, _x];
    };
    if (getText (configFile >> "CfgWeapons" >> _x >> "simulation") == "ItemRadio") then {
        (GVAR(virtualItems) select 12) pushBackUnique _x;
        GVAR(currentItems) set [12, _x];
    };
    if (getText (configFile >> "CfgWeapons" >> _x >> "simulation") == "ItemWatch") then {
        (GVAR(virtualItems) select 13) pushBackUnique _x;
        GVAR(currentItems) set [13, _x];
    };
    if (getText (configFile >> "CfgWeapons" >> _x >> "simulation") == "ItemGPS") then {
        (GVAR(virtualItems) select 14) pushBackUnique _x;
        GVAR(currentItems) set [14, _x];
    };
} foreach (assignedItems GVAR(center));

GVAR(currentWeaponType) = switch true do {
    case (currentWeapon GVAR(center) == GVAR(currentItems) select 0): {0};
    case (currentWeapon GVAR(center) == GVAR(currentItems) select 1): {1};
    case (currentWeapon GVAR(center) == GVAR(currentItems) select 2): {2};
    default {-1};
};

[QGVAR(displayOpened), []] call CBA_fnc_localEvent;

//--------------- Fade out unused elements
private _mouseBlockCtrl = _display displayCtrl IDC_mouseBlock;
_mouseBlockCtrl ctrlEnable false;

{
    _x = _display displayCtrl _x;

    _x ctrlSetFade 1;
    _x ctrlShow false;
    _x ctrlCommit 0;
} foreach [
    IDC_blockRightFrame,
    IDC_blockRighttBackground,
    IDC_loadIndicator,
    IDC_rightTabContent,
    IDC_rightTabContentListnBox,
    IDC_sortRightTab,
    RIGHT_PANEL_ACC_BACKGROUND_IDCS,
    RIGHT_PANEL_ACC_IDCS,
    RIGHT_PANEL_ITEMS_BACKGROUND_IDCS,
    RIGHT_PANEL_ITEMS_IDCS,
    IDC_buttonRemoveAll,
    IDC_rightSearchbar
];

//--------------- Prepare the left panel
GVAR(currentLeftPanel) = nil;
GVAR(currentRightPanel) = nil;
GVAR(leftSearchbarFocus) = false;
GVAR(rightSearchbarFocus) = false;
GVAR(leftTabFocus) = false;
GVAR(rightTabFocus) = false;
GVAR(rightTabLnBFocus) = false;

if (GVAR(mode) != 0) then {
    {
        _x = _display displayCtrl _x;

        _x ctrlSetFade 1;
        _x ctrlShow false;
        _x ctrlCommit 0;
    } foreach [
        IDC_buttonFace,
        IDC_buttonVoice,
        IDC_buttonInsigna
    ];
};

{
    private _panel = _display displayCtrl _x;
    _panel ctrlSetFontHeight (GVAR(fontHeight) * GRID_H);
    _panel ctrlCommit 0;
} foreach [IDC_leftTabContent, IDC_rightTabContent, IDC_rightTabContentListnBox];

[_display, _display displayCtrl IDC_buttonPrimaryWeapon] call FUNC(fillLeftPanel);

//--------------- Camera prep
cutText ["","plain"];
showCommandingMenu "";

GVAR(cameraView) = cameraView;
GVAR(center) switchCamera "internal";
showHUD false;

private _mouseAreaCtrl = _display displayCtrl IDC_mouseArea;
ctrlSetFocus _mouseAreaCtrl;

//--------------- Init camera
GVAR(cameraPosition) = [5,0,0,[0,0,0.85]];

GVAR(cameraHelper) = createAgent ["Logic", position GVAR(center) ,[] ,0 ,"none"];
GVAR(cameraHelper) attachTo [GVAR(center), GVAR(cameraPosition) select 3, ""];

GVAR(camera) = "camera" camCreate position GVAR(center);
GVAR(camera) cameraEffect ["internal","back"];
GVAR(camera) camPrepareFocus [-1,-1];
GVAR(camera) camPrepareFov 0.35;
GVAR(camera) camCommitPrepared 0;

showCinemaBorder false;
["#(argb,8,8,3)color(0,0,0,1)",false,nil,0,[0,0.5]] call bis_fnc_textTiles;

//--------------- Reset camera pos
[nil, [controlNull,0,0]] call FUNC(handleMouse);
GVAR(camPosUpdateHandle) = addMissionEventHandler ["draw3D",{ [] call FUNC(updateCamPos) }];
