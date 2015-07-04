#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author[] = {""};
        authorUrl = "";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgWeapons.hpp"




class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_Actions {
            class ACE_MainActions {
                class ACE_AddHeadBag1 {
                    displayName = CSTRING(AssignTeamRed);
                    condition = QUOTE(('ace_burlapSack' in Items _target || 'ace_burlapSack' in Items _player) && !(_target getVariable [ARR_2(QGVAR(),true)]));
                    statement = QUOTE([ARR_2(_target,'RED')] call DFUNC(joinTeam));
                    showDisabled = 1;
                    icon = PATHTOF(UI\team\team_red_ca.paa);
                    priority = 2.4;
                    hotkey = "R";
                };
                class ACE_AddHeadBag2 {
                    displayName = CSTRING(AssignTeamGreen);
                    condition = QUOTE(('ace_burlapSack' in Items _target || 'ace_burlapSack' in Items _player) && !(_target getVariable [ARR_2(QGVAR(),true)]));
                    statement = QUOTE([ARR_2(_target,'GREEN')] call DFUNC(joinTeam));
                    showDisabled = 1;
                    icon = PATHTOF(UI\team\team_green_ca.paa);
                    priority = 2.3;
                    hotkey = "G";
                };
                class ACE_AddHeadBag3 {
                    displayName = CSTRING(AssignTeamGreen);
                    condition = QUOTE(('ace_burlapSack' in Items _target || 'ace_burlapSack' in Items _player) && !(_target getVariable [ARR_2(QGVAR(),true)]));
                    statement = QUOTE([ARR_2(_target,'GREEN')] call DFUNC(joinTeam));
                    showDisabled = 1;
                    icon = PATHTOF(UI\team\team_green_ca.paa);
                    priority = 2.3;
                    hotkey = "G";
                };
                class ACE_RemoveHeadBag {
                    displayName = CSTRING(AssignTeamGreen);
                    condition = QUOTE([ARR_2(_player,_target)] call DFUNC(canJoinTeam));
                    statement = QUOTE([ARR_2(_target,'GREEN')] call DFUNC(joinTeam));
                    showDisabled = 1;
                    icon = PATHTOF(UI\team\team_green_ca.paa);
                    priority = 2.3;
                    hotkey = "G";
                };
            };
        };
    };
};
