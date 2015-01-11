class CfgPatches {
  class AGM_Scopes {
    units[] = {};
    weapons[] = {};
    requiredVersion = 0.60;
    requiredAddons[] = {AGM_Core};
    version = "0.95";
    versionStr = "0.95";
    versionAr[] = {0,95,0};
    author[] = {"KoffeinFlummi"};
    authorUrl = "https://github.com/KoffeinFlummi";
  };
};

class CfgFunctions {
  class AGM_Scopes {
    class AGM_Scopes {
      file = "AGM_Scopes\functions";
      class adjustScope;
      class canAdjustScope;
      class firedEH;
      class getOptics;
      class hideZeroing;
      class inventoryCheck;
    };
  };
};

class Extended_PostInit_EventHandlers {
  class AGM_Scopes {
    clientInit = "call compile preprocessFileLineNumbers '\AGM_Scopes\clientInit.sqf';";
  };
};

class Extended_Fired_EventHandlers {
  class CAManBase {
    class AGM_Scopes {
      clientFired = "if (_this select 0 == AGM_player) then {_this call AGM_Scopes_fnc_firedEH};";
    };
  };
};

class Extended_Take_EventHandlers {
  class CAManBase {
    class AGM_Scopes {
      clientTake = "if (_this select 0 == AGM_player) then {_this call AGM_Scopes_fnc_inventoryCheck};";
    };
  };
};

class Extended_Put_EventHandlers {
  class CAManBase {
    class AGM_Scopes {
      clientPut = "if (_this select 0 == AGM_player) then {_this call AGM_Scopes_fnc_inventoryCheck};";
    };
  };
};

class Extended_InitPost_EventHandlers {
  class CAManBase {
    class AGM_Scopes {
      init = "if (_this select 0 == call AGM_Core_fnc_player) then {_this call AGM_Scopes_fnc_inventoryCheck};";
    };
  };
};

class Extended_Respawn_EventHandlers {
  class CAManBase {
    class AGM_Scopes {
      respawn = "if (_this select 0 == call AGM_Core_fnc_player) then {_this call AGM_Scopes_fnc_inventoryCheck};";
    };
  };
};

class AGM_Core_Default_Keys {
  class adjustScopeUp {
    displayName = "$STR_AGM_Scopes_AdjustUp";
    condition = "[_player] call AGM_Scopes_fnc_inventoryCheck; [_player, 0, 0.1] call AGM_Scopes_fnc_canAdjustScope";
    statement = "[_player, 0, 0.1] call AGM_Scopes_fnc_adjustScope;";
    allowHolding = 1;
    key = 201;
    shift = 0;
    control = 0;
    alt = 0;
  };
  class adjustScopeDown: adjustScopeUp {
    displayName = "$STR_AGM_Scopes_AdjustDown";
    condition = "[_player] call AGM_Scopes_fnc_inventoryCheck; [_player, 0, -0.1] call AGM_Scopes_fnc_canAdjustScope";
    statement = "[_player, 0, -0.1] call AGM_Scopes_fnc_adjustScope;";
    key = 209;
  };
  class adjustScopeLeft: adjustScopeUp {
    displayName = "$STR_AGM_Scopes_AdjustLeft";
    condition = "[_player] call AGM_Scopes_fnc_inventoryCheck; [_player, -0.1, 0] call AGM_Scopes_fnc_canAdjustScope";
    statement = "[_player, -0.1, 0] call AGM_Scopes_fnc_adjustScope;";
    key = 209;
    control = 1;
  };
  class adjustScopeRight: adjustScopeLeft {
    displayName = "$STR_AGM_Scopes_AdjustRight";
    condition = "[_player] call AGM_Scopes_fnc_inventoryCheck; [_player, 0.1, 0] call AGM_Scopes_fnc_canAdjustScope";
    statement = "[_player, 0.1, 0] call AGM_Scopes_fnc_adjustScope;";
    key = 201;
  };
};

class CfgSounds {
  class AGM_Sound_Click;
  class AGM_Scopes_Click_1: AGM_Sound_Click {
    sound[] = {"\AGM_Scopes\sounds\agm_scopes_click.wav", 3, 2, 200};
  };
  class AGM_Scopes_Click_2: AGM_Scopes_Click_1 {
    sound[] = {"\AGM_Scopes\sounds\agm_scopes_click.wav", 3.3, 1.8, 200};
  };
  class AGM_Scopes_Click_3: AGM_Scopes_Click_1 {
    sound[] = {"\AGM_Scopes\sounds\agm_scopes_click.wav", 2.8, 2.3, 200};
  };
};

