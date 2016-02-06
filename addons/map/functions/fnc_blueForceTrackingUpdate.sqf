// #define ENABLE_PERFORMANCE_COUNTERS
#include "script_component.hpp"
// BEGIN_COUNTER(blueForceTrackingUpdate);

private ["_groupsToDrawMarkers", "_playerSide", "_anyPlayers", "_colour", "_marker"];

// Delete last set of markers (always)
{
    deleteMarkerLocal _x;
} forEach GVAR(BFT_markers);

GVAR(BFT_markers) = [];

if (GVAR(BFT_Enabled) and {(!isNil "ACE_player") and {alive ACE_player}}) then {

    _groupsToDrawMarkers = [];
    _playerSide = call EFUNC(common,playerSide);

    if !(GVAR(BFT_HideAiGroups)) then {
        _groupsToDrawMarkers = allGroups select {side _x == _playerSide};
    } else {
        _groupsToDrawMarkers = allGroups select {
            _anyPlayers = {
                [_x] call EFUNC(common,isPlayer);
            } count units _x;
            (side _x == _playerSide) && _anyPlayers > 0
        }; // @todo, simplify this
    };

    {
        private _markerType = [_x] call EFUNC(common,getMarkerType);
        private _colour = format ["Color%1", side _x];

        private _marker = createMarkerLocal [format ["ACE_BFT_%1", _forEachIndex], [(getPos leader _x) select 0, (getPos leader _x) select 1]];
        _marker setMarkerTypeLocal _markerType;
        _marker setMarkerColorLocal _colour;
        _marker setMarkerTextLocal (groupID _x);

        GVAR(BFT_markers) pushBack _marker;
    } forEach _groupsToDrawMarkers;
};

// END_COUNTER(blueForceTrackingUpdate);
