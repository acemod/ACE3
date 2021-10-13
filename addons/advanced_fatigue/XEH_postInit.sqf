#include "script_component.hpp"

if (!hasInterface) exitWith {};

[missionNamespace, "ACE_setCustomAimCoef", QUOTE(ADDON), {
    private _unit = ACE_player;
    private _fatigue = _unit getVariable [QGVAR(aimFatigue), 0];

    switch (stance _unit) do {
        case ("CROUCH"): {
            (1.0 + _fatigue ^ 2 * 0.1) * GVAR(swayFactor)
        };
        case ("PRONE"): {
            (1.0 + _fatigue ^ 2 * 2.0) * GVAR(swayFactor)
        };
        default {
            (1.5 + _fatigue ^ 2 * 3.0) * GVAR(swayFactor)
        };
    };
}] call EFUNC(common,arithmeticSetSource);

["CBA_settingsInitialized", {
    if (!GVAR(enabled)) exitWith {};

    // - Post process effect ------------------------------------------------------
    GVAR(ppeBlackout) = ppEffectCreate ["ColorCorrections", 4220];
    GVAR(ppeBlackout) ppEffectEnable true;
    GVAR(ppeBlackout) ppEffectForceInNVG true;
    GVAR(ppeBlackout) ppEffectAdjust [1,1,0,[0,0,0,1],[0,0,0,0],[1,1,1,1],[10,10,0,0,0,0.1,0.5]];
    GVAR(ppeBlackout) ppEffectCommit 0.4;

    // - GVAR updating and initialization -----------------------------------------
    ["unit", FUNC(handlePlayerChanged), true] call CBA_fnc_addPlayerEventHandler;

    ["visibleMap", {
        params ["", "_visibleMap"]; // command visibleMap is updated one frame later
        private _staminaBarContainer = uiNamespace getVariable [QGVAR(staminaBarContainer), controlNull];
        _staminaBarContainer ctrlShow ((!_visibleMap) && {(vehicle ACE_player) == ACE_player});
    }, true] call CBA_fnc_addPlayerEventHandler;
    ["vehicle", {
        private _staminaBarContainer = uiNamespace getVariable [QGVAR(staminaBarContainer), controlNull];
        _staminaBarContainer ctrlShow ((!visibleMap) && {(vehicle ACE_player) == ACE_player});
    }, true] call CBA_fnc_addPlayerEventHandler;

    // - Duty factors -------------------------------------------------------------
    if (["ACE_Medical"] call EFUNC(common,isModLoaded)) then {
        [QEGVAR(medical,pain), { // 0->1.0, 0.5->1.05, 1->1.1
            linearConversion [0, 1, (_this getVariable [QEGVAR(medical,pain), 0]), 1, 1.1, true];
        }] call FUNC(addDutyFactor);
        [QEGVAR(medical,bloodVolume), { // 6->1.0, 5->1.167, 4->1.33
            linearConversion [6, 0, (_this getVariable [QEGVAR(medical,bloodVolume), 6]), 1, 2, true];
        }] call FUNC(addDutyFactor);
    };
    if (["ACE_Dragging"] call EFUNC(common,isModLoaded)) then {
        [QEGVAR(dragging,isCarrying), {
            [1, 3] select (_this getVariable [QEGVAR(dragging,isCarrying), false]);
        }] call FUNC(addDutyFactor);
    };
    if (["ACE_Weather"] call EFUNC(common,isModLoaded)) then {
        [QEGVAR(weather,temperature), { // 35->1, 45->2
            linearConversion [35, 45, (missionNamespace getVariable [QEGVAR(weather,currentTemperature), 25]), 1, 2, true];
        }] call FUNC(addDutyFactor);
    };

    // - Add main loop at 1 second interval -------------------------------------------------------------
    [FUNC(mainLoop), [], 1] call CBA_fnc_waitAndExecute;
}] call CBA_fnc_addEventHandler;
