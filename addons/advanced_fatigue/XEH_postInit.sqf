#include "script_component.hpp"
if (!hasInterface) exitWith {};

["playerChanged", {
    params ["_newUnit", "_oldUnit"];

    if !(isNull _oldUnit) then {
        _oldUnit enableStamina true;
        _oldUnit removeEventHandler ["AnimChanged", GVAR(animHandler)];
    };

    _newUnit enableStamina false;
    GVAR(animDuty) = [_newUnit, animationState _newUnit] call FUNC(getAnimDuty);
    GVAR(animHandler) = _newUnit addEventHandler ["AnimChanged", {
        GVAR(animDuty) = _this call FUNC(getAnimDuty);
    }];
}] call ace_common_fnc_addEventHandler;

GVAR(ppeBlackout) = ppEffectCreate ["ColorCorrections", 4220];
GVAR(ppeBlackout) ppEffectEnable true;
GVAR(ppeBlackout) ppEffectForceInNVG true;
GVAR(ppeBlackout) ppEffectAdjust [1,1,0,[0,0,0,1],[0,0,0,0],[1,1,1,1],[10,10,0,0,0,0.1,0.5]];
GVAR(ppeBlackout) ppEffectCommit 0.4;

GVAR(ppeBlackoutLast) = 100;
GVAR(lastBreath) = 0;

[FUNC(pfhMain), 1, []] call CBA_fnc_addPerFrameHandler;
