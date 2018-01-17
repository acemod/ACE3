#include "script_component.hpp"
#include "defines.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

// Arsenal
GVAR(modList) = ["","curator","kart","heli","mark","expansion","expansionpremium"];
GVAR(statsListLeftPanel) =  [
    [
        [
            ["reloadTime", "string ROF (TBL)", [true, false], [0, 10]],
            ["dispersion", "Accuracy (TBL)", [true, false], [0, 10]],
            ["maxZeroing", "Range (TBL)", [true, false], [0, 10]],
            [["hit", "initSpeed"], "Damage (TBL)", [true, false], [0, 10], {
                sqrt((_this select 0)^2 * (_this select 1))
            }],
            ["mass", "Weight (TBL)", [false, true]]
        ]
    ], // Primary
    [
        [
            ["reloadTime", "string ROF (TBL)", [true, false], [0, 10]],
            ["dispersion", "Accuracy (TBL)", [true, false], [0, 10]],
            ["maxZeroing", "Range (TBL)", [true, false], [0, 10]],
            [["hit", "initSpeed"], "Damage (TBL)", [true, false], [0, 10], {
                sqrt((_this select 0)^2 * (_this select 1))
            }]//,
            //["mass", "Weight (TBL)", [false, true]]
        ]
    ], // Handgun
    [
        [
            ["maxZeroing", "Range (TBL)", [true, false], [0, 10]],
            [["hit", "initSpeed"], "Damage (TBL)", [true, false], [0, 10], {
                sqrt((_this select 0)^2 * (_this select 1))
            }],
            ["mass", "Weight (TBL)", [false, true]]
        ]
    ], // Launcher
    [
        [
            ["passthrough", "Ballistic protection (TBL)", [true, false], [0, 10]],
            ["armor", "Explosive resistance (TBL)", [true, false], [0, 10]]//,
            //["maximumLoad", "load (TBL)", [true, false], [0, 10]],
            //["mass", "Weight (TBL)", [false, true]]
        ]
    ], // Uniform
    [
        [
            ["passthrough", "Ballistic protection (TBL)", [true, false], [0, 10]],
            ["armor", "Explosive resistance (TBL)", [true, false], [0, 10]],
            ["maximumLoad", "load (TBL)", [true, false], [0, 10]],
            ["mass", "Weight (TBL)", [false, true]]
        ]
    ], // Vests
    [
        [
            ["passthrough", "Ballistic protection (TBL)", [true, false], [0, 10]],
            ["armor", "Explosive resistance (TBL)", [true, false], [0, 10]],
            ["maximumLoad", "load (TBL)", [true, false], [0, 10]],
            ["mass", "Weight (TBL)", [false, true]]
        ]
    ], // Backpacks
    [
        [
            ["passthrough", "Ballistic protection (TBL)", [true, false], [0, 10]],
            ["armor", "Explosive resistance (TBL)", [true, false], [0, 10]],
            ["mass", "Weight (TBL)", [false, true]]
        ]
    ], // Headgear
    [
        [
            ["mass", "Weight (TBL)", [false, true]]
        ]
    ], // Goggles
    [
        [
            ["mass", "Weight (TBL)", [false, true]]
        ]
    ], // NVGs
    [
        [
            ["mass", "Weight (TBL)", [false, true]]
        ]
    ], // Binoculars
    [
        [
            ["mass", "Weight (TBL)", [false, true]]
        ]
    ], // Map
    [
        [
            ["mass", "Weight (TBL)", [false, true]]
        ]
    ], // GPS
    [
        [
            ["mass", "Weight (TBL)", [false, true]]
        ]
    ], // Radio
    [
        [
            ["mass", "Weight (TBL)", [false, true]]
        ]
    ], // Compass
    [
        [
            ["mass", "Weight (TBL)", [false, true]]
        ]
    ], // Watch
    [], // Voices
    [], // Faces
    [] // Insignias
];
GVAR(statsListRightPanel) = [
    [
        [
            ["mass", "Weight (TBL)", [false, true]]
        ]
    ], // Optics
    [
        [
            ["mass", "Weight (TBL)", [false, true]]
        ]
    ], // Side accs
    [
        [
            ["mass", "Weight (TBL)", [false, true]]
        ]
    ], // Muzzle
    [
        [
            ["mass", "Weight (TBL)", [false, true]]
        ]
    ], // Bipod
    [
        [
            ["mass", "Weight (TBL)", [false, true]]
        ]
    ], // Mag
    [
        [
            ["mass", "Weight (TBL)", [false, true]]
        ]
    ], // Throw
    [
        [
            ["mass", "Weight (TBL)", [false, true]]
        ]
    ], // Put
    [
        [
            ["mass", "Weight (TBL)", [false, true]]
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
