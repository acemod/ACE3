// Pixel grid
#define pixelScale  0.25
#define GRID_W (pixelW * pixelGridNoUIScale * pixelScale)
#define GRID_H (pixelH * pixelGridNoUIScale * pixelScale)

#define WIDTH_TOTAL (safezoneW - 2 * (93 * GRID_W))
#define WIDTH_GAP (WIDTH_TOTAL / 100)
#define WIDTH_SINGLE ((WIDTH_TOTAL - 6 * WIDTH_GAP) / 5)

// IDCs
#define IDD_ace_arsenal 1127001
#define IDC_mouseArea 0
#define IDC_arrowMinus 101
#define IDC_arrowPlus 102
#define IDC_blockLeftFrame 3
#define IDC_blockLeftBackground 4
#define IDC_blockRightFrame 5
#define IDC_blockRighttBackground 6
#define IDC_loadIndicator 7
#define IDC_loadIndicatorBar 701
#define IDC_totalWeight 8
#define IDC_totalWeightText 801
#define IDC_message 9
#define IDC_menuBar 10
#define IDC_menuBarClose 1001
#define IDC_buttonHide 1002
#define IDC_buttonLoadouts 1003
#define IDC_buttonExport 1004
#define IDC_buttonImport 1005
#define IDC_infoBox 11
#define IDC_infoBackground 1101
#define IDC_infoName 1102
#define IDC_infoAuthor 1103
#define IDC_DLCBackground 1104
#define IDC_DLCIcon 1105
#define IDC_mouseBlock 12
#define IDC_leftTabContent 13
#define IDC_rightTabContent 14
#define IDC_rightTabContentListnBox 15
#define IDC_sortLeftTab 16
#define IDC_sortRightTab 17
#define IDC_leftSearchbar 18
#define IDC_leftSearchbarButton 41
#define IDC_rightSearchbar 19
#define IDC_rightSearchbarButton 42
#define IDC_tabLeft 20
#define IDC_iconBackgroundPrimaryWeapon 2001
#define IDC_buttonPrimaryWeapon 2002
#define IDC_iconBackgroundHandgun 2003
#define IDC_buttonHandgun 2004
#define IDC_iconBackgroundSecondaryWeapon 2005
#define IDC_buttonSecondaryWeapon 2006
#define IDC_iconBackgroundHeadgear 2007
#define IDC_buttonHeadgear 2008
#define IDC_iconBackgroundUniform 2009
#define IDC_buttonUniform 2010
#define IDC_iconBackgroundVest 2011
#define IDC_buttonVest 2012
#define IDC_iconBackgroundBackpack 2013
#define IDC_buttonBackpack 2014
#define IDC_iconBackgroundGoggles 2015
#define IDC_buttonGoggles 2016
#define IDC_iconBackgroundNVG 2017
#define IDC_buttonNVG 2018
#define IDC_iconBackgroundBinoculars 2019
#define IDC_buttonBinoculars 2020
#define IDC_iconBackgroundMap 2021
#define IDC_buttonMap 2022
#define IDC_iconBackgroundGPS 2023
#define IDC_buttonGPS 2024
#define IDC_iconBackgroundRadio 2025
#define IDC_buttonRadio 2026
#define IDC_iconBackgroundCompass 2028
#define IDC_buttonCompass 2029
#define IDC_iconBackgroundWatch 2030
#define IDC_buttonWatch 2031
#define IDC_iconBackgroundFace 2032
#define IDC_buttonFace 2033
#define IDC_iconBackgroundVoice 2034
#define IDC_buttonVoice 2035
#define IDC_iconBackgroundInsigna 2036
#define IDC_buttonInsigna 2037
#define IDC_iconBackgroundOptic 21
#define IDC_buttonOptic 22
#define IDC_iconBackgroundItemAcc 23
#define IDC_buttonItemAcc 24
#define IDC_iconBackgroundMuzzle 25
#define IDC_buttonMuzzle 26
#define IDC_iconBackgroundBipod 27
#define IDC_buttonBipod 28
#define IDC_iconBackgroundCurrentMag 3001
#define IDC_buttonCurrentMag 3002
#define IDC_iconBackgroundCurrentMag2 3003
#define IDC_buttonCurrentMag2 3004
#define IDC_iconBackgroundMag 29
#define IDC_buttonMag 30
#define IDC_iconBackgroundMagALL 31
#define IDC_buttonMagALL 32
#define IDC_iconBackgroundThrow 33
#define IDC_buttonThrow 34
#define IDC_iconBackgroundPut 35
#define IDC_buttonPut 36
#define IDC_iconBackgroundMisc 37
#define IDC_buttonMisc 38
#define IDC_buttonRemoveAllSelected 39
#define IDC_buttonRemoveAll 40
#define IDC_statsBox 51
#define IDC_statsTitle1 5101
#define IDC_statsBackground1 5102
#define IDC_statsBar1 5103
#define IDC_statsText1 5104
#define IDC_statsTitle2 5105
#define IDC_statsBackground2 5106
#define IDC_statsBar2 5107
#define IDC_statsText2 5108
#define IDC_statsTitle3 5109
#define IDC_statsBackground3 5110
#define IDC_statsBar3 5111
#define IDC_statsText3 5112
#define IDC_statsTitle4 5113
#define IDC_statsBackground4 5114
#define IDC_statsBar4 5115
#define IDC_statsText4 5116
#define IDC_statsTitle5 5117
#define IDC_statsBackground5 5118
#define IDC_statsBar5 5119
#define IDC_statsText5 5120
#define IDC_statsPreviousPage 52
#define IDC_statsNextPage 53
#define IDC_statsCurrentPage 54
#define IDC_statsButton 55
#define IDC_statsButtonClose 56

