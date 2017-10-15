// Pixel grid
#define pixelScale  0.25
#define GRID_W (pixelW * pixelGridNoUIScale * pixelScale)
#define GRID_H (pixelH * pixelGridNoUIScale * pixelScale)

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
#define IDC_menuBarBackground 1001
#define IDC_buttonClose 1002
#define IDC_buttonSave 1003
#define IDC_buttonLoad 1004
#define IDC_buttonImport 1005
#define IDC_buttonExport 1006
#define IDC_buttonHide 1007
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
\
    if (ctrlFade _x != 0) then {\
        _x ctrlSetFade 0;\
    };\
    if !(ctrlShown _x) then {\
        _x ctrlShow true;\
    };\
    _x ctrlCommit FADE_DELAY;\
} foreach [\
    IDC_blockRightFrame,\
    IDC_blockRighttBackground,\
    IDC_rightTabContent,\
    IDC_sortRightTab,\
    RIGHT_PANEL_ACC_IDCS,\
    IDC_rightSearchbar,\
    IDC_rightSearchbarButton\
];\
{\
    _x = _display displayCtrl _x;\
\
    if (ctrlFade _x != 1) then {\
        _x ctrlSetFade 1;\
    };\
    if (ctrlShown _x) then {\
        _x ctrlShow false;\
    };\
    _x ctrlCommit FADE_DELAY;\
} foreach [\
    IDC_loadIndicator,\
    RIGHT_PANEL_ITEMS_IDCS,\
    IDC_rightTabContentListnBox,\
    RIGHT_PANEL_ITEMS_BACKGROUND_IDCS,\
    IDC_buttonRemoveAll\
];

#define TOGGLE_RIGHT_PANEL_CONTAINER\
{\
    _x = _display displayCtrl _x;\
\
    if (ctrlFade _x != 0) then {\
        _x ctrlSetFade 0;\
    };\
    if !(ctrlShown _x) then {\
        _x ctrlShow true;\
    };\
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
];

#define TOGGLE_RIGHT_PANEL_HIDE\
{\
    _x = _display displayCtrl _x;\
    if (ctrlFade _x != 1) then {\
        _x ctrlSetFade 1;\
    };\
    if (ctrlShown _x) then {\
        _x ctrlShow false;\
    };\
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
    IDC_rightSearchbarButton\
];

#define LIST_DEFAULTS\
    [\
    [\
        (primaryweapon GVAR(center) call bis_fnc_baseWeapon),\
        (handgunweapon GVAR(center) call bis_fnc_baseWeapon),\
        (secondaryweapon GVAR(center) call bis_fnc_baseWeapon)\
    ],\
    [\
    [((GVAR(center) weaponAccessories (primaryWeapon GVAR(center))) select 2), ((GVAR(center) weaponAccessories (secondaryWeapon GVAR(center))) select 2), ((GVAR(center) weaponAccessories (handgunWeapon GVAR(center))) select 2)] select {!(_x isEqualTo "")},\
    [((GVAR(center) weaponAccessories (primaryWeapon GVAR(center))) select 1), ((GVAR(center) weaponAccessories (secondaryWeapon GVAR(center))) select 1), ((GVAR(center) weaponAccessories (handgunWeapon GVAR(center))) select 1)] select {!(_x isEqualTo "")},\
    [((GVAR(center) weaponAccessories (primaryWeapon GVAR(center))) select 0), ((GVAR(center) weaponAccessories (secondaryWeapon GVAR(center))) select 0), ((GVAR(center) weaponAccessories (handgunWeapon GVAR(center))) select 0)] select {!(_x isEqualTo "")},\
    [((GVAR(center) weaponAccessories (primaryWeapon GVAR(center))) select 3), ((GVAR(center) weaponAccessories (secondaryWeapon GVAR(center))) select 3), ((GVAR(center) weaponAccessories (handgunWeapon GVAR(center))) select 3)] select {!(_x isEqualTo "")}\
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
