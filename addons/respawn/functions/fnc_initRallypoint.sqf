#include "script_component.hpp"
/*
 * Author: commy2
 * Init code for rallypoints.
 *
 * Arguments:
 * 0: Rallypoint Object <OBJECT>
 * 1: Respawn Marker <STRING>
 * 2: Side <SIDE>
 *
 * Return Value:
 * None
 *
 * Example:
 * [respawn_object, "", west] call ace_respawn_fnc_initRallypoint
 *
 * Public: No
 */

params ["_rallypoint", "_respawnMarker", "_side"];

private _name = typeOf _rallypoint;

if (isNil _name) then {
    missionNamespace setVariable [_name, _rallypoint];

    _rallypoint setVariable [QGVAR(side), _side];

    if (isServer) then {
        if (_respawnMarker != "" && {!(_respawnMarker in allMapMarkers)}) then {
            createMarker [_respawnMarker, _rallypoint];
        };

        ["ace_rallypointMoved", [_rallypoint, _side]] call CBA_fnc_globalEvent;
    };
} else {
    deleteVehicle _rallypoint;
    ERROR("Multiple Rallypoints of same type.");
};

// init visible marker
if (hasInterface) then {
    [{
        params ["_rallypoint", "_respawnMarker", "_side", "_name"];

        private _marker = format ["ACE_Marker_%1", _name];

        // exit if marker already exist
        if (_marker in allMapMarkers) exitWith {};

        _marker = createMarkerLocal [_marker, getPosASL _rallypoint];

        private _type = ["selector_selectedFriendly", "selector_selectedEnemy"] select (_respawnMarker == "");

        _marker setMarkerTypeLocal _type;
        _marker setMarkerAlphaLocal ([0,1] select (_side == playerSide)); // playerSide to guarantee init

        private _date = _rallypoint getVariable [QGVAR(markerDate), ""];

        _marker setMarkerTextLocal _date;

        _rallypoint setVariable [QGVAR(marker), _marker];
    }, [_rallypoint, _respawnMarker, _side, _name], 0.1] call CBA_fnc_waitAndExecute;
};
