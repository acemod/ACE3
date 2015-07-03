#include "script_component.hpp"

ADDON = false;

// Function PREP (caching)
PREP(addNotification);
PREP(centerMapOnPlayerPosition);
PREP(createHelmetCam);
PREP(createUavCam);
PREP(ctrlMapCenter);
PREP(currentTime);
PREP(decBrightness);
PREP(decTextSize);
PREP(degreeToOctant);
PREP(deleteHelmetCam);
PREP(deleteUavCam);
PREP(dirTo);
PREP(distance2D);
PREP(getBackgroundPosition);
PREP(getInterfaceSettingsFromConfig);
PREP(getSettings);
PREP(ifClose);
PREP(ifOnDrawBFT);
PREP(ifOnKeyDown);
PREP(ifOnLBSelChanged);
PREP(ifOnLoad);
PREP(ifOnMouseButtonUp);
PREP(ifOnUnload);
PREP(ifOpen);
PREP(ifUpdate);
PREP(incBrightness);
PREP(incTextsize);
PREP(isDialog);
PREP(msgGuiLoad);
PREP(onIfToggleKey);
PREP(onIfTogglePositionKey);
PREP(onIfZoomKey);
PREP(onPlayerChanged);
PREP(processNotifications);
PREP(remoteControlUAV);
PREP(setInterfacePosition);
PREP(setSettings);
PREP(toggleIconText);
PREP(toggleInterfaceMode);
PREP(toggleMapMenu);
PREP(toggleMapTools);
PREP(toggleMapType);
PREP(toggleNightMode);
PREP(updateHCamList);
PREP(updateTextAndIconSize);
PREP(updateUAVList);

// set dummy world size and mapScaleFactor, will be overridden once main map loads
GVAR(worldSize) = 8192;
GVAR(mapScaleFactor) = GVAR(worldSize) / 2666.65;

["mapDisplayLoaded",{
    if ((_this select 1) == "Ingame") then {
        /*
         * Figure out the scaling factor based on the current map (island) being played
         */
        _ctrlMap = (_this select 0) displayCtrl 51;
        _mapPos1 = _ctrlMap ctrlmapscreentoworld [0,0];
        _mapPos2 = _ctrlMap ctrlmapscreentoworld [1,0];
        _mapPos1 set [2,0];  _mapPos2 set [2,0];
        GVAR(worldSize) = round ((_mapPos1 vectordistance _mapPos2) / ctrlmapscale _ctrlMap);
        // still need to figure out if this is really required and how I actually got to this number (too long ago!)
        GVAR(mapScaleFactor) = GVAR(worldSize) / 2666.65;
    };
}] call EFUNC(common,addEventHandler);

ADDON = true;
