#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = 0.60;
        requiredAddons[] = { "ace_main", "ace_common" };
        version = QUOTE(VERSION);
        versionStr = QUOTE(VERSION);
        versionAr[] = { VERSION_AR };
        author[] = {"KoffeinFlummi"};
        authorUrl = "https://github.com/KoffeinFlummi";
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgSounds.hpp"
#include "CfgWeapons.hpp"

class ACE_Default_Keys {
    class adjustScopeUp {
        displayName = "$STR_ACE_Scopes_AdjustUp";
        condition = QUOTE([_player] call FUNC(inventoryCheck); [_player, 0, 0.1] call FUNC(canAdjustScope));
        statement = QUOTE([_player, 0, 0.1] call FUNC(adjustScope));
        allowHolding = 1;
        key = 201;
        shift = 0;
        control = 0;
        alt = 0;
    };
    class adjustScopeDown: adjustScopeUp {
        displayName = "$STR_ACE_Scopes_AdjustDown";
        condition = QUOTE([_player] call FUNC(inventoryCheck); [_player, 0, -0.1] call FUNC(canAdjustScope));
        statement = QUOTE([_player, 0, -0.1] call FUNC(adjustScope));
        key = 209;
    };
    class adjustScopeLeft: adjustScopeUp {
        displayName = "$STR_ACE_Scopes_AdjustLeft";
        condition = QUOTE([_player] call FUNC(inventoryCheck); [_player, -0.1, 0] call FUNC(canAdjustScope));
        statement = QUOTE([_player, -0.1, 0] call FUNC(adjustScope));
        key = 209;
        control = 1;
    };
    class adjustScopeRight: adjustScopeLeft {
        displayName = "$STR_ACE_Scopes_AdjustRight";
        condition = QUOTE([_player] call FUNC(inventoryCheck); [_player, 0.1, 0] call FUNC(canAdjustScope));
        statement = QUOTE([_player, 0.1, 0] call FUNC(adjustScope));
        key = 201;
    };
};

#include "RscTitles.hpp"
#include "RscInGameUI.hpp"
