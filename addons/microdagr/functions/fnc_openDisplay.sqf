/*
 * Author: PabstMirror
 * Takes some arguments and returns something or other.
 *
 * Arguments:
 * 0: The first argument <STRING>
 * 1: The second argument <OBJECT>
 * 2: Third Optional Argument <BOOL><OPTIONAL>
 *
 * Return Value:
 * The return value <BOOL>
 *
 * Example:
 * _bool = ["something", player] call ace_common_fnc_imanexample
 *
 * Public: Yes
 */
#include "script_component.hpp"

_this spawn {
    _swap = if (GVAR(currentShowMode) == DISPLAY_MODE_DISPLAY) then {DISPLAY_MODE_DIALOG} else {DISPLAY_MODE_DISPLAY};
    DEFAULT_PARAM(0,_newDisplayShowMode,_swap);
    GVAR(currentShowMode) = _newDisplayShowMode;

    systemChat format ["New ShowMode: %1", GVAR(currentShowMode)];

    disableSerialization;

    //On first-startup
    if (GVAR(currentApplicationPage) == APP_MODE_NULL) then {
        GVAR(currentApplicationPage) = APP_MODE_MARK;
        GVAR(mapPosition) = getPos ace_player;
    };


    _display = displayNull;
    if (_newDisplayShowMode == 0) then {
        systemChat "Closing";
        if (dialog && {!isNull (uiNamespace getVariable ["testGPS", displayNull])}) then {
            [-1] call FUNC(saveCurrentAndSetNewMode);
            closeDialog 0;
        };
        ("testGPS_T" call BIS_fnc_rscLayer) cutText ["", "PLAIN"];
    } else {
        if (_newDisplayShowMode == 1) then {
            systemChat "Opening Display";
            if (dialog && {!isNull (uiNamespace getVariable ["testGPS", displayNull])}) then {
                systemChat "backing up";
                [-1] call FUNC(saveCurrentAndSetNewMode);
                closeDialog 0;
            };
            ("testGPS_T" call BIS_fnc_rscLayer) cutRsc ["testGPS_T", "PLAIN", 0, true];
            _display = (uiNamespace getVariable ["testGPS_T", displayNull]);
        } else {
            systemChat "Opening Dialog";
            ("testGPS_T" call BIS_fnc_rscLayer) cutText ["", "PLAIN"];
            createDialog "testGPS";
            _display = (uiNamespace getVariable ["testGPS", displayNull]);
        };
    };

    [] call FUNC(showApplicationPage);

    waitUntil {
        if (isNull _display) exitWith {true};
        [] call FUNC(updateDisplay);
        GVAR(gpsPositionASL) = getPosAsl player;
        GVAR(compassDirection) = getDir player;
        sleep 0.1;
        false;
    };
};
