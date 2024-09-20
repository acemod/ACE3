#include "..\script_component.hpp"
/*
 * Author: Timi007
 * Starts the placing process of the marker flag for the player.
 * Flags can be placed with the special marker flag items.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Flag item <STRING>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player, "ace_marker_flags_white"] call ace_marker_flags_fnc_placeFlag
 *
 * Public: No
 */

params [["_player", objNull, [objNull]], ["_item", QGVAR(white), [""]]];
TRACE_2("Placing flag",_player,_item);

(GVAR(flagCache) get _item) params ["_vehicleClass"];

private _flag = _vehicleClass createVehicle [0, 0, 0];

TRACE_1("Created flag",_flag);

// Set flag start height
GVAR(objectHeight) = MAX_HEIGHT;

GVAR(isPlacing) = PLACE_WAITING;

// Add info dialog for the player which show the controls
[LLSTRING(ActionPlace), LLSTRING(ActionCancel), LLSTRING(ActionAdjustHeight)] call EFUNC(interaction,showMouseHint);

private _mouseClickID = [_player, "DefaultAction", {
    GVAR(isPlacing) isEqualTo PLACE_WAITING
}, {
    GVAR(isPlacing) = PLACE_APPROVE
}] call EFUNC(common,addActionEventHandler);

[{
    params ["_args", "_handle"];
    _args params ["_player", "_item", "_flag", "_mouseClickID"];

    if (isNull _flag || {!([_player, _flag] call EFUNC(common,canInteractWith))}) then {
        GVAR(isPlacing) = PLACE_CANCEL;
    };

    if (GVAR(isPlacing) isNotEqualTo PLACE_WAITING) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
        call EFUNC(interaction,hideMouseHint);
        [_player, "DefaultAction", _mouseClickID] call EFUNC(common,removeActionEventHandler);

        if (GVAR(isPlacing) isEqualTo PLACE_APPROVE) then {
            // End position of the flag
            GVAR(isPlacing) = PLACE_CANCEL;
            [_player, "PutDown"] call EFUNC(common,doGesture);
            _player removeItem _item;
            [QGVAR(placed), [_player, _flag, _item]] call CBA_fnc_localEvent;
        } else {
            // Action is canceled
            deleteVehicle _flag;
        };
    };

    private _pos = (eyePos _player) vectorAdd ((getCameraViewDirection _player) vectorMultiply FLAG_PLACING_DISTANCE);
    // Adjust height of flag with the scroll wheel
    _pos set [2, ((getPosWorld _player) select 2) + GVAR(objectHeight)];

    _flag setPosWorld _pos;
    _flag setDir (getDir _player - 90);
}, 0, [_player, _item, _flag, _mouseClickID]] call CBA_fnc_addPerFrameHandler;
