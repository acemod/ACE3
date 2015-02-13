// by commy2 and CAA-Picard
#include "script_component.hpp"

[] call FUNC(initIsSpeaking);

if (!hasInterface) exitWith {};


// Add keybinds
["ACE3",
    localize "STR_ACE_NameTags_ShowNames",
    {
        // Conditions: canInteract
        _exceptions = [];
        if !(_exceptions call EGVAR(common,canInteract)) exitWith {false};

        // Statement
        GVAR(ShowNamesTime) = time;
        if (call FUNC(canShow)) then{ call FUNC(doShow); };
        // Return false so it doesn't block other actions
        false
    },
    [29, [false, false, false]],
    false,
    "keydown"
] call cba_fnc_registerKeybind;


// Draw handle
addMissionEventHandler ["Draw3D", {
  if (GVAR(showPlayerNames) == 0) exitWith {};

  _player = ACE_player;
  if (GVAR(showPlayerNames) in [2,4]) then { //only on cursor
    _target = cursorTarget;
    _target = if (_target in allUnitsUAV) then {objNull} else {effectiveCommander _target};

    if (!isNull _target && {side group _target == playerSide} && {_target != _player} && {isPlayer _target || {GVAR(ShowNamesForAI)}} && {!(_target getVariable ["ACE_hideName", false])}) then {
      _distance = _player distance _target;
      _alpha = ((1 - 0.2 * (_distance - GVAR(PlayerNamesViewDistance))) min 1) * GVAR(PlayerNamesMaxAlpha);
      if ((GVAR(showPlayerNames) in [3,4])) then { //only on keypress
        _alpha = _alpha min (1 - (time - GVAR(ShowNamesTime) - 1));
      };
      [_player, _target, _alpha, _distance * 0.026] call FUNC(drawNameTagIcon);
    };
  } else {
    _pos = positionCameraToWorld [0, 0, 0];
    _targets = _pos nearObjects ["Man", GVAR(PlayerNamesViewDistance) + 5];

    if (!surfaceIsWater _pos) then {
      _pos = ATLtoASL _pos;
    };
    _pos2 = positionCameraToWorld [0, 0, 1];
    if (!surfaceIsWater _pos2) then {
      _pos2 = ATLtoASL _pos2;
    };
    _vecy = _pos2 vectorDiff _pos;

    {
      _target = if (_x in allUnitsUAV) then {objNull} else {effectiveCommander _x};

      if (!isNull _target && {side group _target == playerSide} && {_target != _player} && {isPlayer _target || {GVAR(ShowNamesForAI)}} && {!(_target getVariable ["ACE_hideName", false])}) then {
        _relPos = (visiblePositionASL _target) vectorDiff _pos;
        _distance = vectorMagnitude _relPos;
        _projDist = _relPos vectorDistance (_vecy vectorMultiply (_relPos vectorDotProduct _vecy));

        _alpha = ((1 - 0.2 * (_distance - GVAR(PlayerNamesViewDistance))) min (1 - 0.15 * (_projDist * 5 - _distance - 3)) min 1) * GVAR(PlayerNamesMaxAlpha);

        if ((GVAR(showPlayerNames) in [3,4])) then { //only on keypress
          _alpha = _alpha min (1 - (time - GVAR(ShowNamesTime) - 1));
        };

        // Check if there is line of sight
        if (_alpha > 0) then {
          if (lineIntersects [_pos, (visiblePositionASL _target) vectorAdd [0,0,1], vehicle _player, _target]) then {
            _alpha = 0;
          };
        };
        [_player, _target, _alpha, _distance * 0.026] call FUNC(drawNameTagIcon);
      };
    } forEach _targets;
  };
}];