class CfgWeapons {
  class ItemCore;
  class InventoryOpticsItem_Base_F;

  class optic_LRPS: ItemCore {
    AGM_ScopeAdjust_Horizontal[] = {-50,50};
    AGM_ScopeAdjust_Vertical[] = {-70,70};
    class ItemInfo: InventoryOpticsItem_Base_F {
      class OpticsModes {
        class Snip {
          discreteDistance[] = {1};
          discreteDistanceInitIndex = 0;
        };
      };
    };
  };

  class optic_SOS: ItemCore {
    AGM_ScopeAdjust_Horizontal[] = {-50,50};
    AGM_ScopeAdjust_Vertical[] = {-60,60};
    class ItemInfo: InventoryOpticsItem_Base_F {
      class OpticsModes {
        class Snip {
          discreteDistance[] = {1};
          discreteDistanceInitIndex = 0;
        };
      };
    };
  };

  class optic_DMS: ItemCore {
    AGM_ScopeAdjust_Horizontal[] = {-40,40};
    AGM_ScopeAdjust_Vertical[] = {-40,40};
    class ItemInfo: InventoryOpticsItem_Base_F {
      class OpticsModes {
        class Snip {
          discreteDistance[] = {1};
          discreteDistanceInitIndex = 0;
        };
      };
    };
  };
};

class RscTitles {
  class AGM_Scope_Zeroing {
    idd = -1;
    movingEnable = 0;
    enableSimulation = 1;
    enableDisplay = 1;
    onLoad = "_this spawn compile preprocessFileLineNumbers '\AGM_Scopes\scripts\zeroingOnLoad.sqf'; uiNamespace setVariable ['AGM_Scope_Debug', _this];";
    duration = 1e+011;
    fadein = 0;
    fadeout = 0;
    name = "AGM_Scope_Zeroing";
    class RscPicture;
    class RscText;
    class controls {
      class AGM_Scope_Zeroing_BG: RscPicture {
        idc = 925001;
        type = 0;
        text = "AGM_Scopes\UI\scopes_bg.paa";
        style = 48 + 0x800;
        scale = 1;
        sizeEx = 1;
        font = "PuristaMedium";
        colorText[] = {1,1,1,1};
        colorBackground[] = {1,1,1,1};
        shadow = 1;

        x = (0.5-0.4/2) * safezoneW + safezoneX;
        y = 0 * safezoneH + safezoneY;
        w = 0.4 * safezoneW;
        h = 0.3 * safezoneH;
      };
      class AGM_Scope_Zeroing_Vertical: RscText {
        idc = 925002;
        type = 0;
        style = 2;
        sizeEx = 0.04;
        lineSpacing = 1;
        font = "PuristaMedium";
        text = "";
        colorText[] = {1,1,1, 0.9};
        colorBackground[] = {1,0,0, 0};
        shadow = 0;

        x = (0.5-0.4/2 + 0.45*0.4) * safezoneW + safezoneX;
        y = (0 + 0.19*0.3) * safezoneH + safezoneY;
        w = 0.04 * safezoneW;
        h = 0.025 * safezoneH;
      };
      class AGM_Scope_Zeroing_Horizontal: RscText {
        idc = 925003;
        type = 0;
        style = 0;
        sizeEx = 0.04;
        lineSpacing = 1;
        font = "PuristaMedium";
        text = "";
        colorText[] = {1,1,1, 0.9};
        colorBackground[] = {1,0,0, 0};
        shadow = 0;

        x = (0.5-0.4/2 + 0.6*0.4) * safezoneW + safezoneX;
        y = (0 + 0.47*0.3) * safezoneH + safezoneY;
        w = 0.04 * safezoneW;
        h = 0.025 * safezoneH;
      };
    };
  };
};

class RscInGameUI {
  class RscUnitInfo;
  class RscWeaponZeroing: RscUnitInfo {
    onLoad = "[""onLoad"",_this,""RscUnitInfo"",'IGUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""; uiNamespace setVariable ['AGM_dlgWeaponZeroing', _this select 0];";
  };
};
