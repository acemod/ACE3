/*
 * Author: bux578
 * Creates markers for AI units for given sides.
 * Marks players in a different colour.
 *
 * Arguments:
 * 0: side <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[west, east]] call ace_switchunits_fnc_markAiOnMap
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_sidesToShow"];

GVAR(AllMarkerNames) = [];

[{
    params ["_args"];
    _args params ["_sides"];

    // delete markers
    {
        deleteMarkerLocal _x;
    } count GVAR(AllMarkerNames);

    // reset the array
    GVAR(AllMarkerNames) = [];

    if (alive ACE_player && {GVAR(OriginalUnit) getVariable ["ACE_CanSwitchUnits", false]}) then {

        // create markers
        {
            if (([_x] call FUNC(isValidAi) && (side group _x in _sides)) || (_x getVariable [QGVAR(IsPlayerControlled), false])) then {

                private _markerName = str _x;

                private _marker = createMarkerLocal [_markerName, position _x];
                _markerName setMarkerTypeLocal "mil_triangle";
                _markerName setMarkerShapeLocal "ICON";
                _markerName setMarkerSizeLocal [0.5, 0.7];
                _markerName setMarkerDirLocal getDir _x;

                // commy's one liner magic
                private _markerColor = format ["Color%1", side group _x];

                if ((_x getVariable [QGVAR(IsPlayerControlled), false])) then {
                    _markerName setMarkerColorLocal "ColorOrange";
                    _markerName setMarkerTextLocal (_x getVariable [QGVAR(PlayerControlledName), ""]);
                } else {
                    _markerName setMarkerColorLocal _markerColor;
                    _markerName setMarkerTextLocal (getText (configFile >> "CfgVehicles" >> typeOf _x >> "displayName"));
                };

                GVAR(AllMarkerNames) pushBack _markerName;
                nil
            };
        } count allUnits;
    };
}, 1.5, [_sidesToShow]] call CBA_fnc_addPerFrameHandler;
