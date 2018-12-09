#include "script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: Alganthe
 * onLoad EH for arsenal.
 *
 * Arguments:
 * 0: Ignored
 * 1: Arguments <ARRAY>
  * 1.1: Arsenal display <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Public: No
*/

params ["", "_args"];
_args params ["_display"];

//--------------- General vars
if (isNil QGVAR(center)) then {
    GVAR(center) = player;
};

GVAR(mouseButtonState) = [[],[]];

if (isNil QGVAR(sharedLoadoutsNamespace)) then {
    GVAR(sharedLoadoutsNamespace) = true call CBA_fnc_createNamespace;
    publicVariable QGVAR(sharedLoadoutsNamespace);
};

if (isNil {GVAR(sharedLoadoutsNamespace) getVariable QGVAR(sharedLoadoutsVars)}) then {
    GVAR(sharedLoadoutsNamespace) setVariable [QGVAR(sharedLoadoutsVars), [], true];
};

if (isNil QGVAR(defaultLoadoutsList)) then {
    if (is3DEN) then {
        GVAR(defaultLoadoutsList) = (QGVAR(DummyCategory) get3DENMissionAttribute QGVAR(DefaultLoadoutsListAttribute));
    } else {
        GVAR(defaultLoadoutsList) = [];
    };
};

if (isNil QGVAR(virtualItems)) then {
    GVAR(virtualItems) = [[[], [], []], [[], [], [], []], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], []];
};

GVAR(currentItems) = ["", "", "", "", "", "", "", "", "", "", "", "", "", "", "", [], [], [], [], [], []];

GVAR(currentFace) = face GVAR(center);
GVAR(currentVoice) = speaker GVAR(center);
GVAR(currentInsignia) = GVAR(center) param [0, objNull, [objNull]] getVariable ["BIS_fnc_setUnitInsignia_class", ""];

GVAR(currentAction) = "Stand";
GVAR(shiftState) = false;

GVAR(showStats) = true;
GVAR(statsPagesLeft) =  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
GVAR(statsPagesRight) =  [0, 0, 0, 0, 0, 0, 0, 0];
GVAR(statsInfo) = [true, 0, controlNull, nil, nil];

// Add the items the player has to virtualItems
for "_index" from 0 to 10 do {
    switch (_index) do {
        // primary, secondary, handgun weapons
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

        // Accs for the weapons above
        case 1: {
            private _array = LIST_DEFAULTS select _index;
            _array params ["_accsArray", "_magsArray"];

            {
                private _subIndex = _forEachIndex;

                {
                    if (_x != "") then {
                        (GVAR(virtualItems) select _index) select ([2, 1, 0, 3] select _forEachIndex) pushBackUnique _x;
                    };
                } forEach _x;
            } forEach _accsArray;

            {
                if !(_x isEqualTo []) then {

                    if (_x select 0 != "") then {
                        (GVAR(virtualItems) select 2) pushBackUnique (_x select 0);
                    };

                    if (count _x > 1 && {_x select 1 != ""}) then {
                        (GVAR(virtualItems) select 2) pushBackUnique (_x select 1);
                    };
                };
            } forEach _magsArray;
        };

        // Inventory items
        case 2: {
                call FUNC(updateUniqueItemsList);
            };

        // The rest
        default {
            private _array = (LIST_DEFAULTS select _index) select {!(_x isEqualTo "")};
            if !(_array isEqualTo []) then {
                {(GVAR(virtualItems) select _index) pushBackUnique _x} forEach _array;
            };
        };
    };
};

// Fill current items
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
    private _simulationType = getText (configFile >> "CfgWeapons" >> _x >> "simulation");

    if (_simulationType != "NVGoggles") then {
        if (_simulationType == "ItemGps" || _simulationType == "Weapon") then {
            GVAR(currentItems) set [14, _x];
        } else {

            private _index = 10 + (["itemmap", "itemcompass", "itemradio", "itemwatch"] find (tolower _simulationType));
            GVAR(currentItems) set [_index, _x];
        };
    };
} forEach (assignedItems GVAR(center));

GVAR(currentWeaponType) = switch true do {
    case (currentWeapon GVAR(center) == GVAR(currentItems) select 0): {0};
    case (currentWeapon GVAR(center) == GVAR(currentItems) select 1): {1};
    case (currentWeapon GVAR(center) == GVAR(currentItems) select 2): {2};
    default {-1};
};

[QGVAR(displayOpened), [_display]] call CBA_fnc_localEvent;

//--------------- Fade out unused elements
private _mouseBlockCtrl = _display displayCtrl IDC_mouseBlock;
_mouseBlockCtrl ctrlEnable false;

