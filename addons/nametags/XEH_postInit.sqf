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

    //When cursorTarget is on a vehicle show the nametag for the commander.
    //If set to "Only On Keypress" settings, fade just like main tags
    if (GVAR(showCursorTagForVehicles)) then {
        _target = cursorTarget;
        if ((!(_target isKindOf "Man")) && {!(_target in allUnitsUAV)}) then {
            _target = effectiveCommander _target;
            if ((!isNull _target) && {side group _target == playerSide} && {_target != _player} && {isPlayer _target || {GVAR(ShowNamesForAI)}} && {!(_target getVariable ["ACE_hideName", false])}) then {
                _distance = _player distance _target;
                _alpha = ((1 - 0.2 * (_distance - GVAR(PlayerNamesViewDistance))) min 1) * GVAR(PlayerNamesMaxAlpha);
                if ((GVAR(showPlayerNames) in [3,4])) then { //only on keypress
                    _alpha = _alpha min (2 + (GVAR(ShowNamesTime) - time));
                };
                [_player, _target, _alpha, _distance * 0.026] call FUNC(drawNameTagIcon);
            };
        };
    };

    if (GVAR(showPlayerNames) in [2,4]) then {
        //"Only Cursor" mode, only show nametags for humans
        _target = cursorTarget;
        if ((!isNull _target) && {_target isKindOf "Man"} && {side group _target == playerSide} && {_target != _player} && {isPlayer _target || {GVAR(ShowNamesForAI)}} && {!(_target getVariable ["ACE_hideName", false])}) then {
            _distance = _player distance _target;
            _alpha = ((1 - 0.2 * (_distance - GVAR(PlayerNamesViewDistance))) min 1) * GVAR(PlayerNamesMaxAlpha);
            if ((GVAR(showPlayerNames) == 4)) then { //only on keypress
                _alpha = _alpha min (2 + (GVAR(ShowNamesTime) - time));
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
            _target = _x;

            if ((!isNull _target) && {side group _target == playerSide} && {_target != _player} && {isPlayer _target || {GVAR(ShowNamesForAI)}} && {!(_target getVariable ["ACE_hideName", false])}) then {
                if (lineIntersects [_pos, (visiblePositionASL _target) vectorAdd [0,0,1], vehicle _player, _target]) exitWith {}; // Check if there is line of sight
                _relPos = (visiblePositionASL _target) vectorDiff _pos;
                _distance = vectorMagnitude _relPos;
                _projDist = _relPos vectorDistance (_vecy vectorMultiply (_relPos vectorDotProduct _vecy));

                _alpha = ((1 - 0.2 * (_distance - GVAR(PlayerNamesViewDistance))) min (1 - 0.15 * (_projDist * 5 - _distance - 3)) min 1) * GVAR(PlayerNamesMaxAlpha);

                if (GVAR(showPlayerNames) == 3) then { //only on keypress
                    _alpha = _alpha min (2 + (GVAR(ShowNamesTime) - time));
                };

                [_player, _target, _alpha, _distance * 0.026] call FUNC(drawNameTagIcon);
            };
        } forEach _targets;
    };
}];
