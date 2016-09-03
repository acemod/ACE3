#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

GVAR(editingDraw) = -1;
GVAR(editingDraw_editBFT) = -1;
GVAR(editkeydown) = false;
GVAR(mousebuttondown) = false;
GVAR(mousepos) = [0,0];
GVAR(mouseover) = [-1,[]];
GVAR(selection) = ["",[]];

// register drawing with all main-maps (including briefing)
// ToDo: make stuff here switchable via module settings
["mapDisplayLoaded",{
    [(_this select 0) displayCtrl 51] call FUNC(doBFTDraw);
    // if we are loading the briefing screens set up encryption keys and register reporting channels
    if ((_this select 1) != "Ingame") then {
        // only continue if the main map hasn't loaded yet
        if (isNull (findDisplay 12)) then {
            [[player] call EFUNC(bft,getEncryptionKey)] call EFUNC(bft,updateRegisteredEncryptionKeys);
            [EGVAR(bft,allReportingModes)] call EFUNC(bft,updateRegisteredModes);
            [true,5] call FUNC(updateAvailableDevicesPosition);
        };
    } else {
        // once the main map loads in (i.e. briefing is done with), shut down the positional update loop
        [false] call FUNC(updateAvailableDevicesPosition);
    };
}] call EFUNC(common,addEventHandler);

ADDON = true;
