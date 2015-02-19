#include "script_component.hpp"

_player = ACE_player;

//don't show nametags in spectator
if (!alive _player) exitWith {};

_onKeyPressAlphaMax = 2 + (GVAR(ShowNamesTime) - time); //after release 1 second of full opacity, 1 second of fading to 0

//If set to only show on keypress and nothing would be visable, exit
if ((GVAR(showPlayerNames) in [3,4]) && {GVAR(showSoundWaves) < 2} && {(2 + (GVAR(ShowNamesTime) - time)) < 0}) exitWith{};


//When cursorTarget is on a vehicle show the nametag for the commander.
//If set to "Only On Keypress" settings, fade just like main tags
if (GVAR(showCursorTagForVehicles)) then {
    _target = cursorTarget;
    if ((!(_target isKindOf "CAManBase")) && {!(_target in allUnitsUAV)}) then {
        _target = effectiveCommander _target;
        if ((!isNull _target) && {side group _target == playerSide} && {_target != _player} && {isPlayer _target || {GVAR(ShowNamesForAI)}} && {!(_target getVariable ["ACE_hideName", false])}) then {
            _distance = _player distance _target;
            _alpha = ((1 - 0.2 * (_distance - GVAR(PlayerNamesViewDistance))) min 1) * GVAR(PlayerNamesMaxAlpha);
            if ((GVAR(showPlayerNames) in [3,4])) then { //only on keypress
                _alpha = _alpha min _onKeyPressAlphaMax;
            };
            [_player, _target, _alpha, _distance * 0.026] call FUNC(drawNameTagIcon);
        };
    };
};

//"Only Cursor" mode, only show nametags for humans
if (GVAR(showPlayerNames) in [2,4]) then {
    _target = cursorTarget;
    if ((!isNull _target) && {_target isKindOf "CAManBase"} && {(side (group _target)) == (side (group _player))} && {_target != _player} && {isPlayer _target || {GVAR(ShowNamesForAI)}} && {!(_target getVariable ["ACE_hideName", false])}) then {
        _distance = _player distance _target;
        _alpha = ((1 - 0.2 * (_distance - GVAR(PlayerNamesViewDistance))) min 1) * GVAR(PlayerNamesMaxAlpha);
        if ((GVAR(showPlayerNames) == 4)) then { //only on keypress
            _alpha = _alpha min _onKeyPressAlphaMax;
        };
        [_player, _target, _alpha, _distance * 0.026] call FUNC(drawNameTagIcon);
    };
};


if ((GVAR(showPlayerNames) in [1,3]) || {GVAR(showSoundWaves) == 2}) then {
    _pos = positionCameraToWorld [0, 0, 0];
    _targets = _pos nearObjects ["CAManBase", GVAR(PlayerNamesViewDistance) + 5];

    if (!surfaceIsWater _pos) then {
        _pos = ATLtoASL _pos;
    };
    _pos2 = positionCameraToWorld [0, 0, 1];
    if (!surfaceIsWater _pos2) then {
        _pos2 = ATLtoASL _pos2;
    };
    _vecy = _pos2 vectorDiff _pos;

    {
        _target = _x;

        if ((!isNull _target) && {side group _target == playerSide} && {_target != _player} && {isPlayer _target || {GVAR(ShowNamesForAI)}} && {!(_target getVariable ["ACE_hideName", false])}) then {
            if (lineIntersects [_pos, (visiblePositionASL _target) vectorAdd [0,0,1], vehicle _player, _target]) exitWith {}; // Check if there is line of sight
            _relPos = (visiblePositionASL _target) vectorDiff _pos;
            _distance = vectorMagnitude _relPos;
            _projDist = _relPos vectorDistance (_vecy vectorMultiply (_relPos vectorDotProduct _vecy));

            _alpha = ((1 - 0.2 * (_distance - GVAR(PlayerNamesViewDistance))) min (1 - 0.15 * (_projDist * 5 - _distance - 3)) min 1) * GVAR(PlayerNamesMaxAlpha);

            if (GVAR(showPlayerNames) == 3) then { //only on keypress
                _alpha = _alpha min _onKeyPressAlphaMax;
            };

            [_player, _target, _alpha, _distance * 0.026] call FUNC(drawNameTagIcon);
        };
    } forEach _targets;
};

