#include "script_component.hpp"

class CfgPatches {
  class ADDON {
    units[] = {};
    weapons[] = {"ACE_MapTools"};
    requiredVersion = REQUIRED_VERSION;
    requiredAddons[] = {"ace_common", "ace_interaction"};
    author[] = {"KoffeinFlummi","CAA-Picard"};
    authorUrl = "https://github.com/KoffeinFlummi/";
    VERSION_CONFIG;
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

class ACE_Parameters_Numeric {
  GVAR(BFT_Interval) = 1;
};
class ACE_Parameters_Boolean {
  GVAR(EveryoneCanDrawOnBriefing) = 1;
  GVAR(BFT_Enabled) = 0;
  GVAR(BFT_HideAiGroups) = 0;
};

#include "MapGpsUI.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgMarkers.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"


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
