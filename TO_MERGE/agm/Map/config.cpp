class CfgPatches {
  class AGM_Map {
    units[] = {};
    weapons[] = {"AGM_MapTools"};
    requiredVersion = 0.60;
    requiredAddons[] = {AGM_Core, AGM_Interaction};
    version = "0.95";
    versionStr = "0.95";
    versionAr[] = {0,95,0};
    author[] = {"KoffeinFlummi","CAA-Picard"};
    authorUrl = "https://github.com/KoffeinFlummi/";
  };
};

class CfgFunctions {
  class AGM_Map {
    class AGM_Map {
      file = "AGM_Map\functions";
      class addLineMarker;
      class blueForceTracking;
      class calculateMapScale;
      class cancelDrawing;
      class canDraw;
      class canUseMapTools;
      class canUseMapGPS;
      class copyMapMarkers;
      class handleKeyDown;
      class handleMouseButton;
      class handleMouseMove;
      class handleMouseZChanged;
      class isInsideMapTool;
      class openMapGps;
      class removeLineMarker;
      class sendMapMarkers;
      class updateMapToolMarkers;
      class updateLineMarker;
    };
  };
};

class Extended_PreInit_EventHandlers {
  class AGM_Map {
    serverInit = "call compile preprocessFileLineNumbers '\AGM_Map\serverInit.sqf'";
  };
};

class Extended_PostInit_EventHandlers {
  class AGM_Map {
    clientInit = "call compile preprocessFileLineNumbers 'AGM_Map\clientInit.sqf'";
  };
};

class CfgWeapons {
  class AGM_ItemCore;
  class InventoryItem_Base_F;

  class AGM_MapTools: AGM_ItemCore {
    displayName = "$STR_AGM_MapTools_Name";
    descriptionShort = "$STR_AGM_MapTools_Description";
    model = "\A3\weapons_F\ammo\mag_univ.p3d";
    picture = "\AGM_Map\UI\maptool_item.paa";
    scope = 2;
    class ItemInfo: InventoryItem_Base_F {
      mass = 1;
    };
  };
};

#define MACRO_ADDITEM(ITEM,COUNT) class _xx_##ITEM { \
  name = #ITEM; \
  count = COUNT; \
};

class CfgVehicles {

  class Man;
  class CAManBase: Man {
    class AGM_SelfActions {

      class AGM_MapTools {
        displayName = "$STR_AGM_Map_MapTools_Menu";
        condition = "(call AGM_Map_fnc_canUseMapTools) || (call AGM_Map_fnc_canUseMapGPS)";
        statement = "";
        exceptions[] = {"AGM_Drag_isNotDragging", "AGM_Core_notOnMap"};
        showDisabled = 0;
        priority = 100;
        subMenu[] = {"AGM_MapTools", 1};
        enableInside = 1;

        class AGM_MapToolsHide {
          displayName = "$STR_AGM_Map_MapToolsHide";
          condition = "(call AGM_Map_fnc_canUseMapTools) && {AGM_Map_mapToolsShown > 0}";
          statement = "AGM_Map_mapToolsShown = 0; [] call AGM_Map_fnc_updateMapToolMarkers";
          exceptions[] = {"AGM_Drag_isNotDragging", "AGM_Core_notOnMap"};
          showDisabled = 1;
          priority = 5;
          enableInside = 1;
        };
        class AGM_MapToolsShowNormal {
          displayName = "$STR_AGM_Map_MapToolsShowNormal";
          condition = "(call AGM_Map_fnc_canUseMapTools) && {AGM_Map_mapToolsShown != 1}";
          statement = "AGM_Map_mapToolsShown = 1; [] call AGM_Map_fnc_updateMapToolMarkers";
          exceptions[] = {"AGM_Drag_isNotDragging", "AGM_Core_notOnMap"};
          showDisabled = 1;
          priority = 4;
          enableInside = 1;
        };
        class AGM_MapToolsShowSmall {
          displayName = "$STR_AGM_Map_MapToolsShowSmall";
          condition = "(call AGM_Map_fnc_canUseMapTools) && {AGM_Map_mapToolsShown != 2}";
          statement = "AGM_Map_mapToolsShown = 2; [] call AGM_Map_fnc_updateMapToolMarkers";
          exceptions[] = {"AGM_Drag_isNotDragging", "AGM_Core_notOnMap"};
          showDisabled = 1;
          priority = 3;
          enableInside = 1;
        };
        class AGM_MapToolsAlignNorth {
          displayName = "$STR_AGM_Map_MapToolsAlignNorth";
          condition = "(call AGM_Map_fnc_canUseMapTools) && {AGM_Map_mapToolsShown != 0}";
          statement = "AGM_Map_angle = 0; [] call AGM_Map_fnc_updateMapToolMarkers";
          exceptions[] = {"AGM_Drag_isNotDragging", "AGM_Core_notOnMap"};
          showDisabled = 1;
          priority = 2;
          enableInside = 1;
        };
        class AGM_MapToolsAlignCompass {
          displayName = "$STR_AGM_Map_MapToolsAlignCompass";
          condition = "(call AGM_Map_fnc_canUseMapTools) && {AGM_Map_mapToolsShown != 0} && {(""ItemCompass"" in assignedItems player) || {""ItemGPS"" in assignedItems player}}";
          statement = "AGM_Map_angle = getDir player; [] call AGM_Map_fnc_updateMapToolMarkers";
          exceptions[] = {"AGM_Drag_isNotDragging", "AGM_Core_notOnMap"};
          showDisabled = 1;
          priority = 1;
          enableInside = 1;
        };
        class AGM_MapGpsShow {
          displayName = "$STR_AGM_Map_MapGpsShow";
          condition = "(call AGM_Map_fnc_canUseMapGPS) && {!AGM_Map_mapGpsShow}";
          statement = "AGM_Map_mapGpsShow = true; [AGM_Map_mapGpsShow] call AGM_Map_fnc_openMapGps";
          exceptions[] = {"AGM_Drag_isNotDragging", "AGM_Core_notOnMap"};
          showDisabled = 0;
          priority = 0;
          enableInside = 1;
        };
        class AGM_MapGpsHide {
          displayName = "$STR_AGM_Map_MapGpsHide";
          condition = "(call AGM_Map_fnc_canUseMapGPS) && AGM_Map_mapGpsShow";
          statement = "AGM_Map_mapGpsShow = false; [AGM_Map_mapGpsShow] call AGM_Map_fnc_openMapGps";
          exceptions[] = {"AGM_Drag_isNotDragging", "AGM_Core_notOnMap"};
          showDisabled = 0;
          priority = 0;
          enableInside = 1;
        };
      };
    };

