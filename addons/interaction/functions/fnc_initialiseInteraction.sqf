/*
	Author:
		commy2
		Garth de Wet (LH)

	Description:
		Initialises the interaction click handlers.

	Parameters:
		0 : CODE - code to call when right clicking/center button
		1 : BOOLEAN - Submenu
		2 : BOOLEAN - Flow Menu
		3 : BOOLEAN - Self interaction
		4 : OBJECT - Target

	Returns:
		Nothing

	Example:
		[{"Default" call FUNC(openMenu);}, true, (profileNamespace getVariable [QGVAR(FlowMenu), false]), GVAR(Target)] call FUNC(initialiseInteraction);
*/
#include "script_component.hpp"

private ["_subMenu", "_selfMenu", "_target"];
GVAR(MainButton) = _this select 0;
_subMenu = _this select 1;
_selfMenu = _this select 3;
_target = _this select 4;

_player = ACE_player;
_vehicle = vehicle _player;
//_object = [GVAR(Target), _player] select (GVAR(MenuType) % 2 == 1);

if !([_target, 5] call FUNC(isInRange)) exitWith {};

GVAR(Shortcuts) = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1];

// Flow menu
if (_this select 2) then {
	(QGVAR(FlowMenu) call BIS_fnc_rscLayer) cutRsc [QGVAR(FlowMenu), "PLAIN",0.5, false];
	ACE_Interaction_SelectedButton = 0;
	(findDisplay 1713999) closeDisplay 1;
	if (_player getVariable ["ACE_AcceptAction", -1] == -1) then {
		[{if(isNil {GVAR(MainButton)} || {!(profileNamespace getVariable [QGVAR(FlowMenu), false])})exitWith{false};(-(_this select 0) / 1.2) call FUNC(MoveDown);true}] call EFUNC(common,addScrollWheelEventHandler);

		_player setVariable ["ACE_AcceptAction", [_player, "DefaultAction", {(!isNil {GVAR(MainButton)}) && {(profileNamespace getVariable [QGVAR(FlowMenu), false])}}, {_action = GVAR(Buttons) select ACE_Interaction_SelectedButton;_target = GVAR(Target);_player = ACE_player;_vehicle = vehicle _player;if ([_target, _player] call (_action select 2)) then {call FUNC(hideMenu);if(count _action == 12) then{(_action select 11) call (_action select 1);}else{[_target, _player] call (_action select 1);};};}] call EFUNC(common,addActionEventHandler)];
		_player setVariable ["ACE_AcceptAction", [_player, "menuBack", {(!isNil {GVAR(MainButton)}) && {(profileNamespace getVariable [QGVAR(FlowMenu), false])}}, {call GVAR(MainButton);}] call EFUNC(common,addActionEventHandler)];
	};
	0 call FUNC(moveDown);
	[localize "STR_ACE_Interaction_MakeSelection", if (_subMenu)then{localize "STR_ACE_Interaction_Back"}else{""}, localize "STR_ACE_Interaction_ScrollHint"] call FUNC(showMouseHint);
	((uiNamespace getVariable QGVAR(Flow_Display)) displayCtrl (1210)) ctrlShow _subMenu;
}else{ // Rose
	if (!isNull(uiNamespace getVariable QGVAR(Flow_Display))) then {
		(uiNameSpace getVariable QGVAR(Flow_Display)) closeDisplay 0;
		call FUNC(hideMouseHint);
	};
	if (!_subMenu || {isNull (findDisplay 1713999)}) then {
		(findDisplay 1713999) closeDisplay 1;

		(findDisplay 46) createDisplay QGVAR(Dialog);
		// Add eventhandlers
		(findDisplay 1713999) displayAddEventHandler ["KeyDown", QUOTE(_this call EGVAR(common,onKeyDown))];
		(findDisplay 1713999) displayAddEventHandler ["KeyUp", QUOTE(_this call EGVAR(common,onKeyUp))];

		(findDisplay 1713999) displayAddEventHandler ["KeyDown", QUOTE(_this call FUNC(menuKeyInput))];
	};
	disableSerialization;
	_dlgInteractionDialog = uiNamespace getVariable QGVAR(Dialog);
	_ctrlInteractionDialog = _dlgInteractionDialog displayCtrl 3;
	if (profileNamespace getVariable [QGVAR(AutoCenterCursor), true]) then {setMousePosition [0.5, 0.5]};
	if !(_subMenu) then {
		_ctrlInteractionDialog ctrlSetText ([_target] call EFUNC(common,getName));
	} else {
		_ctrlInteractionDialog ctrlSetText localize "STR_ACE_Interaction_Back";
	};

	_buttons = GVAR(Buttons);
	_count = count _buttons;

	for "_i" from 0 to 9 do {
		_ctrlInteractionDialog = _dlgInteractionDialog displayCtrl (10 + _i);
		_ctrlInteractionDialog ctrlShow true;

		_ctrlInteractionDialogIcon = _dlgInteractionDialog displayCtrl (20 + _i);
		_ctrlInteractionDialogShortcut = _dlgInteractionDialog displayCtrl (30 + _i);
		//_ctrlInteractionDialogBackground = _dlgInteractionDialog displayCtrl (40 + _i);
		if (_i < _count) then {
			_action = _buttons select _i;
			_ctrlInteractionDialog ctrlSetText (_action select 0);
			_ctrlInteractionDialog ctrlEnable ([_target, _player] call (_action select 2));
			_ctrlInteractionDialog ctrlSetTooltip (_action select 6);

			_ctrlInteractionDialogIcon ctrlSetText (_action select 5);
			_ctrlInteractionDialogShortcut ctrlSetText (_action select 10);
			//_ctrlInteractionDialogBackground ctrlShow true;

			GVAR(Shortcuts) set [_i, [_action select 10] call EFUNC(common,letterToCode)];
		} else {
			_ctrlInteractionDialog ctrlSetText "";
			_ctrlInteractionDialog ctrlEnable false;
			_ctrlInteractionDialog ctrlSetTooltip "";

			_ctrlInteractionDialogIcon ctrlSetText "";
			_ctrlInteractionDialogShortcut ctrlSetText "";
			//_ctrlInteractionDialogBackground ctrlShow false;
		};
	};

	// Update Buttons
	terminate (missionNamespace getVariable [QGVAR(updateMenuHandle), scriptNull]);

	GVAR(updateMenuHandle) = 0 spawn {
		disableSerialization;
		_dlgMenu = uiNamespace getVariable [QGVAR(Dialog), displayNull];
		_ctrlTooltip = _dlgMenu displayCtrl 40;

		_player = ACE_player;
		_vehicle = vehicle _player;
		_target = [GVAR(Target), _player] select (GVAR(MenuType) % 2 == 1);

		waitUntil {
			if !([_target, 5] call FUNC(isInRange)) exitWith {
				(findDisplay 1713999) closeDisplay 1
			};

			GVAR(Tooltips) = [[], [], [], [], [], [], [], [], [], []];
			{
				_ctrlText = _dlgMenu displayCtrl (10 + _forEachIndex);
				_ctrlIcon = _dlgMenu displayCtrl (20 + _forEachIndex);

				_condition = _x select 2;
				_conditionShow = _x select 7;
				_distance = _x select 9;

				GVAR(CurrentTooltip) = [];

				_enable = (_distance == 0 || {[_target, _distance] call FUNC(isInRange)}) && {[_target, _player] call _condition} && {[_target, _player] call _conditionShow};
				if (isNil "_enable") then {_enable = false};

				GVAR(Tooltips) set [_forEachIndex, GVAR(CurrentTooltip)];

				// apply conditional tooltips
				/*if (_forEachIndex == call ACE_Interaction_fnc_getSelectedButton) then {
					_tooltip = _x select 6;

					_showTooltip = _tooltip != "";

					_tooltip = text _tooltip;

					{
						_showTooltip = true;
						_tooltip = composeText [_tooltip, lineBreak, _x];
					} forEach (GVAR(Tooltips) select _forEachIndex);

					_ctrlTooltip ctrlSetStructuredText _tooltip;
					_ctrlTooltip ctrlShow _showTooltip;
				};*/

				_ctrlText ctrlEnable _enable;
				_ctrlIcon ctrlEnable _enable;
			} forEach GVAR(Buttons);

			sleep 0.5;
			isNull (findDisplay 1713999)
		};
	};
};
