#include "script_component.hpp"

_onActionId = player getVariable[QGVAR(onActionId), -1];
_offActionId = player getVariable[QGVAR(offActionId), -1];

player removeAction _onActionId;
player removeAction _offActionId;

player setVariable[QGVAR(onActionId), -1, false];
player setVariable[QGVAR(offActionId), -1, false];