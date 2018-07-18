#define DEBUG_MODE_FULL
#include "script_component.hpp"

if (!hasInterface) exitWith {};

[missionNamespace, "ACE_setCustomAimCoef", QUOTE(ADDON), {
    private _pain = GET_PAIN_PERCEIVED(ACE_player);

    linearConversion [0, 1, _pain, 1, 5, true];
}] call EFUNC(common,arithmeticSetSource);

#ifdef DEBUG_MODE_FULL
    [] call FUNC(dev_watchMedicalStats);

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
                drawIcon3D ["", [0.6, 0, 0, 1], cursorTarget modelToWorldVisual (cursorTarget selectionPosition "pelvis"), 0, 0, 0, format ["State: %1", _targetState], 2, 40 * pixelH, "RobotoCondensed"];
            };
        }, 0 ,[]] call CBA_fnc_addPerFrameHandler;
    }, []] call CBA_fnc_waitUntilAndExecute;
#endif
