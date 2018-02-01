#include "script_component.hpp"
#include "defines.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

private _fnc_mass = {
    params ["", "_config"];

    private _mass = getNumber (_config >> "mass");

    if (_mass == 0 && {isClass (_config >> "WeaponSlotsInfo")}) then {
        _mass = getNumber (_config >> "WeaponSlotsInfo" >> "mass");
    };

    if (_mass == 0 && {isClass (_config >> "itemInfo")}) then {
        _mass = getNumber (_config >> "itemInfo" >> "mass");
    };

    format ["%1kg (%2lb)",((_mass * 0.1 * (1/2.2046) * 100) / 100) ToFixed 2, ((_mass * 0.1 * 100) / 100) ToFixed 2];
};

private _fnc_hit = {
    params ["_stats", "_config", "_args"];
    _args params ["_hitMinMax", "_initSpeedMinMax", "_launcherTabIDC"];

    private _statValues = [
        [_config],
        [_stats select 0, _stats select 1],
        [true, false],
        [_hitMinMax select 0, _initSpeedMinMax select 0]
    ] call BIS_fnc_configExtremes;
    (_statValues select 1) params ["_hit", "_initSpeed"];

    _hit = linearConversion [_hitMinMax select 0, _hitMinMax select 1, _hit, 0.01, 1];
    _initSpeed = linearConversion [_initSpeedMinMax select 0, _initSpeedMinMax select 1, _initSpeed, 0.01, 1];

    [sqrt(_hit^2 * _initSpeed), _hit] select (GVAR(currentLeftPanel) == _launcherTabIDC)
};

private _fnc_otherBarStat = {
    params ["_stat", "_config", "_args"];
    _args params ["_statMinMax", "_barLimits", "_configExtremeBool"];

    private _statValues = [
        [_config],
        [_stat select 0],
        [_configExtremeBool],
        [_statMinMax select 0]
    ] call BIS_fnc_configExtremes;

    linearConversion [_statMinMax select 0, _statMinMax select 1, (_statValues select 1) select 0, _barLimits select 0, _barLimits select 1]
};

