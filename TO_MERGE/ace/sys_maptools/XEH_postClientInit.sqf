#include "script_component.hpp"

/*
 * Get Key Configs
 */

if (!GVAR(Enabled)) exitwith {};

[QGVAR(data), {_this call FUNC(handleData)}] call ACE_fnc_addReceiverOnlyEventhandler;
[QGVAR(execcopy), {_this spawn FUNC(beginCopy)}] call ACE_fnc_addReceiverOnlyEventhandler;

FUNC(beginCopy) = {
	private ["_complete", "_sendCount", "_count", "_line"];
	PARAMS_2(_target,_copier);
	_complete       = true;

	_sendCount = (count GVAR(RulerLines));
	if (_target == player) then {
		[QGVAR(data), [_copier, _sendCount]] call ACE_fnc_receiverOnlyEvent;
		_count = 0;
		{
			_line = _x;
			if !(isNil "_x") then {
				if ((_copier distance player) > 1.5) exitWith {
					_complete = false;
				};
				[QGVAR(data), [_copier, _x]] call ACE_fnc_receiverOnlyEvent;
				sleep .25;
			};
			_count = _count + 1;
			if (_count > _sendCount) exitWith {
				_complete = true;
			};
		} forEach(GVAR(RulerLines));
		[QGVAR(data), [_copier, _complete]] call ACE_fnc_receiverOnlyEvent;
	};
};

_this spawn {
    while {true} do {
        if (scriptDone GVAR(IconScalerPID)) then {
            waitUntil {sleep 1; !isNull (findDisplay 12)};
            ((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["MouseButtonClick", '[_this] call FUNC(ClickHandler)'];
            ((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["KeyDown", '[_this, true] call FUNC(KeyBoardHandler)'];
            ((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["KeyUp", '[_this, false] call FUNC(KeyBoardHandler)'];
            ((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["mouseButtonDown", '[_this, true] call FUNC(MouseHandler)'];
            ((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["mouseButtonUp", '[_this, false] call FUNC(MouseHandler)'];
            ((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["mouseMoving", '_this call FUNC(DragHandler)'];

            GVAR(IconScalerPID) = [_this] spawn FUNC(IconScaler);
        };
        sleep 2;
    };
};