#define IDD_loadouts_display 1127002
#define IDC_centerBox 3
#define IDC_centerTitle 301
#define IDC_contentPanel 302
#define IDC_textEditBox 303
#define IDC_buttonSave 304
#define IDC_buttonLoad 305
#define IDC_buttonShare 306
#define IDC_buttonDelete 307
#define IDC_buttonRename 308
#define IDC_loadoutsSearchbar 309
#define IDC_buttonMyLoadoutsBackground 401
#define IDC_buttonMyLoadouts 402
#define IDC_buttonDefaultLoadoutsBackground 403
#define IDC_buttonDefaultLoadouts 404
#define IDC_buttonSharedLoadoutsBackground 405
#define IDC_buttonSharedLoadouts 406

// 3DEN Attribute
#define ATTRIBUTE_W (pixelW * pixelGrid * 0.5)
#define ATTRIBUTE_H (pixelH * pixelGrid * 0.5)

#define IDC_ATTRIBUTE_MODE 8100
#define IDC_ATTRIBUTE_CATEGORY 8101
#define IDC_ATTRIBUTE_LIST 8102
#define IDC_ATTRIBUTE_LIST_LEFT 8103
#define IDC_ATTRIBUTE_LIST_RIGHT 8104
#define IDC_ATTRIBUTE_SEARCH_BUTTON 8105
#define IDC_ATTRIBUTE_SEARCHBAR 8106
#define IDC_ATTRIBUTE_CLEAR_BUTTON 8107
#define IDC_ATTRIBUTE_EXPORT_BUTTON 8108
#define IDC_ATTRIBUTE_IMPORT_BUTTON 8109
#define IDC_ATTRIBUTE_ADD_COMPATIBLE 8110

#define SYMBOL_ITEM_NONE "−"
#define SYMBOL_ITEM_REMOVE "×"
#define SYMBOL_ITEM_VIRTUAL "∞"

#define FADE_DELAY 0.15
#define CAM_DIS_MAX 5

#define RIGHT_PANEL_ACC_IDCS IDC_buttonOptic, IDC_buttonItemAcc, IDC_buttonMuzzle, IDC_buttonBipod
#define RIGHT_PANEL_ACC_BACKGROUND_IDCS IDC_iconBackgroundOptic, IDC_iconBackgroundItemAcc, IDC_iconBackgroundMuzzle, IDC_iconBackgroundBipod
#define RIGHT_PANEL_ITEMS_IDCS IDC_buttonMag, IDC_buttonMagALL, IDC_buttonThrow, IDC_buttonPut, IDC_buttonMisc
#define RIGHT_PANEL_ITEMS_BACKGROUND_IDCS IDC_iconBackgroundMag, IDC_iconBackgroundMagALL, IDC_iconBackgroundThrow, IDC_iconBackgroundPut, IDC_iconBackgroundMisc
#define ARROWS_IDCS IDC_arrowMinus, IDC_arrowPlus

