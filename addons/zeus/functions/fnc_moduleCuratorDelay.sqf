/*
 * Author: SilentSpike
 * Function executed at a delay to allow curator settings module to run first
 * Allows ascension and bird settings to be set by module beforehand
 *
 * Arguments:
 * 0: The module logic <LOGIC>
 * 1: units <ARRAY>
 * 2: activated <BOOL>
 *
 * Return Value:
 * None <NIL>
 *
 * Public: No
 */

#include "script_component.hpp"

if (isServer) then {
    // Extracted from moduleCurator to toggle ascension messages
    if (GVAR(zeusAscension)) then {
        //--- Sent notification to all assigned players
        {
            if (isplayer _x) then {
                [["CuratorAssign",[_name,name _player]],"bis_fnc_showNotification",_x] call bis_fnc_mp;
            };
        } foreach (curatoreditableobjects _logic);
    };

    // Extracted from moduleCurator to toggle eagle
    if (GVAR(zeusBird)) then {
        //--- Create bird
        _birdType = _logic getvariable ["birdType","eagle_f"];
        if (_birdType != "") then {
            _bird = createvehicle [_birdType,[100,100,100],[],0,"none"];
            _logic setvariable ["bird",_bird,true];
        };

        //--- Locality changed
        _logic addeventhandler [
            "local",
            {
                _logic = _this select 0;
                _bird = _logic getvariable ["bird",objnull];
                _bird setowner owner _logic;
            }
        ];
    };
};