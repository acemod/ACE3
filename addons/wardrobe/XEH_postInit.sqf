#include "script_component.hpp"

[ QGVAR(EH_updateMagIDs), FUNC(spareBarrel_updateMagIDs) ] call CBA_fnc_addEventHandler;

[
    QGVAR(EH_say3d),
    {
        params [["_source", objNull, [objNull]],["_sound",[""],["", []]]];
        if (_sound isEqualType [] && {_sound#0 == ""} || {_sound isEqualType "" && {_sound == ""}}) exitWith {};
        _sound params [
            "_className",
            ["_distance", 50, [0]],
            ["_pitch", 0.95 + random 0.1, [0]]
        ];
        _source say3D [_className, _distance, _pitch];
        nil
    }
] call CBA_fnc_addEventHandler;