#define GETDLC\
    {\
        private _dlc = "";\
        private _addons = configsourceaddonlist _this;\
        if (count _addons > 0) then {\
            private _mods = configsourcemodlist (configfile >> "CfgPatches" >> _addons select 0);\
            if (count _mods > 0) then {\
                _dlc = _mods select 0;\
            };\
        };\
        _dlc\
    }

#define ADDMODICON\
    {\
        private _dlcName = _this call GETDLC;\
        if (_dlcName != "") then {\
            _ctrlPanel lbsetpictureright [_lbAdd,(modParams [_dlcName,["logo"]]) param [0,""]];\
            _modID = GVAR(modList) find _dlcName;\
            if (_modID < 0) then {_modID = GVAR(modList) pushback _dlcName;};\
            _ctrlPanel lbsetvalue [_lbAdd,_modID];\
        };\
    };

#define ADDBINOCULARSMAG\
    private _magazines = getarray (configfile >> "cfgweapons" >> _item >> "magazines");\
    if (count _magazines > 0) then {GVAR(center) addmagazine (_magazines select 0)};

#define TOGGLE_RIGHT_PANEL_WEAPON\
{\
    _x = _display displayCtrl _x;\
    _x ctrlSetFade 0;\
    _x ctrlShow true;\
    _x ctrlEnable true;\
    _x ctrlCommit FADE_DELAY;\
} foreach [\
    IDC_blockRightFrame,\
    IDC_blockRighttBackground,\
    IDC_rightTabContent,\
    IDC_sortRightTab,\
    RIGHT_PANEL_ACC_IDCS,\
    IDC_rightSearchbar,\
    IDC_rightSearchbarButton,\
    IDC_buttonCurrentMag\
];\
private _buttonCurrentMag2Ctrl = _display displayCtrl IDC_buttonCurrentMag2;\
if (GVAR(currentLeftPanel) == IDC_buttonPrimaryWeapon) then {\
    _buttonCurrentMag2Ctrl ctrlSetFade 0;\
    _buttonCurrentMag2Ctrl ctrlShow true;\
    _buttonCurrentMag2Ctrl ctrlEnable true;\
} else {\
    _buttonCurrentMag2Ctrl ctrlSetFade 1;\
    _buttonCurrentMag2Ctrl ctrlShow false;\
    _buttonCurrentMag2Ctrl ctrlEnable false;\
};\
_buttonCurrentMag2Ctrl ctrlCommit FADE_DELAY;\
{\
    _x = _display displayCtrl _x;\
    _x ctrlSetFade 1;\
    _x ctrlShow false;\
    _x ctrlEnable false;\
    _x ctrlCommit FADE_DELAY;\
} foreach [\
    IDC_loadIndicator,\
    RIGHT_PANEL_ITEMS_IDCS,\
    IDC_rightTabContentListnBox,\
    RIGHT_PANEL_ITEMS_BACKGROUND_IDCS,\
    IDC_buttonRemoveAll\
];\
{\
    _x = _display displayCtrl _x;\
    _x ctrlSetPosition [\
        safezoneX + safezoneW - 93 * GRID_W,\
        safezoneY + 14 * GRID_H,\
        80 * GRID_W,\
        safezoneH - 28 * GRID_H\
    ];\
    _x ctrlCommit 0;\
} foreach [\
    IDC_blockRightFrame,\
    IDC_blockRighttBackground\
];

