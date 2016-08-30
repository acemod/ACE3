#include "script_component.hpp"
if (!hasInterface || {!GVAR(enabled)}) exitWith {};

GVAR(ppeBlackout) = ppEffectCreate ["ColorCorrections", 4220];
GVAR(ppeBlackout) ppEffectEnable true;
GVAR(ppeBlackout) ppEffectForceInNVG true;
GVAR(ppeBlackout) ppEffectAdjust [1,1,0,[0,0,0,1],[0,0,0,0],[1,1,1,1],[10,10,0,0,0,0.1,0.5]];
GVAR(ppeBlackout) ppEffectCommit 0.4;

if !(isNull ACE_player) then {
    [ACE_player, objNull] call FUNC(handlePlayerChanged);
};
["unit", FUNC(handlePlayerChanged)] call CBA_fnc_addPlayerEventHandler;

[FUNC(pfhMain), 1, []] call CBA_fnc_addPerFrameHandler;
