#define MACRO_ADDITEM(ITEM,COUNT) class _xx_##ITEM { \
    name = #ITEM; \
    count = COUNT; \
  };

class CfgVehicles {
  class Man;
  class CAManBase: Man {
    class ACE_SelfActions {

      class ACE_MapTools {
        displayName = "$STR_ACE_Map_MapTools_Menu";
        condition = "(call ACE_Map_fnc_canUseMapTools) || (call ACE_Map_fnc_canUseMapGPS)";
        statement = "";
        exceptions[] = {"ACE_Drag_isNotDragging", "ACE_Core_notOnMap"};
        showDisabled = 0;
        priority = 100;
        subMenu[] = {"ACE_MapTools", 1};
        enableInside = 1;

        class ACE_MapToolsHide {
          displayName = "$STR_ACE_Map_MapToolsHide";
          condition = "(call ACE_Map_fnc_canUseMapTools) && {ACE_Map_mapToolsShown > 0}";
          statement = "ACE_Map_mapToolsShown = 0; [] call ACE_Map_fnc_updateMapToolMarkers";
          exceptions[] = {"ACE_Drag_isNotDragging", "ACE_Core_notOnMap"};
          showDisabled = 1;
          priority = 5;
          enableInside = 1;
        };
        class ACE_MapToolsShowNormal {
          displayName = "$STR_ACE_Map_MapToolsShowNormal";
          condition = "(call ACE_Map_fnc_canUseMapTools) && {ACE_Map_mapToolsShown != 1}";
          statement = "ACE_Map_mapToolsShown = 1; [] call ACE_Map_fnc_updateMapToolMarkers";
          exceptions[] = {"ACE_Drag_isNotDragging", "ACE_Core_notOnMap"};
          showDisabled = 1;
          priority = 4;
          enableInside = 1;
        };
        class ACE_MapToolsShowSmall {
          displayName = "$STR_ACE_Map_MapToolsShowSmall";
          condition = "(call ACE_Map_fnc_canUseMapTools) && {ACE_Map_mapToolsShown != 2}";
          statement = "ACE_Map_mapToolsShown = 2; [] call ACE_Map_fnc_updateMapToolMarkers";
          exceptions[] = {"ACE_Drag_isNotDragging", "ACE_Core_notOnMap"};
          showDisabled = 1;
          priority = 3;
          enableInside = 1;
        };
        class ACE_MapToolsAlignNorth {
          displayName = "$STR_ACE_Map_MapToolsAlignNorth";
          condition = "(call ACE_Map_fnc_canUseMapTools) && {ACE_Map_mapToolsShown != 0}";
          statement = "ACE_Map_angle = 0; [] call ACE_Map_fnc_updateMapToolMarkers";
          exceptions[] = {"ACE_Drag_isNotDragging", "ACE_Core_notOnMap"};
          showDisabled = 1;
          priority = 2;
          enableInside = 1;
        };
        class ACE_MapToolsAlignCompass {
          displayName = "$STR_ACE_Map_MapToolsAlignCompass";
          condition = "(call ACE_Map_fnc_canUseMapTools) && {ACE_Map_mapToolsShown != 0} && {(""ItemCompass"" in assignedItems player) || {""ItemGPS"" in assignedItems player}}";
          statement = "ACE_Map_angle = getDir player; [] call ACE_Map_fnc_updateMapToolMarkers";
          exceptions[] = {"ACE_Drag_isNotDragging", "ACE_Core_notOnMap"};
          showDisabled = 1;
          priority = 1;
          enableInside = 1;
        };
        class ACE_MapGpsShow {
          displayName = "$STR_ACE_Map_MapGpsShow";
          condition = "(call ACE_Map_fnc_canUseMapGPS) && {!ACE_Map_mapGpsShow}";
          statement = "ACE_Map_mapGpsShow = true; [ACE_Map_mapGpsShow] call ACE_Map_fnc_openMapGps";
          exceptions[] = {"ACE_Drag_isNotDragging", "ACE_Core_notOnMap"};
          showDisabled = 0;
          priority = 0;
          enableInside = 1;
        };
        class ACE_MapGpsHide {
          displayName = "$STR_ACE_Map_MapGpsHide";
          condition = "(call ACE_Map_fnc_canUseMapGPS) && ACE_Map_mapGpsShow";
          statement = "ACE_Map_mapGpsShow = false; [ACE_Map_mapGpsShow] call ACE_Map_fnc_openMapGps";
          exceptions[] = {"ACE_Drag_isNotDragging", "ACE_Core_notOnMap"};
          showDisabled = 0;
          priority = 0;
          enableInside = 1;
        };
      };
    };

    class ACE_Actions {
      class ACE_CopyMap {
        displayName = "$STR_ACE_Map_CopyMap";
        condition = "isPlayer ACE_Interaction_Target && {""ItemMap"" in assignedItems player} && {""ACE_MapTools"" in items player} && {""ItemMap"" in assignedItems ACE_Interaction_Target}";
        statement = "[player, ""ACE_Map_fnc_sendMapMarkers"", ACE_Interaction_Target] call ACE_Core_fnc_execRemoteFnc";
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
      MACRO_ADDITEM(ACE_MapTools,12)
    };
  };

  class Box_East_Support_F: EAST_Box_Base {
    class TransportItems {
      MACRO_ADDITEM(ACE_MapTools,12)
    };
  };

  class Box_IND_Support_F: IND_Box_Base {
    class TransportItems {
      MACRO_ADDITEM(ACE_MapTools,12)
    };
  };

  class Box_FIA_Support_F: FIA_Box_Base_F {
    class TransportItems {
      MACRO_ADDITEM(ACE_MapTools,12)
    };
  };

  class ACE_Box_Misc: Box_NATO_Support_F {
    class TransportItems {
      MACRO_ADDITEM(ACE_MapTools,12)
    };
  };

  class Module_F;
  class ACE_ModuleBlueForceTracking: Module_F {
    author = "ACE Team";
    category = "ACE";
    displayName = "Blue Force Tracking";
    function = "ACE_Map_fnc_blueForceTracking";
    scope = 2;
    isGlobal = 1;
    icon = "\ACE_Map\UI\IconBFTracking_ca.paa";
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
