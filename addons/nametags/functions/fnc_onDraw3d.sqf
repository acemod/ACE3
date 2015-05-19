#include "script_component.hpp"

private ["_onKeyPressAlphaMax", "_defaultIcon", "_distance", "_alpha", "_icon", "_targets", "_pos2", "_vecy", "_relPos", "_projDist", "_pos", "_target"];

//don't show nametags in spectator
if (!alive ACE_player) exitWith {};

_onKeyPressAlphaMax = if ((GVAR(showPlayerNames) in [3,4])) then {
    2 + (GVAR(ShowNamesTime) - time); //after release 1 second of full opacity, 1 second of fading to 0
} else {
    1
};

_defaultIcon = if (GVAR(showPlayerRanks)) then {
    ICON_NAME_RANK;
} else {
    ICON_NAME;
};

//When cursorTarget is on a vehicle show the nametag for the commander.
//If set to "Only On Keypress" settings, fade just like main tags
if (GVAR(showCursorTagForVehicles) && {_onKeyPressAlphaMax > 0}) then {
    _target = cursorTarget;
    if ((!(_target isKindOf "CAManBase")) && {!(_target in allUnitsUAV)}) then {
        _target = effectiveCommander _target;
        if ((!isNull _target) &&
                {(side (group _target)) == (side (group ACE_player))} &&
                {_target != ACE_player} &&
                {GVAR(ShowNamesForAI) || {[_target] call EFUNC(common,isPlayer)}} &&
                {!(_target getVariable ["ACE_hideName", false])}) then {
            _distance = ACE_player distance _target;
            _alpha = ((1 - 0.2 * (_distance - GVAR(PlayerNamesViewDistance))) min 1) * GVAR(PlayerNamesMaxAlpha);
            _alpha = _alpha min _onKeyPressAlphaMax;
            [ACE_player, _target, _alpha, _distance * 0.026, _defaultIcon] call FUNC(drawNameTagIcon);
        };
    };
};

//"Only Cursor" mode, only show nametags for humans on cursorTarget
if ((GVAR(showPlayerNames) in [2,4]) && {_onKeyPressAlphaMax > 0}) then {
    _target = cursorTarget;
    if ((!isNull _target) &&
            {_target isKindOf "CAManBase"} &&
            {(side (group _target)) == (side (group ACE_player))} &&
            {_target != ACE_player} &&
            {GVAR(ShowNamesForAI) || {[_target] call EFUNC(common,isPlayer)}} &&
            {!(_target getVariable ["ACE_hideName", false])}) then {
        _distance = ACE_player distance _target;
        _alpha = ((1 - 0.2 * (_distance - GVAR(PlayerNamesViewDistance))) min 1) * GVAR(PlayerNamesMaxAlpha);
        _alpha = _alpha min _onKeyPressAlphaMax;
        _icon = ICON_NONE;
        if (GVAR(showSoundWaves) == 2) then {  //icon will be drawn below, so only show name here
            _icon = if (([_target] call FUNC(isSpeaking)) && {(vehicle _target) == _target}) then {ICON_NAME} else {_defaultIcon};
        } else {
            _icon = if (([_target] call FUNC(isSpeaking)) && {(vehicle _target) == _target} && {GVAR(showSoundWaves) > 0}) then {ICON_NAME_SPEAK} else {_defaultIcon};
        };

        [ACE_player, _target, _alpha, _distance * 0.026, _icon] call FUNC(drawNameTagIcon);
    };
};

if (((GVAR(showPlayerNames) in [1,3]) && {_onKeyPressAlphaMax > 0}) || {GVAR(showSoundWaves) == 2}) then {
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

        _icon = ICON_NONE;
        if ((GVAR(showPlayerNames) in [1,3]) && {_onKeyPressAlphaMax > 0}) then {
            if (([_target] call FUNC(isSpeaking)) && {(vehicle _target) == _target} && {GVAR(showSoundWaves) > 0}) then {_icon = ICON_NAME_SPEAK;} else {_icon = _defaultIcon};
        } else {
            //showSoundWaves must be 2, only draw speak icon
            if (([_target] call FUNC(isSpeaking)) && {(vehicle _target) == _target}) then {_icon = ICON_SPEAK;};
        };

        if ((_icon != ICON_NONE) &&
                {(side (group _target)) == (side (group ACE_player))} &&
                {_target != ACE_player} &&
                {GVAR(ShowNamesForAI) || {[_target] call EFUNC(common,isPlayer)}} &&
                {!(_target getVariable ["ACE_hideName", false])}) then {

            if (lineIntersects [_pos, (visiblePositionASL _target) vectorAdd [0,0,1], vehicle ACE_player, _target]) exitWith {}; // Check if there is line of sight
            _relPos = (visiblePositionASL _target) vectorDiff _pos;
            _distance = vectorMagnitude _relPos;
            _projDist = _relPos vectorDistance (_vecy vectorMultiply (_relPos vectorDotProduct _vecy));

            _alpha = ((1 - 0.2 * (_distance - GVAR(PlayerNamesViewDistance))) min (1 - 0.15 * (_projDist * 5 - _distance - 3)) min 1) * GVAR(PlayerNamesMaxAlpha);

            if ((GVAR(showSoundWaves) == 2) && {([_target] call FUNC(isSpeaking)) && {(vehicle _target) == _target}}) then {
                _alpha = 1;
            } else {
                _alpha = _alpha min _onKeyPressAlphaMax;
            };

            [ACE_player, _target, _alpha, _distance * 0.026, _icon] call FUNC(drawNameTagIcon);
        };
    } forEach _targets;
};