// Arsenal
GVAR(modList) = ["","curator","kart","heli","mark","expansion","expansionpremium"];
GVAR(statsListLeftPanel) =  [
    [
        [
            [["reloadTime"], localize "str_a3_rscdisplayarsenal_stat_rof", [true, true], [[-1.4, 0.31], [1, 0.01], true], [_fnc_otherBarStat, {
                params ["_stat", "_config"];

                private _reloadTime = getNumber (_config >> _stat select 0);

                format ["%1 rpm", round (60 / _reloadTime)]
            }]],
            [["dispersion"], localize "str_a3_rscdisplayarsenal_stat_dispersion", [true, true], [[-4, -1.7], [1, 0.01], true], [_fnc_otherBarStat, {
                params ["_stat", "_config"];

                private _dispersion = getNumber (_config >> _stat select 0);

                format ["%1 MIL (%2 MOA)", _dispersion * 1000, (_dispersion / pi * 10800) ToFixed 1];
            }]],
            [["maxZeroing"], localize "str_a3_rscdisplayarsenal_stat_range", [true, false], [[0, 2500], [0.01, 1], false], [_fnc_otherBarStat, {}]],
            [["hit", "initSpeed"], localize "str_a3_rscdisplayarsenal_stat_impact", [true, false], [[0, 3.2], [-1, 1100], 2006], [_fnc_hit, {}]],
            [["mass"], localize "str_a3_rscdisplayarsenal_stat_weight", [false, true], [], [{}, _fnc_mass]]
        ]
    ], // Primary
    [
        [
            [["reloadTime"], localize "str_a3_rscdisplayarsenal_stat_rof", [true, true], [[-1.4, 0.31], [1, 0.01], true], [_fnc_otherBarStat, {
                params ["_stat", "_config"];

                private _reloadTime = getNumber (_config >> _stat select 0);

                format ["%1 rpm", round (60 / _reloadTime)]
            }]],
            [["dispersion"], localize "str_a3_rscdisplayarsenal_stat_dispersion", [true, true], [[-4, -1.7], [1, 0.01], true], [_fnc_otherBarStat, {
                params ["_stat", "_config"];

                private _dispersion = getNumber (_config >> _stat select 0);

                format ["%1 MIL (%2 MOA)", _dispersion * 1000, (_dispersion / pi * 10800) ToFixed 1];
            }]],
            [["maxZeroing"], localize "str_a3_rscdisplayarsenal_stat_dispersion", [true, false], [[0, 2500], [0.01, 1], false], [_fnc_otherBarStat, {}]],
            [["hit", "initSpeed"], localize "str_a3_rscdisplayarsenal_stat_impact", [true, false], [[0, 3.2], [-1, 1100], 2006], [_fnc_hit, {}]],
            [["mass"], localize "str_a3_rscdisplayarsenal_stat_weight", [false, true], [], [{}, _fnc_mass]]
        ]
    ], // Handgun
    [
        [
            [["maxZeroing"], localize "str_a3_rscdisplayarsenal_stat_dispersion", [true, false], [[0, 2500], [0.01, 1], false], [_fnc_otherBarStat, {}]],
            [["hit", "initSpeed"], localize "str_a3_rscdisplayarsenal_stat_impact", [true, false], [[0, 3.2], [-1, 1100], 2006], [_fnc_hit, {}]],
            [["mass"], localize "str_a3_rscdisplayarsenal_stat_weight", [false, true], [], [{}, _fnc_mass]]
        ]
    ], // Launcher
    [
        [
            [["passthrough"], localize "str_a3_rscdisplayarsenal_stat_passthrough", [true, false], [[0, 0.63], [0.01, 1], false], [_fnc_otherBarStat, {}]],
            [["armor"], localize "str_a3_rscdisplayarsenal_stat_armor", [true, false], [[0, 0.80], [0.01, 1], false], [_fnc_otherBarStat, {}]],
            [["maximumLoad"], localize "str_a3_rscdisplayarsenal_stat_load", [true, false], [[0, 500], [0.01, 1], false], [_fnc_otherBarStat, {}]],
            [["mass"], localize "str_a3_rscdisplayarsenal_stat_weight", [false, true], [], [{}, _fnc_mass]]
        ]
    ], // Uniform
    [
        [
            [["passthrough"], localize "str_a3_rscdisplayarsenal_stat_passthrough", [true, false], [[0, 0.63], [0.01, 1], false], [_fnc_otherBarStat, {}]],
            [["armor"], localize "str_a3_rscdisplayarsenal_stat_armor", [true, false], [[0, 0.80], [0.01, 1], false], [_fnc_otherBarStat, {}]],
            [["maximumLoad"], localize "str_a3_rscdisplayarsenal_stat_load", [true, false], [[0, 500], [0.01, 1], false], [_fnc_otherBarStat, {}]],
            [["mass"], localize "str_a3_rscdisplayarsenal_stat_weight", [false, true], [], [{}, _fnc_mass]]
        ]
    ], // Vests
    [
        [
            [["maximumLoad"], localize "str_a3_rscdisplayarsenal_stat_load", [true, false], [[0, 500], [0.01, 1], false], [_fnc_otherBarStat, {}]],
            [["mass"], localize "str_a3_rscdisplayarsenal_stat_weight", [false, true], [], [{}, _fnc_mass]]
        ]
    ], // Backpacks
    [
        [
            [["passthrough"], localize "str_a3_rscdisplayarsenal_stat_passthrough", [true, false], [[0, 0.63], [0.01, 1], false], [_fnc_otherBarStat, {}]],
            [["armor"], localize "str_a3_rscdisplayarsenal_stat_armor", [true, false], [[0, 0.80], [0.01, 1], false], [_fnc_otherBarStat, {}]],
            [["mass"], localize "str_a3_rscdisplayarsenal_stat_weight", [false, true], [], [{}, _fnc_mass]]
        ]
    ], // Headgear
    [
        [
            [["mass"], localize "str_a3_rscdisplayarsenal_stat_weight", [false, true], [], [{}, _fnc_mass]]
        ]
    ], // Goggles
    [
        [
            [["mass"], localize "str_a3_rscdisplayarsenal_stat_weight", [false, true], [], [{}, _fnc_mass]]
        ]
    ], // NVGs
    [
        [
            [["mass"], localize "str_a3_rscdisplayarsenal_stat_weight", [false, true], [], [{}, _fnc_mass]]
        ]
    ], // Binoculars
    [
        [
            [["mass"], localize "str_a3_rscdisplayarsenal_stat_weight", [false, true], [], [{}, _fnc_mass]]
        ]
    ], // Map
    [
        [
            [["mass"], localize "str_a3_rscdisplayarsenal_stat_weight", [false, true], [], [{}, _fnc_mass]]
        ]
    ], // GPS
    [
        [
            [["mass"], localize "str_a3_rscdisplayarsenal_stat_weight", [false, true], [], [{}, _fnc_mass]]
        ]
    ], // Radio
    [
        [
            [["mass"], localize "str_a3_rscdisplayarsenal_stat_weight", [false, true], [], [{}, _fnc_mass]]
        ]
    ], // Compass
    [
        [
            [["mass"], localize "str_a3_rscdisplayarsenal_stat_weight", [false, true], [], [{}, _fnc_mass]]
        ]
    ], // Watch
    [], // Voices
    [], // Faces
    [] // Insignias
];
GVAR(statsListRightPanel) = [
    [
        [
            [["mass"], localize "str_a3_rscdisplayarsenal_stat_weight", [false, true], [], [{}, _fnc_mass]]
        ]
    ], // Optics
    [
        [
            [["mass"], localize "str_a3_rscdisplayarsenal_stat_weight", [false, true], [], [{}, _fnc_mass]]
        ]
    ], // Side accs
    [
        [
            [["mass"], localize "str_a3_rscdisplayarsenal_stat_weight", [false, true], [], [{}, _fnc_mass]]
        ]
    ], // Muzzle
    [
        [
            [["mass"], localize "str_a3_rscdisplayarsenal_stat_weight", [false, true], [], [{}, _fnc_mass]]
        ]
    ], // Bipod
    [
        [
            [["mass"], localize "str_a3_rscdisplayarsenal_stat_weight", [false, true], [], [{}, _fnc_mass]]
        ]
    ], // Mag
    [
        [
            [["mass"], localize "str_a3_rscdisplayarsenal_stat_weight", [false, true], [], [{}, _fnc_mass]]
        ]
    ], // Throw
    [
        [
            [["mass"], localize "str_a3_rscdisplayarsenal_stat_weight", [false, true], [], [{}, _fnc_mass]]
        ]
    ], // Put
    [
        [
            [["mass"], localize "str_a3_rscdisplayarsenal_stat_weight", [false, true], [], [{}, _fnc_mass]],
            [[], localize LSTRING(statPotassium), [true, false], [], [{1}, {}, {
                params ["", "_config"];

                ((configName _config) == "ACE_Banana")
            }]]
        ]
    ] // Misc
];

