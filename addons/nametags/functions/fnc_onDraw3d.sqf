/*
 * Author: <N/A>
 * Draws names and icons.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_nametags_fnc_onDraw3d
 *
 * Public: No
 */
#include "script_component.hpp"

BEGIN_COUNTER(GVAR(onDraw3d));

// Don't show nametags in spectator or if RscDisplayMPInterrupt is open
if ((isNull ACE_player) || {!alive ACE_player} || {!isNull (findDisplay 49)}) exitWith {};

private _flags = [[], DFUNC(getCachedFlags), ACE_player, QGVAR(flagsCache), 2] call EFUNC(common,cachedCall);

_flags params ["_drawName", "_drawRank", "_enabledTagsNearby", "_enabledTagsCursor", "_maxDistance"];

private _onKeyPressAlphaMax = 1;
if (GVAR(showPlayerNames) == 3) then {
    _onKeyPressAlphaMax = 2 + (GVAR(showNamesTime) - CBA_missionTime);
    _enabledTagsNearby = _enabledTagsNearby || {_onKeyPressAlphaMax > 0}
};
if (GVAR(showPlayerNames) == 4) then {
    _onKeyPressAlphaMax = 2 + (GVAR(showNamesTime) - CBA_missionTime);
    _enabledTagsCursor = _onKeyPressAlphaMax > 0;
};

private _camPosAGL = positionCameraToWorld [0, 0, 0];
if !((_camPosAGL select 0) isEqualType 0) exitWith {}; // handle RHS / bugged vehicle slots

private _camPosASL = AGLtoASL _camPosAGL;

// Show nametag for the unit behind the cursor or its commander
if (_enabledTagsCursor) then {
    private _target = cursorTarget;
    if !(_target isKindOf "CAManBase") then {
        // When cursorTarget is on a vehicle show the nametag for the commander.
        if !(_target in allUnitsUAV) then {
            _target = effectiveCommander _target;
        } else {
            _target = objNull;
        };
    };
    if (isNull _target) exitWith {};

    if (_target != ACE_player &&
        {(side group _target) == (side group ACE_player)} &&
        {GVAR(showNamesForAI) || {[_target] call EFUNC(common,isPlayer)}} &&
        {lineIntersectsSurfaces [_camPosASL, eyePos _target, ACE_player, _target] isEqualTo []} &&
        {!isObjectHidden _target}) then {

        private _distance = ACE_player distance _target;

        private _drawSoundwave = (GVAR(showSoundWaves) > 0) && {[_target] call FUNC(isSpeaking)};
        // Alpha:
        // - base value determined by GVAR(playerNamesMaxAlpha)
        // - decreases when _distance > _maxDistance
        // - increases when the unit is speaking
        // - it's clamped by the value of _onKeyPressAlphaMax
        private _alpha = (((1 + ([0, 0.2] select _drawSoundwave) - 0.2 * (_distance - _maxDistance)) min 1) * GVAR(playerNamesMaxAlpha)) min _onKeyPressAlphaMax;

        if (_alpha > 0) then {
            [ACE_player, _target, _alpha, _distance * 0.026, _drawName, _drawRank, _drawSoundwave] call FUNC(drawNameTagIcon);
        };
    };
};

// Show nametags for nearby units
if (_enabledTagsNearby) then {
    // Find valid targets and cache them
    private _targets = [[], {
        private _nearMen = _camPosAGL nearObjects ["CAManBase", _maxDistance + 7];
        _nearMen = _nearMen select {
            _x != ACE_player &&
            {(side group _x) == (side group ACE_player)} &&
            {GVAR(showNamesForAI) || {[_x] call EFUNC(common,isPlayer)}} &&
            {lineIntersectsSurfaces [_camPosASL, eyePos _x, ACE_player, _x] isEqualTo []} &&
            {!isObjectHidden _x}
        };
        private _crewMen = [];
        if (vehicle ACE_player != ACE_player) then {
            _crewMen = (crew vehicle ACE_player) select {
                _x != ACE_player &&
                {(side group _x) == (side group ACE_player)} &&
                {GVAR(showNamesForAI) || {[_x] call EFUNC(common,isPlayer)}} &&
                {lineIntersectsSurfaces [_camPosASL, eyePos _x, ACE_player, _x, true, 1, "GEOM", "NONE"] isEqualTo []} &&
                {!isObjectHidden _x}
            };
        };
        (_nearMen + _crewMen)
    }, missionNamespace, QGVAR(nearMen), 0.5] call EFUNC(common,cachedCall);

    {
        private _target = _x;

        if !(isNull _target) then {
            private _drawSoundwave = (GVAR(showSoundWaves) > 0) && {[_target] call FUNC(isSpeaking)};
            if (_enabledTagsCursor && {!_drawSoundwave}) exitWith {}; // (Cursor Only && showSoundWaves==2) - quick exit

            private _relPos = (visiblePositionASL _target) vectorDiff _camPosASL;
            private _distance = vectorMagnitude _relPos;

            // Fade on border
            private _centerOffsetFactor = 1;
            if (GVAR(showPlayerNames) == 5) then {
                private _screenPos = worldToScreen (_target modelToWorld (_target selectionPosition "head"));
                if !(_screenPos isEqualTo []) then {
                    // Distance from center / half of screen width
                    _centerOffsetFactor = 1 - ((_screenPos distance2D [0.5, 0.5]) / (safezoneW / 3));
                } else {
                    _centerOffsetFactor = 0;
                };
            };

            private _alphaMax = _onKeyPressAlphaMax;
            if ((GVAR(showSoundWaves) == 2) && _drawSoundwave) then {
                _drawName = _drawSoundwave;
                _drawRank = false;
                _alphaMax = 1;
            };
            // Alpha:
            // - base value determined by GVAR(playerNamesMaxAlpha)
            // - decreases when _distance > _maxDistance
            // - increases when the unit is speaking
            // - it's clamped by the value of _onKeyPressAlphaMax unless soundwaves are forced on and the unit is talking
            private _alpha = (((1 + ([0, 0.2] select _drawSoundwave) - 0.2 * (_distance - _maxDistance)) min 1) * GVAR(playerNamesMaxAlpha) * _centerOffsetFactor) min _alphaMax;

            if (_alpha > 0) then {
                [ACE_player, _target, _alpha, _distance * 0.026, _drawName, _drawRank, _drawSoundwave] call FUNC(drawNameTagIcon);
            };
        };
        nil
    } count _targets;
};

END_COUNTER(GVAR(onDraw3d));
