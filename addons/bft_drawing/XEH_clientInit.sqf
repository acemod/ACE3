#include "script_component.hpp"

// bail if running on HC
if (!hasInterface) exitWith {};

// setup draw size variables
[1] call FUNC(updateDrawSize);
[true] call FUNC(setDrawText);

/*
// register with reporting channels when map is opened
["visibleMapChanged",{
    params ["", "_mapIsVisible"];
    
    if (_mapIsVisible) then {
        // set icon size back to default
        [1] call FUNC(updateDrawSize);
        [true] call FUNC(setDrawText);
        // register reporting modes
        [EGVAR(bft,allReportingModes)] call EFUNC(bft,updateRegisteredModes);
        // set encryption key
        [[ACE_player] call EFUNC(bft,getEncryptionKey)] call EFUNC(bft,updateRegisteredEncryptionKeys);
        // start update loop
        [true,5] call EFUNC(bft,updateAvailableDevicesPosition);
    } else {
        [false] call EFUNC(bft,updateAvailableDevicesPosition);
    };
}] call EFUNC(common,addEventHandler);*/
