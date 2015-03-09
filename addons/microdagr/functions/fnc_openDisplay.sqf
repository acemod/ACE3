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

DEFAULT_PARAM(0,_newDisplayShowMode,-1);
_oldShowMode = GVAR(currentShowMode);

if (_newDisplayShowMode == -1) then {
    if (_oldShowMode in [DISPLAY_MODE_DISPLAY, DISPLAY_MODE_HIDDEN]) then {_newDisplayShowMode = DISPLAY_MODE_DIALOG};
    if (_oldShowMode in [DISPLAY_MODE_DIALOG, DISPLAY_MODE_CLOSED]) then {_newDisplayShowMode = DISPLAY_MODE_DISPLAY};
};

if ((_newDisplayShowMode == DISPLAY_MODE_DISPLAY) && {!([DISPLAY_MODE_DISPLAY] call FUNC(canShow))}) then {_newDisplayShowMode = DISPLAY_MODE_HIDDEN};
if ((_newDisplayShowMode == DISPLAY_MODE_DIALOG) && {!([DISPLAY_MODE_DIALOG] call FUNC(canShow))}) then {_newDisplayShowMode = DISPLAY_MODE_HIDDEN};

GVAR(currentShowMode) = _newDisplayShowMode;

disableSerialization;

//On first-startup
if (GVAR(currentApplicationPage) == APP_MODE_NULL) then {
    GVAR(currentApplicationPage) = APP_MODE_INFODISPLAY;
    GVAR(mapPosition) = getPos ace_player;
};

systemChat format ["%1 to %2 from %3", _oldShowMode, GVAR(currentShowMode), _this];


if (GVAR(currentShowMode) in [DISPLAY_MODE_CLOSED, DISPLAY_MODE_HIDDEN]) then {
    systemChat "Closing";
    
    //If Dialog is open, back it up before closing:
    if (dialog && {!isNull (uiNamespace getVariable [QGVAR(DialogDisplay), displayNull])}) then {
        [-1] call FUNC(saveCurrentAndSetNewMode);
        closeDialog 0;
    };
    
    //Close the display:
    (QGVAR(TheRscTitleDisplay) call BIS_fnc_rscLayer) cutText ["", "PLAIN"];
} else {
    if (GVAR(currentShowMode) == DISPLAY_MODE_DISPLAY) then {
        systemChat "Opening Display";
        //If Dialog is open, back it up before closing:
        if (dialog && {!isNull (uiNamespace getVariable [QGVAR(DialogDisplay), displayNull])}) then {
            [-1] call FUNC(saveCurrentAndSetNewMode);
            closeDialog 0;
        };
        //Open the display:
        (QGVAR(TheRscTitleDisplay) call BIS_fnc_rscLayer) cutRsc [QGVAR(TheRscTitleDisplay), "PLAIN", 0, true];
    } else {
        systemChat "Opening Dialog";
        //Close the display:
        (QGVAR(TheRscTitleDisplay) call BIS_fnc_rscLayer) cutText ["", "PLAIN"];
        //Open the dialog:
        createDialog QGVAR(TheDialog);
    };
};

[] call FUNC(showApplicationPage);

if ((_oldShowMode == DISPLAY_MODE_CLOSED) && {GVAR(currentShowMode) != DISPLAY_MODE_CLOSED}) then {
    //Start a pfeh to update display and handle hiding display
    
    [{
        disableSerialization;
        PARAMS_2(_args,_pfID);
        EXPLODE_1_PVT(_args,_player);

        if ((ace_player != _player) || {!("ACE_microDAGR" in (items ace_player))} || {GVAR(currentShowMode) == DISPLAY_MODE_CLOSED}) then {
            GVAR(currentShowMode) = DISPLAY_MODE_CLOSED;
            [_pfID] call CBA_fnc_removePerFrameHandler;
        } else {
            GVAR(gpsPositionASL) = getPosAsl player;

            if (GVAR(currentShowMode) == DISPLAY_MODE_HIDDEN) then {
                if ([DISPLAY_MODE_DISPLAY] call FUNC(canShow)) then {
                    [DISPLAY_MODE_DISPLAY] call FUNC(openDisplay);
                };
            } else {
                if ([GVAR(currentShowMode)] call FUNC(canShow)) then {
                    [] call FUNC(updateDisplay);
                } else {
                    [DISPLAY_MODE_HIDDEN] call FUNC(openDisplay);
                };
            };
        };
    }, 0.1, [ace_player]] call CBA_fnc_addPerFrameHandler;
};
