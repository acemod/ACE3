class CfgPatches {
  class AGM_Markers {
    units[] = {};
    weapons[] = {};
    requiredVersion = 0.60;
    requiredAddons[] = {AGM_Core};
    version = "0.95";
    versionStr = "0.95";
    versionAr[] = {0,95,0};
    author[] = {"commy2"};
    authorUrl = "https://github.com/commy2/";
  };
};

class CfgFunctions {
  class AGM_Markers {
    class AGM_Markers {
      file = "AGM_Markers\functions";
      class onLBSelChangedColor;
      class onLBSelChangedShape;
      class onSliderPosChangedAngle;
      class sendMarkersJIP;
      class setMarker;
      class setMarkerJIP;
      class setMarkerNetwork;
    };
  };
};

class Extended_PostInit_EventHandlers {
  class AGM_Markers {
    clientInit = "call compile preprocessFileLineNumbers 'AGM_Markers\clientInit.sqf'";
  };
};

class RscPicture;
class RscText;
class RscStructuredText;
class RscButtonMenuOK;
class RscButtonMenuCancel;
class RscButtonMenu;
class RscEdit;
class RscCombo;
class RscSlider;
class RscXSliderH;

#include <InsertMarker.hpp>