#define TOGGLE_RIGHT_PANEL_CONTAINER\
{\
    _x = _display displayCtrl _x;\
    _x ctrlSetFade 0;\
    _x ctrlShow true;\
    _x ctrlEnable true;\
    _x ctrlCommit FADE_DELAY;\
} foreach [\
    IDC_blockRightFrame, \
    IDC_blockRighttBackground,\
    IDC_loadIndicator,\
    IDC_rightTabContentListnBox,\
    IDC_sortRightTab,\
    IDC_tabRight,\
    RIGHT_PANEL_ACC_IDCS,\
    RIGHT_PANEL_ITEMS_IDCS,\
    IDC_rightSearchbar,\
    IDC_rightSearchbarButton\
];\
{\
    _x = _display displayCtrl _x;\
    _x ctrlSetFade 1;\
    _x ctrlShow false;\
    _x ctrlEnable false;\
    _x ctrlCommit FADE_DELAY;\
} foreach [\
    IDC_buttonCurrentMag,\
    IDC_buttonCurrentMag2,\
    IDC_iconBackgroundCurrentMag,\
    IDC_iconBackgroundCurrentMag2\
];\
{\
    _x = _display displayCtrl _x;\
    _x ctrlSetPosition [\
        safezoneX + safezoneW - 93 * GRID_W,\
        safezoneY + 14 * GRID_H,\
        80 * GRID_W,\
        safezoneH - 34 * GRID_H\
    ];\
    _x ctrlCommit 0;\
} foreach [\
    IDC_blockRightFrame,\
    IDC_blockRighttBackground\
];

#define TOGGLE_RIGHT_PANEL_HIDE\
{\
    _x = _display displayCtrl _x;\
    _x ctrlSetFade 1;\
    _x ctrlShow false;\
    _x ctrlEnable false;\
    _x ctrlCommit FADE_DELAY;\
} foreach [\
    IDC_blockRightFrame,\
    IDC_blockRighttBackground,\
    IDC_loadIndicator,\
    IDC_rightTabContent,\
    IDC_rightTabContentListnBox,\
    IDC_sortRightTab,\
    RIGHT_PANEL_ACC_BACKGROUND_IDCS,\
    RIGHT_PANEL_ACC_IDCS,\
    RIGHT_PANEL_ITEMS_BACKGROUND_IDCS,\
    RIGHT_PANEL_ITEMS_IDCS,\
    IDC_buttonRemoveAll,\
    IDC_rightSearchbar,\
    IDC_rightSearchbarButton,\
    IDC_buttonCurrentMag,\
    IDC_buttonCurrentMag2,\
    IDC_iconBackgroundCurrentMag,\
    IDC_iconBackgroundCurrentMag2\
];

#define LIST_DEFAULTS\
    [\
    [\
        (primaryweapon GVAR(center) call bis_fnc_baseWeapon),\
        (secondaryweapon GVAR(center) call bis_fnc_baseWeapon),\
        (handgunweapon GVAR(center) call bis_fnc_baseWeapon)\
    ],\
    [\
        [primaryWeaponItems GVAR(center), secondaryWeaponItems GVAR(center), handgunItems GVAR(center)],\
        [primaryWeaponMagazine GVAR(center), secondaryWeaponMagazine GVAR(center), handgunMagazine GVAR(center)]\
    ],\
    uniformItems GVAR(center) + vestItems GVAR(center) + backpackItems GVAR(center),\
    [headgear GVAR(center)],\
    [uniform GVAR(center)],\
    [vest GVAR(center)],\
    [backpack GVAR(center)],\
    [goggles GVAR(center)],\
    [hmd GVAR(center)],\
    [binocular GVAR(center)]\
]

#define CHECK_WEAPON_OR_ACC\
    (_weaponsArray select 0) findIf {_x == _item} > -1 ||\
    {(_weaponsArray select 1) findIf {_x == _item} > -1} ||\
    {(_weaponsArray select 2)  findIf {_x == _item} > -1} ||\
    {(GVAR(virtualItems) select 9) findIf {_x == _item} > -1} ||\
    {(_accsArray select 0) findIf {_x == _item} > -1} ||\
    {(_accsArray select 1 findIf {_x == _item} > -1)} ||\
    {(_accsArray select 2) findIf {_x == _item} > -1} ||\
    {(_accsArray select 3) findIf {_x == _item} > -1}

