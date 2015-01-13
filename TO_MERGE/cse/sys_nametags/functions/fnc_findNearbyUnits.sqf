/**
 * fn_findNearbyUnits_TAGS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

private ["_info", "_nameOfUnit", "_color", "_isTalking", "_pos", "_nearest"];
_info = [];
if (alive player) then {
	_nearest = (_this nearEntities [["CAManBase"], GVAR(INDIRECT_TAGS_DISTANCE)]);
	{
		if (_x != _this && (vehicle _x == _x) && isTouchingGround _X) then {
			if (lineIntersects [eyePos _this, eyePos _x, _x, _this]) exitwith{};
			if ((side _x) call FUNC(allowSide) && !(_x == cursortarget)) then {
				_nameOfUnit = name _x;
				if (_x getvariable ["ACE_isDead",false]) then { // TODO, how do we check for dead units?
					_nameOfUnit = _unit getvariable ["ACE_name","Unknown"]; // TODO is there are function to get the name of a unit?
				};
				_pos = visiblePositionASL _x;

				// TODO This can be done better
				switch (stance _x) do {
					case "STAND": {
						_pos set [2, ((_x modelToWorld [0,0,0]) select 2)+2];
					};
					case "CROUCH": {
						_pos set [2, ((_x modelToWorld [0,0,0]) select 2)+1.5];
					};
					case "PRONE": {
						_pos set [2, ((_x modelToWorld [0,0,0]) select 2) + 0.5];
					};
					default {
						_pos set [2, ((_x modelToWorld [0,0,0]) select 2) + 1.5];
					};
				};

				_color = +GVAR(TAG_DISPLAY_COLOR);
				_color set [3, 0];
				_isTalking = (_x getvariable [QGVAR(isSpeaking),false]);

				// TODO implement module checking
				/*if (ACE_NameTags_SYS_MEDICAL_SYSTEM_ENABLED_TAGS) then {
					_status = [_x] call FUNC(getTriageStatus_CMS;
					if ((_status select 1) >0) then {
						_nameOfUnit = _nameOfUnit  + " ["+ (_status select 0) + "]";
						_color = _status select 2;
					};
				};*/
				if (GVAR(DISPLAY_RANK)) then {
					_nameOfUnit = (rank _x) + " " + _nameOfUnit;
				};
				_color set [3,(1-((_x distance _this) / GVAR(INDIRECT_TAGS_DISTANCE))) + 0.05];
				_info pushback [_nameOfUnit, _pos, _color, _x];
			};
		};
	}foreach _nearest;
};

_info;