    class AGM_Actions {
      class AGM_CopyMap {
        displayName = "$STR_AGM_Map_CopyMap";
        condition = "isPlayer AGM_Interaction_Target && {""ItemMap"" in assignedItems player} && {""AGM_MapTools"" in items player} && {""ItemMap"" in assignedItems AGM_Interaction_Target}";
        statement = "[player, ""AGM_Map_fnc_sendMapMarkers"", AGM_Interaction_Target] call AGM_Core_fnc_execRemoteFnc";
        showDisabled = 0;
        priority = -1;
      };
    };
  };

  class NATO_Box_Base;
  class EAST_Box_Base;
  class IND_Box_Base;
  class FIA_Box_Base_F;

  class Box_NATO_Support_F: NATO_Box_Base {
    class TransportItems {
      MACRO_ADDITEM(AGM_MapTools,12)
    };
  };

  class Box_East_Support_F: EAST_Box_Base {
    class TransportItems {
      MACRO_ADDITEM(AGM_MapTools,12)
    };
  };

  class Box_IND_Support_F: IND_Box_Base {
    class TransportItems {
      MACRO_ADDITEM(AGM_MapTools,12)
    };
  };

  class Box_FIA_Support_F: FIA_Box_Base_F {
    class TransportItems {
      MACRO_ADDITEM(AGM_MapTools,12)
    };
  };

  class AGM_Box_Misc: Box_NATO_Support_F {
    class TransportItems {
      MACRO_ADDITEM(AGM_MapTools,12)
    };
  };

  class Module_F;
  class AGM_ModuleBlueForceTracking: Module_F {
    author = "AGM Team";
    category = "AGM";
    displayName = "Blue Force Tracking";
    function = "AGM_Map_fnc_blueForceTracking";
    scope = 2;
    isGlobal = 1;
    icon = "\AGM_Map\UI\IconBFTracking_ca.paa";
    class Arguments {
      class Interval {
        displayName = "Interval";
        description = "How often the markers should be refreshed (in seconds)";
        defaultValue = 1;
      };
      class HideAiGroups {
        displayName = "Hide AI groups?";
        description = "Hide markers for 'AI only' groups?";
        typeName = "BOOL";
        class values {
          class Yes { name = "Yes"; value = 1; };
          class No { name = "No"; value = 0; default = 1; };
        };
      };
    };
  };
};

class RscControlsGroup;
class RscActiveText;
class RscPicture;
class RscText;
class RscObject;
class RscButton;
class RscButtonMenuOK;
class RscButtonMenuCancel;
class RscButtonMenu;
class RscEdit;

class RscMapControl {
  sizeExGrid = 0.032;
};

// REGULAR MAP
class RscDisplayMainMap {
  // get rid of the "center to player position" - button (as it works even on elite)
  class controls {
    class TopRight: RscControlsGroup {
      #include "MapControls.hpp"
    };
  };
  // scale up the compass
  class objects {
    class Compass: RscObject {
      scale = 0.7;
      zoomDuration = 0;
    };
  };
};

