//fnc_render.sqf
#include "script_component.hpp"

private ["_cursorPos1", "_cursorPos2", "_cursorVec", "_p1", "_p2", "_p", "_v", "_cp", "_forEachIndex", "_renderTargets", "_x", "_cursorScreenPos", "_closestDistance", "_closestSelection", "_pos", "_sPos", "_disSq", "_closest", "_cTime", "_delta", "_foundTarget", "_misMatch", "_hoverPath", "_i"];
_foundTarget = false;
_cursorPos1 = positionCameraToWorld [0, 0, 0];
_cursorPos2 = positionCameraToWorld [0, 0, 2];
GVAR(currentOptions) = [];
if((count GVAR(toRender)) > 0 && (GVAR(keyDown) || GVAR(keyDownSelfAction))) then {
	if((count GVAR(vecLineMap)) == 0 || ((count GVAR(menuDepthPath)) > 0 && (getPosASL player) distance GVAR(lastPos) > 0.01)) then {
		GVAR(lastPos) = getPosASL player;
		_cursorVec = [_cursorPos2, _cursorPos1] call BIS_fnc_vectorFromXtoY;
		_p1 = [0,0,0];
		_p2 = +_cursorVec;
		_p = (_cursorVec call CBA_fnc_vect2polar);
		_v = [(_p select 0), (_p select 1), (_p select 2)+90] call CBA_fnc_polar2vect;
		_cp = [_cursorVec, _v] call BIS_fnc_crossProduct;

		GVAR(vecLineMap) = [_cp, _p1, _p2] call FUNC(rotateVectLineGetMap);
	};
	if (GVAR(keyDown)) then {
		// Render all nearby interaction menus
		{
			if(!(_forEachIndex in GVAR(filter))) then {
				GVAR(renderDepth) = 0;
				_renderTargets = _x;
				{
					[_renderTargets select 0, _x, 0] call FUNC(renderMenu);
				} forEach (_renderTargets select 1);
			};
		} forEach GVAR(toRender);
	} else {
		// Render only the self action menu
		_actions = (ACE_player getVariable QGVAR(selfActionData)) select 0;
		_pos = (ACE_player modelToWorld (ACE_player selectionPosition "spine3")) vectorAdd GVAR(selfMenuOffset);
		[ACE_player, _actions, 0, _pos] call FUNC(renderMenu);
	};

	// player sideChat format["c: %1", count GVAR(toRender)];
};

if(GVAR(keyDown) || GVAR(keyDownSelfAction)) then {

	_cursorScreenPos = worldToScreen _cursorPos2;
	_closestDistance = 1000000;
	_closestSelection = -1;
	{
		_pos = _x select 1;
		_sPos = worldToScreen _pos;
		if(count _sPos > 0) then {
			_disSq = (((_cursorScreenPos select 0) - (_sPos select 0))^2 + ((_cursorScreenPos select 1) - (_sPos select 1))^2);
			if(_disSq < 0.0125 && _disSq < _closestDistance) then {
				_closestDistance = _disSq;
				_closestSelection = _forEachIndex;
			};
		};
	} forEach GVAR(currentOptions);

	if(_closestSelection != -1) then {

		_closest = GVAR(currentOptions) select _closestSelection;

		_pos = _closest select 1;
		_cTime = diag_tickTime;
		_delta = _cTime - GVAR(lastTime);
		GVAR(lastTime) = _cTime;
		GVAR(rotationAngle) = GVAR(rotationAngle) + (180*_delta);
		if(GVAR(rotationAngle) > 360) then {
			GVAR(rotationAngle) = GVAR(rotationAngle) - 360;
		};
		drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [1,0,0,.75], _pos, 0.6*SafeZoneW, 0.6*SafeZoneW, GVAR(rotationAngle), "", 0.5, 0.025, "TahomaB"];
		_foundTarget = true;
		GVAR(actionSelected) = true;
		GVAR(selectedTarget) = (_closest select 0) select 0;
		GVAR(selectedAction) = ((_closest select 0) select 1) select 3;
		_misMatch = false;
		_hoverPath = (_closest select 2);
		if((count GVAR(lastPath)) != (count _hoverPath)) then {
			_misMatch = true;
		} else {
			{
				if(_x != (_hoverPath select _forEachIndex)) exitWith {
					_misMatch = true;
				};
			} forEach GVAR(lastPath);
		};

		if(_misMatch) then {
			GVAR(lastPath) = _hoverPath;
			GVAR(startHoverTime) = diag_tickTime;
			GVAR(expanded) = false;
		} else {
			if(!GVAR(expanded) && diag_tickTime-GVAR(startHoverTime) > 0.25) then {
				GVAR(expanded) = true;
				GVAR(menuDepthPath) = +GVAR(lastPath);
			};
		};
	};
	drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selected_ca.paa", [1,0,0,1], _cursorPos2, 1, 1, 0, "", 0.5, 0.025, "TahomaB"];
};
if(!_foundTarget && GVAR(actionSelected)) then {
	GVAR(actionSelected) = false;
	GVAR(expanded) = false;
	GVAR(lastPath) = [];
	if(!GVAR(keyDown)) then {
		GVAR(vecLineMap) = [];
	};
};
for "_i" from GVAR(iconCount) to (count GVAR(iconCtrls))-1 do {
	ctrlDelete (GVAR(iconCtrls) select _i);
};
GVAR(iconCtrls) resize GVAR(iconCount);
GVAR(iconCount) = 0;