{
    _x = _display displayCtrl _x;

    _x ctrlSetFade 1;
    _x ctrlShow false;
    _x ctrlCommit 0;
} forEach [
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

// Handle stats
private _statsBoxCtrl = _display displayCtrl IDC_statsBox;
_statsBoxCtrl ctrlSetPosition [
    (0.5 - WIDTH_TOTAL / 2) + WIDTH_GAP,
    safezoneY + 1.8 * GRID_H,
    47 * GRID_W,
    11 * GRID_H
];
_statsBoxCtrl ctrlEnable false;
_statsBoxCtrl ctrlCommit 0;

(_display displayCtrl IDC_statsButton) ctrlShow false;

// Disable import in MP
if (isMultiplayer) then {
    private _importButtonCtrl = _display displayCtrl IDC_buttonImport;
    _importButtonCtrl ctrlEnable false;
    _importButtonCtrl ctrlSetFade 0.6;
    _importButtonCtrl ctrlCommit 0;
};

//--------------- Camera prep
cutText ["","plain"];
showCommandingMenu "";

GVAR(cameraView) = cameraView;
GVAR(center) switchCamera "internal";
[QUOTE(ADDON), [false, true, true, true, true, true, true, false, true, true]] call EFUNC(common,showHud);

private _mouseAreaCtrl = _display displayCtrl IDC_mouseArea;
ctrlSetFocus _mouseAreaCtrl;

// 3DEN support, lifted from BIS_fnc_arsenal
if (is3DEN) then {

    GVAR(centerOrigin) = GVAR(center);
    GVAR(centerOrigin) hideObject true;

    private _centerOriginParent = objectParent GVAR(centerOrigin);
    if !(isNull _centerOriginParent) then {
        _centerOriginParent hideObject true;
    };

    private _centerPos = position GVAR(centerOrigin);

    GVAR(center) = createAgent [typeOf GVAR(centerOrigin), position GVAR(centerOrigin), [], 0, "none"];
    GVAR(center) setPosAtl getPosAtl GVAR(centerOrigin);
    GVAR(center) setDir (getDir GVAR(centerOrigin));
    GVAR(center) switchMove animationState GVAR(centerOrigin);
    GVAR(center) switchAction "playerstand";
    GVAR(center) enableSimulation false;

    GVAR(center) setUnitLoadout (getUnitLoadout GVAR(centerOrigin));
    GVAR(center) setFace GVAR(currentFace);
    GVAR(center) setSpeaker GVAR(currentVoice);

    //--- Create light for night editing (code based on BIS_fnc_3DENFlashlight)
    private _intensity = 1;
    GVAR(light) = "#lightpoint" createVehicle _centerPos;
    GVAR(light) setLightBrightness _intensity;
    GVAR(light) setLightAmbient [1,1,1];
    GVAR(light) setLightColor [0,0,0];
    GVAR(light) lightAttachObject [GVAR(centerOrigin), [0, 0, -_intensity * 7]];

    //--- Use the same vision mode as in Eden
    GVAR(visionMode)= -2 call bis_fnc_3DENVisionMode;
    ["ShowInterface",false] spawn bis_fnc_3DENInterface;
    if (get3denactionstate "togglemap" > 0) then {do3DENAction "togglemap";};

    {
        private _ctrl = _display displayctrl _x;
        _ctrl ctrlEnable false;
        _ctrl ctrlSetFade 0.6;
        _ctrl ctrlCommit 0;
    } forEach [
        IDC_buttonFace,
        IDC_buttonVoice,
        IDC_buttonInsigna
    ];

    _buttonCloseCtrl = _display displayCtrl IDC_menuBarClose;
    _buttonCloseCtrl ctrlSetText (localize "str_ui_debug_but_apply");
} else {
    GVAR(centerNotPlayer) = (GVAR(center) != player);

    if (currentVisionMode ACE_Player == 1) then {
        GVAR(center) action ["NVGogglesOff", GVAR(center)];
    };

    {
        private _ctrl = _display displayCtrl _x;
        _ctrl ctrlEnable GVAR(enableIdentityTabs);
        _ctrl ctrlSetFade ([0.6, 0] select GVAR(enableIdentityTabs));
        _ctrl ctrlCommit 0;
    } forEach [
        IDC_buttonFace,
        IDC_buttonVoice,
        IDC_buttonInsigna
    ];
};

//--------------- Prepare the left panel
GVAR(currentLeftPanel) = nil;
GVAR(currentRightPanel) = nil;
GVAR(leftSearchbarFocus) = false;
GVAR(rightSearchbarFocus) = false;
GVAR(leftTabFocus) = false;
GVAR(rightTabFocus) = false;
GVAR(rightTabLnBFocus) = false;

{
    private _panel = _display displayCtrl _x;
    _panel ctrlSetFontHeight (GVAR(fontHeight) * GRID_H);
    _panel ctrlCommit 0;
} forEach [IDC_leftTabContent, IDC_rightTabContent, IDC_rightTabContentListnBox];

[_display, _display displayCtrl IDC_buttonPrimaryWeapon] call FUNC(fillLeftPanel);

//--------------- Init camera
if (isNil QGVAR(cameraPosition)) then {
    GVAR(cameraPosition) = [5,0,0,[0,0,0.85]];
};

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
