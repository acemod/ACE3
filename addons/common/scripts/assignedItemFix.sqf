/*
 * Author: commy2
 *
 * ?
 *
 * Arguments:
 * ?
 *
 * Return value:
 * ?
 *
 * Public : No
 */
#include "script_component.hpp"

private ["_config"];

ACE_isMapEnabled     = call {_config = missionConfigFile >> "showMap";     !isNumber _config || {getNumber _config == 1}};  // default value is 1, so do isNumber check first
ACE_isCompassEnabled = call {_config = missionConfigFile >> "showCompass"; !isNumber _config || {getNumber _config == 1}};
ACE_isWatchEnabled   = call {_config = missionConfigFile >> "showWatch";   !isNumber _config || {getNumber _config == 1}};
ACE_isRadioEnabled   = call {_config = missionConfigFile >> "showRadio";   !isNumber _config || {getNumber _config == 1}};
ACE_isGPSEnabled     = call {_config = missionConfigFile >> "showGPS";     !isNumber _config || {getNumber _config == 1}};

GVAR(AssignedItems) = [];
GVAR(AssignedItemsInfo) = [];

["playerInventoryChanged", {
    private ["_assignedItems", "_shownItems"];
    params ["_unit", "_items"];
    _assignedItems = _items select 17;

    _shownItems = [
        ACE_isMapEnabled,
        ACE_isCompassEnabled,
        ACE_isWatchEnabled,
        ACE_isRadioEnabled,
        ACE_isGPSEnabled
    ];

    {
        if !(_x in GVAR(AssignedItems)) then {
            GVAR(AssignedItems) pushBack _x;
            GVAR(AssignedItemsInfo) pushBack toLower getText (configFile >> "CfgWeapons" >> _x >> "ACE_hideItemType")
        };

        private "_hideItemType";
        _hideItemType = GVAR(AssignedItemsInfo) select (GVAR(AssignedItems) find _x);

        switch (_hideItemType) do {
            case ("map"): {
                _shownItems set [0, false];
            };
            case ("compass"): {
                _shownItems set [1, false];
            };
            case ("watch"): {
                _shownItems set [2, false];
            };
            case ("radio"): {
                _shownItems set [3, false];
            };
            case ("gps"): {
                _shownItems set [4, false];
            };
        };
        true
    } count _assignedItems;

    //systemChat str _shownItems;
    _shownItems params ["_showMap", "_showCompass", "_showWatch", "_showRadio", "_showGPS"]
    showMap _showMap;
    showCompass _showCompass;
    showWatch _showWatch;
    showRadio _showRadio;
    showGPS (_showGPS || {cameraOn == getConnectedUAV _unit});  //If player is activly controling a UAV, showGPS controls showing the map (m key)
}] call FUNC(addEventHandler);
