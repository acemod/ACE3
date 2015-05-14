// by commy2
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
    private ["_unit", "_assignedItems", "_shownItems"];

    _unit = _this select 0;
    _assignedItems = _this select 1 select 17;

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
    } forEach _assignedItems;

    //systemChat str _shownItems;

    showMap     (_shownItems select 0);
    showCompass (_shownItems select 1);
    showWatch   (_shownItems select 2);
    showRadio   (_shownItems select 3);
    showGPS     (_shownItems select 4 || {cameraOn == getConnectedUAV _unit});  //If player is activly controling a UAV, showGPS controls showing the map (m key)
}] call FUNC(addEventHandler);
