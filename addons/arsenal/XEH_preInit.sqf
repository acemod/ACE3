#include "script_component.hpp"
#include "defines.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

_fnc_mass = {
    params ["_stat", "_config"];

    private _statValues = [
        [_config],
        [_stat select 0],
        [false]
    ] call BIS_fnc_configExtremes;

    private _value = (_statValues select 1) select 0;

    if (_value == 0 && {isClass (_config >> "itemInfo")}) then {
        _value = getNumber (_config >> "itemInfo" >> "mass");
    };

    format ["%1kg (%2lb)",((_value * 0.1 * (1/2.2046) * 100) / 100) ToFixed 2, ((_value * 0.1 * 100) / 100) ToFixed 2];
};

_fnc_hit = {
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

_fnc_otherBarStat = {
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
            [["reloadTime"], "string ROF (TBL)", [true, true], [[-1.4, 0.31], [1, 0.01], true], [_fnc_otherBarStat, {
                params ["_stat", "_config", "_args"];
                _args params ["_statMinMax", "_barLimits"];

                private _statValues = [
                    [_config],
                    [_stat select 0],
                    [false],
                    [_statMinMax select 0]
                ] call BIS_fnc_configExtremes;

                format ["%1 rpm", round (60 / ((_statValues select 1) select 0))]
            }]],
            [["dispersion"], "Accuracy (TBL)", [true, true], [[-4, -1.7], [1, 0.01], true], [_fnc_otherBarStat, {
                params ["_stat", "_config", "_args"];
                _args params ["_statMinMax", "_barLimits"];

                private _statValues = [
                    [_config],
                    [_stat select 0],
                    [false],
                    [_statMinMax select 0]
                ] call BIS_fnc_configExtremes;

                format ["%1 MOA",(((_statValues select 1) select 0) / pi * 10800) ToFixed 1];
            }]],
            [["maxZeroing"], "Range (TBL)", [true, false], [[0, 2500], [0.01, 1], false], [_fnc_otherBarStat, {}]],
            [["hit", "initSpeed"], "Damage (TBL)", [true, false], [[0, 3.2], [-1, 1100], 2006], [_fnc_hit, {}]],
            [["mass"], "Weight (TBL)", [false, true], [], [{}, _fnc_mass]]
        ]
    ], // Primary
    [
        [
            [["reloadTime"], "string ROF (TBL)", [true, true], [[-1.4, 0.31], [1, 0.01], true], [_fnc_otherBarStat, {
                params ["_stat", "_config", "_args"];
                _args params ["_statMinMax", "_barLimits"];

                private _statValues = [
                    [_config],
                    [_stat select 0],
                    [false],
                    [_statMinMax select 0]
                ] call BIS_fnc_configExtremes;

                format ["%1 rpm",round (60 / ((_statValues select 1) select 0))]
            }]],
            [["dispersion"], "Accuracy (TBL)", [true, true], [[-4, -1.7], [1, 0.01], true], [_fnc_otherBarStat, {
                params ["_stat", "_config", "_args"];
                _args params ["_statMinMax", "_barLimits"];

                private _statValues = [
                    [_config],
                    [_stat select 0],
                    [false],
                    [_statMinMax select 0]
                ] call BIS_fnc_configExtremes;

                format ["%1 MOA",(((_statValues select 1) select 0) / pi * 10800) ToFixed 1];
            }]],
            [["maxZeroing"], "Range (TBL)", [true, false], [[0, 2500], [0.01, 1], false], [_fnc_otherBarStat, {}]],
            [["hit", "initSpeed"], "Damage (TBL)", [true, false], [[0, 3.2], [-1, 1100], 2006], [_fnc_hit, {}]],
            [["mass"], "Weight (TBL)", [false, true], [], [{}, _fnc_mass]]
        ]
    ], // Handgun
    [
        [
            [["maxZeroing"], "Range (TBL)", [true, false], [[0, 2500], [0.01, 1], false], [_fnc_otherBarStat, {}]],
            [["hit", "initSpeed"], "Damage (TBL)", [true, false], [[0, 3.2], [-1, 1100], 2006], [_fnc_hit, {}]],
            [["mass"], "Weight (TBL)", [false, true], [], [{}, _fnc_mass]]
        ]
    ], // Launcher
    [
        [
            [["passthrough"], "Ballistic protection (TBL)", [true, false], [[0, 0.63], [0.01, 1], false], [_fnc_otherBarStat, {}]],
            [["armor"], "Explosive resistance (TBL)", [true, false], [[0, 0.80], [0.01, 1], false], [_fnc_otherBarStat, {}]],
            [["maximumLoad"], "Load (TBL)", [true, false], [[0, 500], [0.01, 1], false], [_fnc_otherBarStat, {}]],
            [["mass"], "Weight (TBL)", [false, true], [], [{}, _fnc_mass]]
        ]
    ], // Uniform
    [
        [
            [["passthrough"], "Ballistic protection (TBL)", [true, false], [[0, 0.63], [0.01, 1], false], [_fnc_otherBarStat, {}]],
            [["armor"], "Explosive resistance (TBL)", [true, false], [[0, 0.80], [0.01, 1], false], [_fnc_otherBarStat, {}]],
            [["maximumLoad"], "Load (TBL)", [true, false], [[0, 500], [0.01, 1], false], [_fnc_otherBarStat, {}]],
            [["mass"], "Weight (TBL)", [false, true], [], [{}, _fnc_mass]]
        ]
    ], // Vests
    [
        [
            [["maximumLoad"], "Load (TBL)", [true, false], [[0, 500], [0.01, 1], false], [_fnc_otherBarStat, {}]],
            [["mass"], "Weight (TBL)", [false, true], [], [{}, _fnc_mass]]
        ]
    ], // Backpacks
    [
        [
            [["passthrough"], "Ballistic protection (TBL)", [true, false], [[0, 0.63], [0.01, 1], false], [_fnc_otherBarStat, {}]],
            [["armor"], "Explosive resistance (TBL)", [true, false], [[0, 0.80], [0.01, 1], false], [_fnc_otherBarStat, {}]],
            [["mass"], "Weight (TBL)", [false, true], [], [{}, _fnc_mass]]
        ]
    ], // Headgear
    [
        [
            [["mass"], "Weight (TBL)", [false, true], [], [{}, _fnc_mass]]
        ]
    ], // Goggles
    [
        [
            [["mass"], "Weight (TBL)", [false, true], [], [{}, _fnc_mass]]
        ]
    ], // NVGs
    [
        [
            [["mass"], "Weight (TBL)", [false, true], [], [{}, _fnc_mass]]
        ]
    ], // Binoculars
    [
        [
            [["mass"], "Weight (TBL)", [false, true], [], [{}, _fnc_mass]]
        ]
    ], // Map
    [
        [
            [["mass"], "Weight (TBL)", [false, true], [], [{}, _fnc_mass]]
        ]
    ], // GPS
    [
        [
            [["mass"], "Weight (TBL)", [false, true], [], [{}, _fnc_mass]]
        ]
    ], // Radio
    [
        [
            [["mass"], "Weight (TBL)", [false, true], [], [{}, _fnc_mass]]
        ]
    ], // Compass
    [
        [
            [["mass"], "Weight (TBL)", [false, true], [], [{}, _fnc_mass]]
        ]
    ], // Watch
    [], // Voices
    [], // Faces
    [] // Insignias
];
GVAR(statsListRightPanel) = [
    [
        [
            [["mass"], "Weight (TBL)", [false, true], [], [{}, _fnc_mass]]
        ]
    ], // Optics
    [
        [
            [["mass"], "Weight (TBL)", [false, true], [], [{}, _fnc_mass]]
        ]
    ], // Side accs
    [
        [
            [["mass"], "Weight (TBL)", [false, true], [], [{}, _fnc_mass]]
        ]
    ], // Muzzle
    [
        [
            [["mass"], "Weight (TBL)", [false, true], [], [{}, _fnc_mass]]
        ]
    ], // Bipod
    [
        [
            [["mass"], "Weight (TBL)", [false, true], [], [{}, _fnc_mass]]
        ]
    ], // Mag
    [
        [
            [["mass"], "Weight (TBL)", [false, true], [], [{}, _fnc_mass]]
        ]
    ], // Throw
    [
        [
            [["mass"], "Weight (TBL)", [false, true], [], [{}, _fnc_mass]]
        ]
    ], // Put
    [
        [
            [["mass"], "Weight (TBL)", [false, true], [], [{}, _fnc_mass]]
        ]
    ] // Misc
];

