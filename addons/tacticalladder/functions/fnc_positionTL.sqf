#include "script_component.hpp"

#define __ANIMS ["extract_1","extract_2","extract_3","extract_4","extract_5","extract_6","extract_7","extract_8","extract_9","extract_10","extract_11"]

PARAMS_2(_ladder,_unit);

{
    _ladder animate [_x, 0];
} forEach __ANIMS;

_unit switchMove "amovpercmstpslowwrfldnon_player_idlesteady03";
_ladder attachTo [_unit, [0, 0.75, 0], ""]; // Position ladder in front of player

_ladder animate ["rotate", 0];
{
    _ladder animate [_x, 1];
} forEach ["extract_1", "extract_2", "extract_3"]; // Extract ladder at head height (extract_3)

GVAR(ladder) = _ladder;
GVAR(currentStep) = 3;
GVAR(currentAngle) = 0;

call FUNC(ladderKey_add);

_action_drop = _unit addAction [localize "STR_ACE_DROP_TACLADDER", { call FUNC(cancelTLdeploy); }, _ladder];
_action_deploy = _unit addAction [localize "STR_ACE_DEPLOY_TACLADDER", { call FUNC(confirmTLdeploy); }, _ladder];

_unit setVariable [QGVAR(TLdeployAction), _action_deploy];
_unit setVariable [QGVAR(TLdropAction), _action_drop];
