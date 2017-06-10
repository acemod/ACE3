/*
 * Author: Norrin, Rocko, Ruthberg
 *
 * HuntIR monitor system
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ACE_huntir_fnc_huntir
 *
 * Public: No
 */
#include "script_component.hpp"

#define __TYPE_WRITER_DELAY 0.05

if ((ACE_player call CBA_fnc_getUnitAnim) select 0 == "stand") then {
    ACE_player playMove "AmovPercMstpSrasWrflDnon_diary";
};

HUNTIR_BACKGROUND_LAYER_ID cutText ["", "BLACK", 0];
createDialog QGVAR(cam_dialog_off);

[{
    if (!dialog) exitWith {
        HUNTIR_BACKGROUND_LAYER_ID cutText ["", "PLAIN", 0];
    };
    closeDialog 0;
    createDialog QGVAR(cam_dialog_inactive);
    uiNameSpace setVariable [QGVAR(monitor), findDisplay 18881];
    [{
        GVAR(startTime) = CBA_missionTime;
        GVAR(done) = false;
        GVAR(connectionDelay) = 5;
        GVAR(state) = "searching";
        GVAR(message) = [];
        GVAR(messageSearching) = toArray "Searching.....";
        GVAR(messageConnecting) = toArray "Connecting.....";
        [{
            //Close monitor if we no longer have item:
            if ((!([ACE_player, "ACE_HuntIR_monitor"] call EFUNC(common,hasItem))) && {!isNull (uiNameSpace getVariable [QGVAR(monitor), displayNull])}) then {
                closeDialog 0;
            };

            private ["_elapsedTime", "_nearestHuntIRs"];
            _elapsedTime = CBA_missionTime - GVAR(startTime);
            _nearestHuntIRs = ACE_player nearEntities ["ACE_HuntIR", HUNTIR_MAX_TRANSMISSION_RANGE];

            if ((!dialog) || GVAR(done)) exitWith {
                [_this select 1] call CBA_fnc_removePerFrameHandler;

                if (dialog && GVAR(state) == "connected") then {
                    [_nearestHuntIRs select 0] call FUNC(cam);
                } else {
                    HUNTIR_BACKGROUND_LAYER_ID cutText ["", "PLAIN"];
                };
            };
            switch (GVAR(state)) do {
                case "searching": {
                    if (count GVAR(message) < count GVAR(messageSearching)) then {
                        GVAR(message) pushBack (GVAR(messageSearching) select (count GVAR(message)));
                        ctrlSetText [1, toString GVAR(message)];
                    } else {
                        GVAR(message) = [];
                        if (_elapsedTime > 10) then {
                            GVAR(state) = "noGDS";
                        };
                        if (_elapsedTime > 5 && {{_x getHitPointDamage "HitCamera" < 0.25} count _nearestHuntIRs > 0}) then {
                            GVAR(state) = "connecting";
                        };
                    };
                };
                case "connecting": {
                    if (count GVAR(message) < count GVAR(messageConnecting)) then {
                        GVAR(message) pushBack (GVAR(messageConnecting) select (count GVAR(message)));
                        ctrlSetText [1, toString GVAR(message)];
                    } else {
                        GVAR(message) = [];
                        GVAR(connectionDelay) = GVAR(connectionDelay) - 1;
                        if (GVAR(connectionDelay) <= 0) then {
                            GVAR(done) = true;
                            GVAR(state) = "connected";
                        };
                    };
                };
                case "noGDS": {
                    ctrlSetText [1, "No GDS System detected"];
                    [{
                        GVAR(done) = true;
                        closedialog 0;
                        HUNTIR_BACKGROUND_LAYER_ID cutText ["", "PLAIN"];
                    }, [], 3, 0] call CBA_fnc_waitAndExecute;
                };
            };
        }, __TYPE_WRITER_DELAY, []] call CBA_fnc_addPerFrameHandler;
    }, [], 0.5, 0] call CBA_fnc_waitAndExecute;
}, [], 1, 0] call CBA_fnc_waitAndExecute;
