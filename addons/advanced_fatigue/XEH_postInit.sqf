#include "script_component.hpp"
if (!hasInterface) exitWith {};

#ifdef DEBUG_MODE_FULL
onEachFrame {
    private _normal = surfaceNormal (getPosWorld ACE_player);
    private _beg = (getPosWorld ACE_player) vectorAdd (_normal vectorMultiply 0.5);
    private _end = _beg vectorAdd (_normal vectorMultiply 2.0);
    drawLine3D [ASLToATL _beg, ASLToATL _end, [0,1,0,1]];

    private _side = vectorNormalized (_normal vectorCrossProduct [0, 0, 1]);
    private _end = _beg vectorAdd (_side vectorMultiply 2.0);
    drawLine3D [ASLToATL _beg, ASLToATL _end, [0,0,1,1]];

    private _up = vectorNormalized (_normal vectorCrossProduct _side);
    private _end = _beg vectorAdd (_up vectorMultiply 2.0);
    drawLine3D [ASLToATL _beg, ASLToATL _end, [1,0,0,1]];

    private _movementVector = vectorNormalized (velocity ACE_player);
    private _end = _beg vectorAdd (_movementVector vectorMultiply 2.0);
    drawLine3D [ASLToATL _beg, ASLToATL _end, [1,1,0,1]];

    private _sideVector = vectorNormalized (_movementVector vectorCrossProduct _normal);
    _sideVector set[2, 0];
    private _end = _beg vectorAdd (_sideVector vectorMultiply 2.0);
    drawLine3D [ASLToATL _beg, ASLToATL _end, [0,1,1,1]];
};
#endif

["ace_settingsInitialized", {
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
        [QEGVAR(medical,bloodVolume), { // 100->1.0, 90->1.1, 80->1.2
            linearConversion [100, 0, (_this getVariable [QEGVAR(medical,bloodVolume), 100]), 1, 2, true];
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

["ace_settingChanged", {
    params ["_name", "_value"];

    if (_name == QGVAR(enableStaminaBar) && {!_value}) then {
        private _staminaBarContainer = uiNamespace getVariable [QGVAR(staminaBarContainer), controlNull];
        _staminaBarContainer ctrlSetFade 1;
        _staminaBarContainer ctrlCommit 0;
    };
}] call CBA_fnc_addEventHandler;