// PboProject 2.45 has problems with these macros for some reason, adding a single space before the \ fixes
#define CHECK_ASSIGNED_ITEMS \
    (GVAR(virtualItems) select 10) findIf {_x == _item} > -1 ||\
    {(GVAR(virtualItems) select 11) findIf {_x == _item} > -1} ||\
    {(GVAR(virtualItems) select 12) findIf {_x == _item} > -1} ||\
    {(GVAR(virtualItems) select 13) findIf {_x == _item} > -1} ||\
    {(GVAR(virtualItems) select 14) findIf {_x == _item} > -1} ||\
    {(GVAR(virtualItems) select 8) findIf {_x == _item} > -1}

#define CHECK_CONTAINER \
    (GVAR(virtualItems) select 4) findIf {_x == _item} > -1 ||\
    {(GVAR(virtualItems) select 5) findIf {_x == _item} > -1} ||\
    {(GVAR(virtualItems) select 6) findIf {_x == _item} > -1}

#define CLASS_CHECK_ITEM\
    isClass (_weaponCfg >> _item) ||\
    {isClass (_vehcCfg >> _item)} ||\
    {isClass (_glassesCfg >> _item)} ||\
    {isClass (_magCfg >> _item)}

#define CHECK_CONTAINER_ITEMS \
    (GVAR(virtualItems) select 3) findIf {_x == _item} > -1 ||\
    {(_accsArray select 0) findIf {_x == _item} > -1} ||\
    {(_accsArray select 1) findIf {_x == _item} > -1} ||\
    {(_accsArray select 2) findIf {_x == _item} > -1} ||\
    {(_accsArray select 3) findIf {_x == _item} > -1} ||\
    {(GVAR(virtualItems) select 4) findIf {_x == _item} > -1} ||\
    {(GVAR(virtualItems) select 5) findIf {_x == _item} > -1} ||\
    {(GVAR(virtualItems) select 6) findIf {_x == _item} > -1} ||\
    {(GVAR(virtualItems) select 7) findIf {_x == _item} > -1} ||\
    {(GVAR(virtualItems) select 8) findIf {_x == _item} > -1} ||\
    {(GVAR(virtualItems) select 10) findIf {_x == _item} > -1} ||\
    {(GVAR(virtualItems) select 11) findIf {_x == _item} > -1} ||\
    {(GVAR(virtualItems) select 12) findIf {_x == _item} > -1} ||\
    {(GVAR(virtualItems) select 13) findIf {_x == _item} > -1} ||\
    {(GVAR(virtualItems) select 14) findIf {_x == _item} > -1} ||\
    {(GVAR(virtualItems) select 15) findIf {_x == _item} > -1} ||\
    {(GVAR(virtualItems) select 16) findIf {_x == _item} > -1} ||\
    {(GVAR(virtualItems) select 17) findIf {_x == _item} > -1}

#define ADD_LOADOUTS_LIST_PICTURES\
    _contentPanelCtrl lnbSetPicture [[_newRow, 2], getText (configFile >> "cfgWeapons" >> ((_loadout select 0) select 0) >> "picture")];\
    _contentPanelCtrl lnbSetPicture [[_newRow, 3], getText (configFile >> "cfgWeapons" >> ((_loadout select 1) select 0) >> "picture")];\
    _contentPanelCtrl lnbSetPicture [[_newRow, 4], getText (configFile >> "cfgWeapons" >> ((_loadout select 2) select 0) >> "picture")];\
    _contentPanelCtrl lnbSetPicture [[_newRow, 5], getText (configFile >> "cfgWeapons" >> ((_loadout select 3) select 0) >> "picture")];\
    _contentPanelCtrl lnbSetPicture [[_newRow, 6], getText (configFile >> "cfgWeapons" >> ((_loadout select 4) select 0) >> "picture")];\
    _contentPanelCtrl lnbSetPicture [[_newRow, 7], getText (configFile >> "cfgVehicles" >> ((_loadout select 5) select 0) >> "picture")];\
    _contentPanelCtrl lnbSetPicture [[_newRow, 8], getText (configFile >> "cfgWeapons" >> (_loadout select 6) >> "picture")];\
    _contentPanelCtrl lnbSetPicture [[_newRow, 9], getText (configFile >> "cfgGlasses" >> (_loadout select 7) >> "picture")];