if (["ACE_Ballistics"] call EFUNC(common,isModLoaded)) then {
    {
        (GVAR(statsListLeftPanel) select _x) pushBack [
            [["ACE_barrelTwist"], localize LSTRING(statBarrelTwist), [false, true], [], [{}, {
                params ["_stat", "_config"];

                private _barrelTwist = getNumber (_config >> _stat select 0);

                format ["%1mm (%2in)",_barrelTwist, (_barrelTwist / 25.4) toFixed 1];
            }]],
            [["ACE_barrelLength"], localize LSTRING(statBarrelLength), [false, true], [], [{}, {
                params ["_stat", "_config"];

                private _barrelLength = getNumber (_config >> _stat select 0);

                format ["%1mm (%2in)",_barrelLength, (_barrelLength / 25.4) toFixed 1];
            }]]
        ];
    } foreach [0, 1];

    (GVAR(statsListRightPanel) select 4) pushBack [
        [["ammo"], localize LSTRING(statAmmo), [false, true], [], [{}, {
            params ["_stat", "_config"];

            getText (_config >> _stat select 0)
        }]],
        [["ACE_dragModel", "ACE_ballisticCoefficients"], localize LSTRING(statBallisticCoef), [false, true], [], [{}, {
            params ["_stat", "_config", ""];

            private _ammoCfg = (configFile >> "CfgAmmo" >> (getText (_config >> "ammo"))); 
            private _dragModel = (_ammoCfg >> _stat select 0);
            private _ballisticCoef = (_ammoCfg >> _stat select 1);

            if (isNumber _dragModel && {isArray _ballisticCoef}) then {
                format ["%1 G%2", (getArray _ballisticCoef) select 0 ,getNumber _dragModel]
            } else {
                localize LSTRING(statUndefined);
            };
        }]],
        [["ACE_bulletMass"], localize LSTRING(statBulletMass), [false, true], [], [{}, {
            params ["_stat", "_config"];

            private _ammoWeightCfg = (configFile >> "CfgAmmo" >> (getText (_config >> "ammo")) >> _stat select 0);

            if (isNumber _ammoWeightCfg) then {

                private _ammoWeight = getNumber _ammoWeightCfg;
                format ["%1g (%2gr)", _ammoWeight toFixed 1, (_ammoWeight * 15.43) toFixed 1]
            } else {
                localize LSTRING(statUndefined);
            };
        }]]
    ];
};

