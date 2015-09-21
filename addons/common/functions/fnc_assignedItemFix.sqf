/*
 * Author: commy2
 * Initialized the assigned item fix.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Public : No
 */
#include "script_component.hpp"

private "_config";

ACE_isMapEnabled     = call {_config = missionConfigFile >> "showMap";     !isNumber _config || {getNumber _config == 1}};  // default value is 1, so do isNumber check first
ACE_isCompassEnabled = call {_config = missionConfigFile >> "showCompass"; !isNumber _config || {getNumber _config == 1}};
ACE_isWatchEnabled   = call {_config = missionConfigFile >> "showWatch";   !isNumber _config || {getNumber _config == 1}};
ACE_isRadioEnabled   = call {_config = missionConfigFile >> "showRadio";   !isNumber _config || {getNumber _config == 1}};
ACE_isGPSEnabled     = call {_config = missionConfigFile >> "showGPS";     !isNumber _config || {getNumber _config == 1}};

GVAR(AssignedItems) = [];
GVAR(AssignedItemsInfo) = [];
GVAR(AssignedItemsShownItems) = [
    ACE_isMapEnabled,
    ACE_isCompassEnabled,
    ACE_isWatchEnabled,
    ACE_isRadioEnabled,
    ACE_isGPSEnabled
];

["playerInventoryChanged", {
    params ["_unit", "_assignedItems"];

    _assignedItems = _assignedItems select 17;

    {
        if !(_x in GVAR(AssignedItems)) then {
            GVAR(AssignedItems) pushBack _x;
            GVAR(AssignedItemsInfo) pushBack toLower getText (configFile >> "CfgWeapons" >> _x >> "ACE_hideItemType");
        };

        switch (GVAR(AssignedItemsInfo) select (GVAR(AssignedItems) find _x)) do {
            case ("map"): {
                GVAR(AssignedItemsShownItems) set [0, false];
            };
            case ("compass"): {
                GVAR(AssignedItemsShownItems) set [1, false];
            };
            case ("watch"): {
                GVAR(AssignedItemsShownItems) set [2, false];
            };
            case ("radio"): {
                GVAR(AssignedItemsShownItems) set [3, false];
            };
            case ("gps"): {
                GVAR(AssignedItemsShownItems) set [4, false];
            };
        };
        false
    } count _assignedItems;

    //systemChat str GVAR(AssignedItemsShownItems);

    GVAR(AssignedItemsShownItems) params ["_showMap", "_showCompass", "_showWatch", "_showRadio", "_showGPS"];

    showMap _showMap;
    showCompass _showCompass;
    showWatch _showWatch;
    showRadio _showRadio;
    showGPS (_showGPS || {cameraOn == getConnectedUAV _unit});  //If player is activly controling a UAV, showGPS controls showing the map (m key)
}] call FUNC(addEventHandler);
