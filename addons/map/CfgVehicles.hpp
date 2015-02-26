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
        condition = QUOTE((call FUNC(canUseMapTools) || {call FUNC(canUseMapGPS)}));
        statement = "";
        exceptions[] = {"ACE_Drag_isNotDragging", QEGVAR(common,notOnMap)};
        showDisabled = 0;
        priority = 100;
        subMenu[] = {"ACE_MapTools", 1};
        enableInside = 1;

        class ACE_MapToolsHide {
          displayName = "$STR_ACE_Map_MapToolsHide";
          condition = QUOTE((call FUNC(canUseMapTools) && {GVAR(mapTool_Shown) != 0}));
          statement = QUOTE(GVAR(mapTool_Shown) = 0; [] call FUNC(updateMapToolMarkers));
          exceptions[] = {"ACE_Drag_isNotDragging", QEGVAR(common,notOnMap)};
          showDisabled = 1;
          priority = 5;
          enableInside = 1;
        };
        class ACE_MapToolsShowNormal {
          displayName = "$STR_ACE_Map_MapToolsShowNormal";
          condition = QUOTE((call FUNC(canUseMapTools) && {GVAR(mapTool_Shown) != 1}));
          statement = QUOTE(GVAR(mapTool_Shown) = 1; [] call FUNC(updateMapToolMarkers));
          exceptions[] = {"ACE_Drag_isNotDragging", QEGVAR(common,notOnMap)};
          showDisabled = 1;
          priority = 4;
          enableInside = 1;
        };
        class ACE_MapToolsShowSmall {
          displayName = "$STR_ACE_Map_MapToolsShowSmall";
          condition = QUOTE((call FUNC(canUseMapTools) && {GVAR(mapTool_Shown) != 2}));
          statement = QUOTE(GVAR(mapTool_Shown) = 2; [] call FUNC(updateMapToolMarkers));
          exceptions[] = {"ACE_Drag_isNotDragging", QEGVAR(common,notOnMap)};
          showDisabled = 1;
          priority = 3;
          enableInside = 1;
        };
        class ACE_MapToolsAlignNorth {
          displayName = "$STR_ACE_Map_MapToolsAlignNorth";
          condition = QUOTE((call FUNC(canUseMapTools) && {GVAR(mapTool_Shown) != 0}));
          statement = QUOTE(GVAR(mapTool_angle) = 0; [] call FUNC(updateMapToolMarkers));
          exceptions[] = {"ACE_Drag_isNotDragging", QEGVAR(common,notOnMap)};
          showDisabled = 1;
          priority = 2;
          enableInside = 1;
        };
        class ACE_MapToolsAlignCompass {
          displayName = "$STR_ACE_Map_MapToolsAlignCompass";
          condition = QUOTE((call FUNC(canUseMapTools) && {GVAR(mapTool_Shown) != 0} && {('ItemCompass' in assigneditems ACE_player) || {'ItemCompass' in assigneditems ACE_player}}));
          statement = QUOTE(GVAR(mapTool_angle) = getDir ACE_player; [] call FUNC(updateMapToolMarkers));
          exceptions[] = {"ACE_Drag_isNotDragging", QEGVAR(common,notOnMap)};
          showDisabled = 1;
          priority = 1;
          enableInside = 1;
        };
        class ACE_MapGpsShow {
          displayName = "$STR_ACE_Map_MapGpsShow";
          condition = QUOTE((call FUNC(canUseMapGPS) && {!GVAR(mapGpsShow)}));
          statement = QUOTE(GVAR(mapGpsShow) = true; [GVAR(mapGpsShow)] call FUNC(openMapGps));
          exceptions[] = {"ACE_Drag_isNotDragging", QEGVAR(common,notOnMap)};
          showDisabled = 0;
          priority = 0;
          enableInside = 1;
        };
        class ACE_MapGpsHide {
          displayName = "$STR_ACE_Map_MapGpsHide";
          condition = QUOTE((call FUNC(canUseMapGPS) && {GVAR(mapGpsShow)}));
          statement = QUOTE(GVAR(mapGpsShow) = false; [GVAR(mapGpsShow)] call FUNC(openMapGps));
          exceptions[] = {"ACE_Drag_isNotDragging", QEGVAR(common,notOnMap)};
          showDisabled = 0;
          priority = 0;
          enableInside = 1;
        };
      };
    };

    class ACE_Actions {
      class ACE_MainActions {
        class ACE_CopyMap {
          displayName = "$STR_ACE_Map_CopyMap";
          condition = QUOTE(([_target] call EFUNC(common,isPlayer) && {'ItemMap' in assigneditems _player} && {'ACE_MapTools' in items _player} && {'ItemMap' in assignedItems _target}));
          statement = QUOTE([ARR_2(_player,_target)] call FUNC(copyMapStart));
          showDisabled = 0;
          priority = -1;
        };
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
    author = "$STR_ACE_Common_ACETeam";
    category = "ACE";
    displayName = "Blue Force Tracking";
    function = QFUNC(blueForceTrackingModule);
    scope = 2;
    isGlobal = 1;
    icon = PATHTOF(UI\IconBFTracking_ca.paa);
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