// DIARY
class RscDisplayDiary {
  // get rid of the "center to player position" - button (as it works even on elite)
  class controls {
    class TopRight: RscControlsGroup {
      class controls {
        class ButtonPlayer: RscActiveText {
          text = "";
          w = 0;
          h = 0;
          sizeEx = 0;
          onButtonClick = "";
        };
        class CA_PlayerName: RscText {
          x = "2 *    ( ((safezoneW / safezoneH) min 1.2) / 40)";
        };
        class ProfilePicture: RscPicture {
          x = "13.5 * ( ((safezoneW / safezoneH) min 1.2) / 40)";
        };
        class ProfileBackground: RscText {
          x = "13.3 * ( ((safezoneW / safezoneH) min 1.2) / 40)";
        };
        class Separator1: RscPicture {
          x = "14.5 * ( ((safezoneW / safezoneH) min 1.2) / 40)";
        };
      };
    };
  };
  // scale up the compass
  class objects {
    class Compass: RscObject {
      scale = 0.7;
      zoomDuration = 0;
    };
  };
};

// BRIEFING SCREEN
class RscDisplayGetReady: RscDisplayMainMap {
  // get rid of the "center to player position" - button (as it works even on elite)
  class controls {
    class TopRight: RscControlsGroup {
      #include "MapControls.hpp"
    };
  };
  // scale up the compass
  class objects {
    class Compass: RscObject {
      scale = 0.7;
      zoomDuration = 0;
    };
  };
};
class RscDisplayClientGetReady: RscDisplayGetReady {
  // get rid of the "center to player position" - button (as it works even on elite)
  class controls {
    class TopRight: RscControlsGroup {
      #include "MapControls.hpp"
    };
  };
  // scale up the compass
  class objects {
    class Compass: RscObject {
      scale = 0.7;
      zoomDuration = 0;
    };
  };
};
class RscDisplayServerGetReady: RscDisplayGetReady {
  // get rid of the "center to player position" - button (as it works even on elite)
  class controls {
    class TopRight: RscControlsGroup {
      #include "MapControls.hpp"
    };
  };
  // scale up the compass
  class objects {
    class Compass: RscObject {
      scale = 0.7;
      zoomDuration = 0;
    };
  };
};

// MARKERS
class CfgMarkers {
  class Flag;

  // Reenable NATO symbols ...
  class b_unknown: Flag {scope = 2;};

  // ... and disable all the useless ones
  // If you think that some of these are needed, create an issue; But until
  // there's a better way to place markers, there should be only the most
  // important markers here.
  // Keep in mind that all of these can still be placed in the editor.
  class b_hq: b_unknown {scope = 1;};
  class b_installation: b_unknown {scope = 1;};
  class b_maint: b_unknown {scope = 1;};
  class b_med: b_unknown {scope = 1;};
  class b_service: b_unknown {scope = 1;};
  class b_support: b_unknown {scope = 1;};

  class n_unknown: b_unknown {};
  class n_hq: n_unknown {scope = 1;};
  class n_installation: n_unknown {scope = 1;};
  class u_installation: n_unknown {scope = 1;}; // i have no idea...
  class n_maint: n_unknown {scope = 1;};
  class n_med: n_unknown {scope = 1;};
  class n_service: n_unknown {scope = 1;};
  class n_support: n_unknown {scope = 1;};

  class o_unknown: b_unknown {};
  class o_hq: o_unknown {scope = 1;};
  class o_installation: o_unknown {scope = 1;};
  class o_maint: o_unknown {scope = 1;};
  class o_med: o_unknown {scope = 1;};
  class o_service: o_unknown {scope = 1;};
  class o_support: o_unknown {scope = 1;};

  // disable all civy markers (harbor etc.)
  class c_unknown: b_unknown {scope = 1;};

  // disable quantity indicators (fire team/squad/platoon ...)
  class group_0: b_unknown {scope = 1;};


  class AGM_MapToolFixed {
    name = "MapToolFixed";
    icon = "\AGM_Map\data\mapToolFixed.paa";
    scope = 0;
    color[] = {1,1,1,1};
    size = 32;
  };

  class AGM_MapToolRotatingNormal {
    name = "MapToolRotating";
    icon = "\AGM_Map\data\mapToolRotatingNormal.paa";
    scope = 0;
    color[] = {1,1,1,1};
    size = 32;
  };

  class AGM_MapToolRotatingSmall {
    name = "MapToolRotating";
    icon = "\AGM_Map\data\mapToolRotatingSmall.paa";
    scope = 0;
    color[] = {1,1,1,1};
    size = 32;
  };
};

class AGM_Parameters_Numeric {
  AGM_Map_BFT_Interval = 1;
};
class AGM_Parameters_Boolean {
  AGM_Map_EveryoneCanDrawOnBriefing = 1;
  AGM_Map_BFT_Enabled = 0;
  AGM_Map_BFT_HideAiGroups = 0;
};

#include "MapGpsUI.hpp"
