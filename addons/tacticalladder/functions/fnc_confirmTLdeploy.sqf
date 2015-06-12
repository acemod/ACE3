#include "script_component.hpp"

PARAMS_4(_target,_caller,_index,_ladder);

private ["_pos1", "_pos2"];
_pos1 = getPosASL GVAR(ladder);
_pos2 = (GVAR(ladder) modelToWorld (GVAR(ladder) selectionPosition "check2")) call EFUNC(common,positionToASL);
if (lineIntersects [_pos1, _pos2, GVAR(ladder)]) exitWith {};

_target removeAction _index;
detach _ladder;

_target removeAction (_target getVariable QGVAR(TLdropAction));
call FUNC(ladderKey_remove);
