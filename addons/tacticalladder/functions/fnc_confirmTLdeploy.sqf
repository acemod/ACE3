// #define DEBUG_MODE_FULL
#include "script_component.hpp"

PARAMS_4(_target,_caller,_index,_ladder);

_fnc_collide = {
	_pos1 = getPosASL GVAR(ladder);
	_pos2 = ATLtoASL(GVAR(ladder) modelToWorld (GVAR(ladder) selectionPosition "check2"));
	lineIntersects [_pos1, _pos2, GVAR(ladder)]
};

if (call _fnc_collide) exitWith {};

_target removeAction _index;
detach _ladder;
_ladder setVariable [QGVAR(inUse),false,true]; // No longer In Use!

_target removeAction (_target getVariable QGVAR(TLdropAction));
call FUNC(ladderKey_remove);