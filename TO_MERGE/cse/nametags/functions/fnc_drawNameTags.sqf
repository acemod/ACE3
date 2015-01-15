/**
 * fn_drawNameTags_TAGS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */
#include "script_component.hpp"
#define FONT 	"EtelkaMonospacePro"

private ["_cursor","_soundWaves", "_nameOfUnit","_pos","_color", "_nearbyUnits", "_iconOptions", "_iconSets", "_unit", "_colorOfIcon", "_nearObj"];
if (visibleMap || !GVAR(DRAW_TAG_ICONS)) exitwith {};

_nearObj = if (isNull curatorCamera) then {ACE_player} else {curatorCamera};

if (GVAR(ENABLE_INDIRECT)) then {
	{
		_nameOfUnit = _x select 0;
		_pos = _x select 1;
		_color = _x select 2;
		_unit = _x select 3;
		_iconDrawn = QUOTE(PATHTOF(data\empty.paa));
		if (_unit getvariable [QGVAR(isSpeaking),false] && GVAR(SHOW_SOUNDWAVES)) then {
			_iconDrawn = (GVAR(SOUNDWAVE_ICONS) select ((round(random (count GVAR(SOUNDWAVE_ICONS) - 1)))));
		};
		 drawIcon3D [_iconDrawn,_color, _pos, 2, 2, 1 ,toUpper _nameOfUnit, 1, 0.03, FONT];
		false;
	}count (_nearObj call FUNC(findNearbyUnits));
};

_cursor = cursortarget;
if (_cursor == _cursor && isTouchingGround _cursor) then {
	if (_cursor isKindOf "CAManBase" && ((_cursor distance _nearObj) < GVAR(DIRECT_TAG_DISTANCE)) && ((side _cursor) call FUNC(allowSide))) then {

		// TODO Improve this switch statement
		_pos = visiblePositionASL _cursor;
		switch (stance _cursor) do {
			case "STAND": {
				_pos set [2, ((_cursor modelToWorld [0,0,0]) select 2)+2];
			};
			case "CROUCH": {
				_pos set [2, ((_cursor modelToWorld [0,0,0]) select 2)+1.5];
			};
			case "PRONE": {
				_pos set [2, ((_cursor modelToWorld [0,0,0]) select 2)+0.5];
			};
			default {
				_pos set [2, ((_cursor modelToWorld [0,0,0]) select 2) + 1.5];
			};
		};
		_color = +GVAR(TAG_DISPLAY_COLOR);

		_nameOfUnit = [_cursor] call EFUNC(common,getName);

		if (missionnamespace getvariable [QEGVAR(medical,isEnabled), false]) then {
			_status = [_cursor] call FUNC(getTriageStatus_CMS);
			if ((_status select 1) >0) then {
				_nameOfUnit = _nameOfUnit  + " ["+ (_status select 0) + "]";
			};
		};

		_iconDrawn = QUOTE(PATHTOF(data\empty.paa));
		if (_unit getvariable [QGVAR(isSpeaking),false] && GVAR(SHOW_SOUNDWAVES)) then {
			_iconDrawn = (GVAR(SOUNDWAVE_ICONS) select ((round(random (count GVAR(SOUNDWAVE_ICONS) - 1)))));
		};
		 drawIcon3D [_iconDrawn,_color, _pos, 2, 2, 1 ,toUpper _nameOfUnit, 1, 0.03, FONT];

	};
};
