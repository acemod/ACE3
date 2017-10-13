#include "script_component.hpp"
#include "..\defines.hpp"

params ["", "_args"];
_args params ["_display"];

["ace_arsenal"] call bis_fnc_startloadingscreen;

//--------------- General vars
if (isNil QGVAR(center)) then {
    GVAR(center) = player;
};

GVAR(mouseButtonState) = [[],[]];
if (isNil QGVAR(mode)) then {
    GVAR(mode) = 1;
};

if (isNil QGVAR(virtualItems)) then {
    GVAR(virtualItems) = [[], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], []];
};
GVAR(currentItems) = ["", "", "", "", "", "", "", "", "", "", "", "", "", "", "", [], [], [], [], [], []];
GVAR(currentFace) = face GVAR(center);
GVAR(currentVoice) = speaker GVAR(center);
GVAR(currentInsignia) = GVAR(center) param [0, objNull, [objNull]] getVariable ["BIS_fnc_setUnitInsignia_class", ""];
GVAR(currentAction) = "Stand";
GVAR(shiftState) = false;

for "_index" from 0 to 10 do {
    private _array = (LIST_DEFAULTS select _index) select {!(_x isEqualTo "")};

    if !(_array isEqualTo []) then {
        {(GVAR(virtualItems) select _index) pushBackUnique _x} foreach _array;
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
            GVAR(currentItems) set [18, primaryWeaponItems GVAR(center)];
        };
        case 14: {
            GVAR(currentItems) set [19, secondaryWeaponItems GVAR(center)];
        };
        case 15: {
            GVAR(currentItems) set [20, handgunItems GVAR(center)];
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

TRACE_1("currentItems", GVAR(currentItems));

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
    RIGHT_PANEL_REMOVE_IDCS,
    IDC_rightSearchbar
];

//--------------- Prepare the left panel
GVAR(currentLeftPanel) = nil;
GVAR(currentRightPanel) = nil;
GVAR(searchbarFocus) = false;

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
    _panel ctrlsetfontheight (4.5 * GRID_H);
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

//--------------- End loading screen
["ace_arsenal"] call bis_fnc_endloadingscreen;
