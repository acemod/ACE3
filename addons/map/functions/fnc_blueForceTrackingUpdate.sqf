/*
 * Author: ACE-Team
 * Update the blue force tracking.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ACE_map_fnc_blueForceTrackingUpdate
 *
 * Public: No
 */


// #define ENABLE_PERFORMANCE_COUNTERS
#include "script_component.hpp"
// BEGIN_COUNTER(blueForceTrackingUpdate);

// Delete last set of markers (always)
{
    deleteMarkerLocal _x;
} forEach GVAR(BFT_markers);

GVAR(BFT_markers) = [];

if (GVAR(BFT_Enabled) and {(!isNil "ACE_player") and {alive ACE_player}}) then {

    private _groupsToDrawMarkers = [];
    private _playerSide = call EFUNC(common,playerSide);

    _groupsToDrawMarkers = allGroups select {side _x == _playerSide};

    if (GVAR(BFT_HideAiGroups)) then {
        _groupsToDrawMarkers = _groupsToDrawMarkers select {
            {
                _x call EFUNC(common,isPlayer);
            } count units _x > 0;
        };
    };

    if (GVAR(BFT_ShowPlayerNames)) then {
        private _playersToDrawMarkers = allPlayers select {side _x == _playerSide && {!(_x getVariable [QGVAR(hideBlueForceMarker), false])}};

        {
            private _markerType = [_x] call EFUNC(common,getMarkerType);
            private _colour = format ["Color%1", side _x];

            private _marker = createMarkerLocal [format ["ACE_BFT_%1", _forEachIndex], [(getPos _x) select 0, (getPos _x) select 1]];
            _marker setMarkerTypeLocal _markerType;
            _marker setMarkerColorLocal _colour;
            _marker setMarkerTextLocal (name _x);

            GVAR(BFT_markers) pushBack _marker;
        } forEach _playersToDrawMarkers;

        _groupsToDrawMarkers = _groupsToDrawMarkers select {
            {
                !(_x call EFUNC(common,isPlayer));
            } count units _x > 0;
        };
    };

    _groupsToDrawMarkers = _groupsToDrawMarkers select {!(_x getVariable [QGVAR(hideBlueForceMarker), false])};

    {
        private _markerType = [_x] call EFUNC(common,getMarkerType);
        private _colour = format ["Color%1", side _x];

        private _marker = createMarkerLocal [format ["ACE_BFT_%1", _forEachIndex], [(getPos leader _x) select 0, (getPos leader _x) select 1]];
        _marker setMarkerTypeLocal _markerType;
        _marker setMarkerColorLocal _colour;
        _marker setMarkerTextLocal (groupId _x);

        GVAR(BFT_markers) pushBack _marker;
    } forEach _groupsToDrawMarkers;
};

// END_COUNTER(blueForceTrackingUpdate);
