#include "script_component.hpp"

if (!hasInterface) exitWith {};

#ifdef DEBUG_MODE_FULL
addMissionEventHandler ["Draw3D", {
    private _normal = surfaceNormal (getPosWorld ACE_player);
    private _beg = (getPosWorld ACE_player) vectorAdd (_normal vectorMultiply 0.5);
    private _end = _beg vectorAdd (_normal vectorMultiply 2);
    drawLine3D [ASLToATL _beg, ASLToATL _end, [0, 1, 0, 1]];

    private _side = vectorNormalized (_normal vectorCrossProduct [0, 0, 1]);
    private _end = _beg vectorAdd (_side vectorMultiply 2);
    drawLine3D [ASLToATL _beg, ASLToATL _end, [0, 0, 1, 1]];

    private _up = vectorNormalized (_normal vectorCrossProduct _side);
    private _end = _beg vectorAdd (_up vectorMultiply 2);
    drawLine3D [ASLToATL _beg, ASLToATL _end, [1, 0, 0, 1]];

    private _movementVector = vectorNormalized (velocity ACE_player);
    private _end = _beg vectorAdd (_movementVector vectorMultiply 2);
    drawLine3D [ASLToATL _beg, ASLToATL _end, [1, 1, 0, 1]];

    private _sideVector = vectorNormalized (_movementVector vectorCrossProduct _normal);
    _sideVector set [2, 0];
    private _end = _beg vectorAdd (_sideVector vectorMultiply 2);
    drawLine3D [ASLToATL _beg, ASLToATL _end, [0, 1, 1, 1]];
}];
#endif

["baseline", {
    private _fatigue = ACE_player getVariable [QGVAR(aimFatigue), 0];
    switch (stance ACE_player) do {
        case ("CROUCH"): {
            (1.0 + _fatigue ^ 2 * 0.1)
        };
        case ("PRONE"): {
            (1.0 + _fatigue ^ 2 * 2.0)
        };
        default {
            (1.5 + _fatigue ^ 2 * 3.0)
        };
    };
}, QUOTE(ADDON)] call EFUNC(common,addSwayFactor);

["multiplier", {
    switch (true) do {
        case (isWeaponRested ACE_player): {
            GVAR(swayFactor) * GVAR(restedSwayFactor)
        };
        case (isWeaponDeployed ACE_player): {
            GVAR(swayFactor) * GVAR(deployedSwayFactor)
        };
        default {
            GVAR(swayFactor)
        };
    };
}, QUOTE(ADDON)] call EFUNC(common,addSwayFactor);

// recheck weapon inertia after weapon swap, change of attachments or switching unit
["weapon", {[ACE_player] call FUNC(getWeaponInertia)}, true] call CBA_fnc_addPlayerEventHandler;
["loadout", {[ACE_player] call FUNC(getWeaponInertia)}, true] call CBA_fnc_addPlayerEventHandler;
["unit", {[ACE_player] call FUNC(getWeaponInertia)}, true] call CBA_fnc_addPlayerEventHandler;

["CBA_settingsInitialized", {
    if (!GVAR(enabled)) exitWith {};

    // - Post process effect ------------------------------------------------------
    GVAR(ppeBlackout) = ppEffectCreate ["ColorCorrections", 4220];
    GVAR(ppeBlackout) ppEffectEnable true;
    GVAR(ppeBlackout) ppEffectForceInNVG true;
    GVAR(ppeBlackout) ppEffectAdjust [1,1,0,[0,0,0,1],[0,0,0,0],[1,1,1,1],[10,10,0,0,0,0.1,0.5]];
    GVAR(ppeBlackout) ppEffectCommit 0.4;

    // - GVAR updating and initialization -----------------------------------------
    ["unit", LINKFUNC(handlePlayerChanged), true] call CBA_fnc_addPlayerEventHandler;

    ["visibleMap", {
        params ["", "_visibleMap"]; // command visibleMap is updated one frame later
        (uiNamespace getVariable [QGVAR(staminaBarContainer), controlNull]) ctrlShow (!_visibleMap && isNull objectParent ACE_player);
    }, true] call CBA_fnc_addPlayerEventHandler;
    ["vehicle", {
        (uiNamespace getVariable [QGVAR(staminaBarContainer), controlNull]) ctrlShow (!visibleMap && isNull objectParent ACE_player);
    }, true] call CBA_fnc_addPlayerEventHandler;

    // - Duty factors -------------------------------------------------------------
    if (["ace_medical"] call EFUNC(common,isModLoaded)) then {
        [QEGVAR(medical,pain), { // 0->1.0, 0.5->1.05, 1->1.1
            linearConversion [0, 1, _this getVariable [QEGVAR(medical,pain), 0], 1, 1.1, true];
        }] call FUNC(addDutyFactor);
        [QEGVAR(medical,bloodVolume), { // 6->1.0, 5->1.167, 4->1.33
            linearConversion [6, 0, _this getVariable [QEGVAR(medical,bloodVolume), 6], 1, 2, true];
        }] call FUNC(addDutyFactor);
    };
    if (["ace_dragging"] call EFUNC(common,isModLoaded)) then {
        [QEGVAR(dragging,isCarrying), {
            [1, 3] select (_this getVariable [QEGVAR(dragging,isCarrying), false]);
        }] call FUNC(addDutyFactor);
    };
    // Weather has an off switch, Dragging & Medical don't.
    if (missionNamespace getVariable [QEGVAR(weather,enabled), false]) then {
        [QEGVAR(weather,temperature), { // 35->1, 45->2
            linearConversion [35, 45, missionNamespace getVariable [QEGVAR(weather,currentTemperature), 25], 1, 2, true];
        }] call FUNC(addDutyFactor);
    };

    // - Add main loop at 1 second interval -------------------------------------------------------------
    [FUNC(mainLoop), [], 1] call CBA_fnc_waitAndExecute;
}] call CBA_fnc_addEventHandler;
