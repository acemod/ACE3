/*
 * Author: Alganthe
 * onLoad EH for ACE3's arsenal
 *
 * Arguments:
 * 0: Ignored
 * 1: Arguments <ARRAY>
  * 1.1: Display <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Public: No
*/
#include "script_component.hpp"
#include "..\defines.hpp"

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

if (isNil QGVAR(sharedLoadoutsVars)) then {
    GVAR(sharedLoadoutsVars) = [];
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
GVAR(virtualItems) set [18, []];
GVAR(currentItems) = ["", "", "", "", "", "", "", "", "", "", "", "", "", "", "", [], [], [], [], [], []];

GVAR(currentFace) = face GVAR(center);
GVAR(currentVoice) = speaker GVAR(center);
GVAR(currentInsignia) = GVAR(center) param [0, objNull, [objNull]] getVariable ["BIS_fnc_setUnitInsignia_class", ""];

GVAR(currentAction) = "Stand";
GVAR(shiftState) = false;

// Add the items the player has to virtualItems
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
                 {((GVAR(virtualItems) select _index) select 0) pushBackUnique _x} foreach (_array select 0);
            };

            if !((_array select 1) isEqualTo []) then {
                {((GVAR(virtualItems) select _index) select 1) pushBackUnique _x} foreach (_array select 1);
            };

            if !((_array select 2) isEqualTo []) then {
                 {((GVAR(virtualItems) select _index) select 2) pushBackUnique _x} foreach (_array select 2);
            };

            if !((_array select 3) isEqualTo []) then {
                 {((GVAR(virtualItems) select _index) select 3) pushBackUnique _x} foreach (_array select 3);
            };
        };

        case 2: {
            private _array = LIST_DEFAULTS select _index;
            private _itemsCache = uiNamespace getVariable QGVAR(configItems);

            private _configCfgWeapons = configFile >> "CfgWeapons";
            private _configMagazines = configFile >> "CfgMagazines";

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
                switch true do {
                    case (isClass (_configMagazines >> _x) && {_x in _grenadeList}): {
                        (GVAR(virtualItems) select 15) pushBackUnique _x;
                    };

                    case (isClass (_configMagazines >> _x) && {_x in _putList}): {
                        (GVAR(virtualItems) select 16) pushBackUnique _x;
                    };

                    case (
                            isClass (_configMagazines >> _x) && 
                            {_x in (_itemsCache select 2)} && 
                            {!(_x in (GVAR(virtualItems) select 2))}
                        ): {

                        (GVAR(virtualItems) select 2) pushBackUnique _x;
                    };

                    case (
                            isClass (_configCfgWeapons >> _x) &&
                            {!(_x in (GVAR(virtualItems) select 17))}
                        ): {

                        (GVAR(virtualItems) select 18) pushBackUnique _x;
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

// 3DEN support, lifted from BIS_fnc_arsenal
if (is3DEN) then {

    GVAR(centerOrigin) = GVAR(center);
    GVAR(centerOrigin) hideObject true;
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
};

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
