#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

// set dummy world size and mapScaleFactor, will be overridden once main map loads
GVAR(worldSize) = 8192;
GVAR(mapScaleFactor) = GVAR(worldSize) / 2666.65;

["mapDisplayLoaded",{
    if ((_this select 1) == "Ingame") then {
        /*
         * Figure out the scaling factor based on the current map (island) being played
         */
        private _ctrlMap = (_this select 0) displayCtrl 51;
        private _mapPos1 = _ctrlMap ctrlMapScreenToWorld [0, 0];
        private _mapPos2 = _ctrlMap ctrlMapScreenToWorld [1, 0];
        _mapPos1 set [2, 0];
        _mapPos2 set [2, 0];
        GVAR(worldSize) = round ((_mapPos1 vectorDistance _mapPos2) / ctrlMapScale _ctrlMap);
        // still need to figure out if this is really required and how I actually got to this number (too long ago!)
        GVAR(mapScaleFactor) = GVAR(worldSize) / 2666.65;
    };
}] call EFUNC(common,addEventHandler);

ADDON = true;
