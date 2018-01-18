#include "script_component.hpp"
#include "defines.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

_fnc_mass = {
    params ["_stat", "_config"];

    private _statValues = [[_config], _stat] call BIS_fnc_configExtremes;
    private _maxValue = (_statValues select 1) select 0;

    format ["%1lb (%2kg)", (round (_maxValue * 0.1 * 100)) / 100, (round (_maxValue * 0.1 * (1/2.2046) * 100)) / 100];
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

_fnc_reloadTime = {
    
};

_fnc_dispersion = {
    
};


// Arsenal
GVAR(modList) = ["","curator","kart","heli","mark","expansion","expansionpremium"];
GVAR(statsListLeftPanel) =  [
    [
        [
            [["reloadTime"], "string ROF (TBL)", [true, false], [], [{

            }, {}]],
            [["dispersion"], "Accuracy (TBL)", [true, false], [], [{

            }, {}]],
            [["maxZeroing"], "Range (TBL)", [true, false], [], [{

            }, {}]],
            [["hit", "initSpeed"], "Damage (TBL)", [true, false], [[0, 3.2], [-1, 1100], 2006], [_fnc_hit, {}]],
            [["mass"], "Weight (TBL)", [false, true], [], [{}, _fnc_mass]]
        ]
    ], // Primary
    [
        [
            [["reloadTime"], "string ROF (TBL)", [true, false], [], [{

            }, {}]],
            [["dispersion"], "Accuracy (TBL)", [true, false], [], [{

            }, {}]],
            [["maxZeroing"], "Range (TBL)", [true, false], [], [{

            }, {}]],
            [["hit", "initSpeed"], "Damage (TBL)", [true, false], [[0, 3.2], [-1, 1100], 2006], [_fnc_hit, {}]],
            [["mass"], "Weight (TBL)", [false, true], [], [{}, _fnc_mass]]
        ]
    ], // Handgun
    [
        [
            [["maxZeroing"], "Range (TBL)", [true, false], [], [{

            }, {}]],
            [["hit", "initSpeed"], "Damage (TBL)", [true, false], [[0, 3.2], [-1, 1100], 2006], [_fnc_hit, {}]],
            [["mass"], "Weight (TBL)", [false, true], [], [{}, _fnc_mass]]
        ]
    ], // Launcher
    [
    ], // Uniform
    [
    ], // Vests
    [
    ], // Backpacks
    [
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

[QGVAR(displayStats), {
    _this call FUNC(handleStats);
}] call CBA_fnc_addEventHandler;

ADDON = true;
