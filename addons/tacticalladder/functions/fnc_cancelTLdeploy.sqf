// #define DEBUG_MODE_FULL
#include "script_component.hpp"

#define __ANIMS ["extract_1","extract_2","extract_3","extract_4","extract_5","extract_6","extract_7","extract_8","extract_9","extract_10","extract_11"]

PARAMS_4(_target,_caller,_index,_ladder);

_target removeAction _index;
detach _ladder;
_ladder animate ["rotate", 0];
{
    _ladder animate [_x, 0];
} forEach __ANIMS;

_target removeAction (_target getVariable QGVAR(TLdeployAction));
call FUNC(ladderKey_remove);
