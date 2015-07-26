/*
 * Author: SilentSpike
 * Handles rendering the spectator 3D unit icons
 *
 * Arguments:
 * 0: Parameters <ANY>
 * 1: PFH handle <NUMBER>
 *
 * Return Value:
 * None <NIL>
 *
 * Example:
 * [ace_spectator_fnc_handleIcons, 0] call CBA_fnc_addPerFrameHandler;
 *
 * Public: No
 */

#include "script_component.hpp"

// Kill PFH when not in free cam (or display is closed)
if (isNil QGVAR(iconHandler)) exitWith { [_this select 1] call CBA_fnc_removePerFrameHandler; };

if !(GVAR(showIcons)) exitWith {};

private ["_cachedVehicles","_unit","_cameraPos","_cameraDir","_lambda","_uPos","_cmd","_txt"];
_cachedVehicles = [];
{
    _unit = vehicle _x;

    // Only try each vehicle once
    if !(_unit in _cachedVehicles) then {
        _cachedVehicles pushBack _unit;

        // Within 200m
        if ((GVAR(camera) distanceSqr _unit) < 40000) then {
            _cameraPos = (positionCameraToWorld [0, 0, 0]) call EFUNC(common,positionToASL);
            _cameraDir = ((positionCameraToWorld [0, 0, 1]) call EFUNC(common,positionToASL)) vectorDiff _cameraPos;

            // Quick oclussion test (taken from interact_menu)
            _lambda = ((getPosASL _x) vectorDiff _cameraPos) vectorDotProduct _cameraDir;
            if (_lambda > -1) then {
                _uPos = worldToScreen (visiblePosition _unit);

                // Only draw if onscreen
                if ((_uPos select 0 > safeZoneXAbs) && (_uPos select 0 < safeZoneXAbs + safeZoneWAbs)) then {
                    if ((_uPos select 1 > safeZoneY) && (_uPos select 1 < safeZoneY + safeZoneH)) then {
                        // Use commander's info if available
                        _cmd = [_x, effectiveCommander _unit] select ((effectiveCommander _unit) in GVAR(unitList));
                        _txt = ["", GETVAR(_cmd,GVAR(uName),"")] select (isPlayer _cmd);

                        drawIcon3D ["\A3\ui_f\data\map\markers\military\dot_CA.paa", GETVAR(_cmd,GVAR(uColor),[ARR_4(0,0,0,0)]), _unit modelToWorldVisual [0,0,3], 0.7, 0.7, 0, _txt, 1, 0.02];
                    };
                };
            };
        };
    };
} forEach GVAR(unitList);
