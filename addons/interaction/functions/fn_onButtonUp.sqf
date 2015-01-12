// by commy2
#include "script_component.hpp"

private ["_player", "_vehicle", "_target", "_count", "_index", "_action", "_statement", "_condition", "_conditionShow", "_exceptions", "_distance"];

_player = ACE_player;
_vehicle = vehicle _player;
_target = [GVAR(Target), _player] select (GVAR(MenuType) % 2 == 1);

_count = count GVAR(Buttons);
_index = call FUNC(getSelectedButton);

_action = if (_index != -1 && {_index < _count}) then {
	GVAR(Buttons) select _index
} else {
	["", {}, {false}, 0, [], "", "", {false}, [], 0]
};

(findDisplay 1713999) closeDisplay 1;
closeDialog 0;



_statement = _action select 1;
_condition = _action select 2;
_conditionShow = _action select 7;
_exceptions = _action select 8;//
_distance = _action select 9;

if ((_distance == 0 || {[GVAR(Target), _distance] call FUNC(isInRange)}) && {[_target, _player] call _condition} && {[_target, _player] call _conditionShow}) then {
	[_target, _player] call _statement;
};
