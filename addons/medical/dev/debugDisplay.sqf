#include "\z\ace\addons\medical\script_component.hpp"

[{!isNull findDisplay 46}, {
    INFO("Creating Debug Display");
    if (!isNull (uiNamespace getVariable [QGVAR(debugControl), controlNull])) then {
        ctrlDelete (uiNamespace getVariable [QGVAR(debugControl), controlNull]); // cleanup on SP Restart
    };
    private _ctrl = findDisplay 46 ctrlCreate ["RscText", -1];
    _ctrl ctrlSetPosition [
        safeZoneX,
        safeZoneY,
        safeZoneW,
        40 * pixelH
    ];
    _ctrl ctrlSetFontHeight (40 * pixelH);
    _ctrl ctrlSetTextColor [0.6, 0, 0, 1];
    _ctrl ctrlCommit 0;
    uiNamespace setVariable [QGVAR(debugControl), _ctrl];

    [{
        private _playerState = [ACE_player, EGVAR(medical,STATE_MACHINE)] call CBA_statemachine_fnc_getCurrentState;
        (uiNamespace getVariable [QGVAR(debugControl), controlNull]) ctrlSetText format ["Player state: %1", _playerState];

        if (!isNull cursorTarget && {cursorTarget isKindOf "CAManBase"}) then {
            private _targetState = [cursorTarget, EGVAR(medical,STATE_MACHINE)] call CBA_statemachine_fnc_getCurrentState;
            private _targetStateAI = "";
            if (!isNil QEGVAR(medical_ai,stateMachine)) then {
                _targetStateAI = [cursorTarget, EGVAR(medical_ai,stateMachine)] call CBA_statemachine_fnc_getCurrentState;
            };
            drawIcon3D ["", [0.6, 0, 0, 1], cursorTarget modelToWorldVisual (cursorTarget selectionPosition "pelvis"), 0, 0, 0, format ["State: %1 / %2", _targetState,_targetStateAI], 2, 40 * pixelH, "RobotoCondensed"];
        };
    }, 0 ,[]] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;