if (["ACE_Hearing"] call EFUNC(common,isModLoaded)) then {
    (GVAR(statsListLeftPanel) select 6) pushBack [
        [["ACE_hearing_protection"], localize LSTRING(statHearingProtection), [true, false], [[0, 1], [0.01, 1], false], [_fnc_otherBarStat, {}]],
        [["ACE_hearing_lowerVolume"], localize LSTRING(statHearingLowerVolume), [true, false], [[0, 1], [0.01, 1], false], [_fnc_otherBarStat, {}]]
    ];
};

if (["ACE_Explosives"] call EFUNC(common,isModLoaded)) then {
    (GVAR(statsListRightPanel) select 7) pushBack [
        [["ace_explosives_Range"], "explosive range", [false, true], [], [{}, {
            params ["_stat", "_config"];

            private _exploRangeStat = getNumber (_config >> _stat select 0);
            format ["%1m (%2ft)", _exploRangeStat, (_exploRangeStat / 0.3048) toFixed 1];
        }, {
            params ["", "_config"];

            (getNumber (_config >> "ace_explosives_Detonator"))  > 0
        }]]
    ];
};

[QGVAR(camInverted), "CHECKBOX", localize LSTRING(invertCameraSetting), localize LSTRING(settingCategory), false] call CBA_Settings_fnc_init;
[QGVAR(enableModIcons), "CHECKBOX", [LSTRING(modIconsSetting), LSTRING(modIconsTooltip)], localize LSTRING(settingCategory), true] call CBA_Settings_fnc_init;
[QGVAR(fontHeight), "SLIDER", [LSTRING(fontHeightSetting), LSTRING(fontHeightTooltip)], localize LSTRING(settingCategory), [1, 10, 4.5, 1]] call CBA_Settings_fnc_init;

// Arsenal loadouts
[QGVAR(allowDefaultLoadouts), "CHECKBOX", [LSTRING(allowDefaultLoadoutsSetting), LSTRING(defaultLoadoutsTooltip)], localize LSTRING(settingCategory), true, true] call CBA_Settings_fnc_init;
[QGVAR(allowSharedLoadouts), "CHECKBOX", localize LSTRING(allowSharingSetting), localize LSTRING(settingCategory), true, true] call CBA_Settings_fnc_init;
[QGVAR(EnableRPTLog), "CHECKBOX", [LSTRING(printToRPTSetting), LSTRING(printToRPTTooltip)], localize LSTRING(settingCategory), false, false] call CBA_Settings_fnc_init;

[QGVAR(statsToggle), {
    params ["_display", "_showStats"];

    private _statsCtrlGroupCtrl = _display displayCtrl IDC_statsBox;
    private _statsPreviousPageCtrl = _display displayCtrl IDC_statsPreviousPage;
    private _statsNextPageCtrl = _display displayCtrl IDC_statsNextPage;
    private _statsCurrentPageCtrl = _display displayCtrl IDC_statsCurrentPage;

    private _statsButtonCtrl = _display displayCtrl IDC_statsButton;
    private _statsButtonCloseCtrl = _display displayCtrl IDC_statsButtonClose;

    {
        _x ctrlShow (GVAR(showStats) && {_showStats});
    } foreach [
        _statsCtrlGroupCtrl,
        _statsPreviousPageCtrl,
        _statsNextPageCtrl,
        _statsCurrentPageCtrl,
        _statsButtonCloseCtrl
    ];

    _statsButtonCtrl ctrlShow (!GVAR(showStats) && {_showStats})
}] call CBA_fnc_addEventHandler;


[QGVAR(statsButton), {
    _this call FUNC(buttonStats);
}] call CBA_fnc_addEventHandler;

[QGVAR(statsChangePage), {
    _this call FUNC(buttonStatsPage);
}] call CBA_fnc_addEventHandler;


[QGVAR(displayStats), {
    _this call FUNC(handleStats);
}] call CBA_fnc_addEventHandler;

ADDON = true;
