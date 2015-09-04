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
#include "script_component.hpp"

private "_name";

params ["_rallypoint", "_respawnMarker", "_side"];

_name = typeOf _rallypoint;

// init visible marker
if (hasInterface) then {
    // fix init having wrong position, vars etc.
    [{
        private ["_marker", "_type"];

        params ["_args", "_pfhId"];
        _args params ["_rallypoint", "_respawnMarker", "_side", "_name"];

        _marker = format ["ACE_Marker_%1", _name];

         // exit if it already exist
         if (_marker in allMapMarkers) exitWith {};

         _marker = createMarkerLocal [_marker, getPosASL _rallypoint];
         _type = ["selector_selectedFriendly", "selector_selectedEnemy"] select (_respawnMarker == "");

         _marker setMarkerTypeLocal _type;
         _marker setMarkerAlphaLocal ([0, 1] select (_side == playerSide)); // playerSide to guarantee init

         _markerDate = _rallypoint getVariable [QGVAR(markerDate), ""];
         _marker setMarkerTextLocal _markerDate;

         _rallypoint setVariable [QGVAR(marker), _marker];
    }, 0, [_rallypoint, _respawnMarker, _side, _name]] call CBA_fnc_addPerFrameHandler;
};

if (!isServer) exitWith {};

if (isNil _name) then {
    missionNamespace setVariable [_name, _rallypoint];
    publicVariable _name;

    _rallypoint setVariable [QGVAR(side), _side, true];

    if (_respawnMarker != "" && {!(_respawnMarker in allMapMarkers)}) then {
        createMarker [_respawnMarker, _rallypoint];
    };

    ["rallypointMoved", [_rallypoint, _side]] call EFUNC(common,globalEvent);
} else {
    deleteVehicle _rallypoint;
    diag_log text "[ACE] Respawn: ERROR Multiple Rallypoints of same type.";
};