[QGVAR(camInverted), "CHECKBOX", localize LSTRING(invertCameraSetting), localize LSTRING(settingCategory), false] call CBA_Settings_fnc_init;
[QGVAR(enableModIcons), "CHECKBOX", [LSTRING(modIconsSetting), LSTRING(modIconsTooltip)], localize LSTRING(settingCategory), true] call CBA_Settings_fnc_init;
[QGVAR(fontHeight), "SLIDER", [LSTRING(fontHeightSetting), LSTRING(fontHeightTooltip)], localize LSTRING(settingCategory), [1, 10, 4.5, 1]] call CBA_Settings_fnc_init;

// Arsenal loadouts
[QGVAR(allowDefaultLoadouts), "CHECKBOX", [LSTRING(allowDefaultLoadoutsSetting), LSTRING(defaultLoadoutsTooltip)], localize LSTRING(settingCategory), true, true] call CBA_Settings_fnc_init;
[QGVAR(allowSharedLoadouts), "CHECKBOX", localize LSTRING(allowSharingSetting), localize LSTRING(settingCategory), true, true] call CBA_Settings_fnc_init;
[QGVAR(EnableRPTLog), "CHECKBOX", [LSTRING(printToRPTSetting), LSTRING(printToRPTTooltip)], localize LSTRING(settingCategory), false, false] call CBA_Settings_fnc_init;

[QGVAR(statsToggle), {
    params ["_display", "_showStats"];

    private _statBoxCtrl = _display displayCtrl IDC_statsBox;
    _statBoxCtrl ctrlShow (GVAR(showStats) && {_showStats});
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
