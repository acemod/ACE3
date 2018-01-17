#include "script_component.hpp"
if (!hasInterface) exitWith {};

["ace_settingsInitialized", {
    if (!GVAR(enabled)) exitWith {};

    // - Post process effect ------------------------------------------------------
    GVAR(ppeBlackout) = ppEffectCreate ["ColorCorrections", 4220];
    GVAR(ppeBlackout) ppEffectEnable true;
    GVAR(ppeBlackout) ppEffectForceInNVG true;
    GVAR(ppeBlackout) ppEffectAdjust [1,1,0,[0,0,0,1],[0,0,0,0],[1,1,1,1],[10,10,0,0,0,0.1,0.5]];
    GVAR(ppeBlackout) ppEffectCommit 0.4;

    // - GVAR updating and initialization -----------------------------------------
    if !(isNull ACE_player) then {
        [ACE_player, objNull] call FUNC(handlePlayerChanged);
    };
    ["unit", FUNC(handlePlayerChanged)] call CBA_fnc_addPlayerEventHandler;

    // - Duty factors -------------------------------------------------------------
    [QEGVAR(medical,pain), {
        1 + (((_this getVariable [QEGVAR(medical,pain), 0]) min 1) / 10)
    }] call FUNC(addDutyFactor);
    [QEGVAR(medical,bloodVolume), {
        2 - (((_this getVariable [QEGVAR(medical,bloodVolume), 100]) min 100) / 100)
    }] call FUNC(addDutyFactor);
    [QEGVAR(dragging,isCarrying), {
        if (_this getVariable [QEGVAR(dragging,isCarrying), false]) then {
            3
        } else {
            1
        };
    }] call FUNC(addDutyFactor);
    [QEGVAR(weather,temperature), {
        (((missionNamespace getVariable [QEGVAR(weather,currentTemperature), 25]) - 35) / 10) max 2 min 1
    }] call FUNC(addDutyFactor);

    // - Add main PFH -------------------------------------------------------------
    [FUNC(pfhMain), 1, []] call CBA_fnc_addPerFrameHandler;
}] call CBA_fnc_addEventHandler;

["ace_settingChanged", {
    params ["_name", "_value"];

    if (_name == QGVAR(enableStaminaBar) && {!_value}) then {
        private _staminaBarContainer = uiNamespace getVariable [QGVAR(staminaBarContainer), controlNull];
        _staminaBarContainer ctrlSetFade 1;
        _staminaBarContainer ctrlCommit 0;
    };
}] call CBA_fnc_addEventHandler;
