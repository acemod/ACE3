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
                    displayName = "Add Headbag";
                    condition = QUOTE(('ace_burlapSack' in Items _target || 'ace_burlapSack' in Items _player) && !(_target getVariable [ARR_2(QGVAR(wearHeadBag),true)]));
                    statement = QUOTE([ARR_3(player,_target,"ace_burlapSack")] call DFUNC(addHead));
                    showDisabled = 1;
                    //icon = PATHTOF(UI\team\team_red_ca.paa); //@todo
                    priority = 2.4;
                    hotkey = "R";
                };
                class ACE_AddHeadBag2 {
                    displayName = "Add Headbag (FuckOf)";
                    condition = QUOTE(('ace_burlapSack_FuckOf' in Items _target || 'ace_burlapSack_FuckOf' in Items _player) && !(_target getVariable [ARR_2(QGVAR(wearHeadBag),true)]));
                    statement = QUOTE([ARR_3(player,_target,"ace_burlapSack_FuckOf")] call DFUNC(addHead));
                    showDisabled = 1;
                    //icon = PATHTOF(UI\team\team_green_ca.paa); //@todo
                    priority = 2.3;
                    hotkey = "G";
                };
                class ACE_AddHeadBag3 {
                    displayName = "Add Headbag (Smiley)";
                    condition = QUOTE(('ace_burlapSack_Smiley' in Items _target || 'ace_burlapSack_Smiley' in Items _player) && !(_target getVariable [ARR_2(QGVAR(wearHeadBag),true)]));
                    statement = QUOTE([ARR_3(player,_target,"ace_burlapSack_Smiley")] call DFUNC(addHead));
                    showDisabled = 1;
                    //icon = PATHTOF(UI\team\team_green_ca.paa); //@todo
                    priority = 2.3;
                    hotkey = "G";
                };
                class ACE_RemoveHeadBag {
                    displayName = "Remove Headbag";
                    condition = QUOTE((_target getVariable [ARR_2(QGVAR(wearHeadBag),false)]));
                    statement = QUOTE([ARR_2(_player,_target)] call DFUNC(removeHead));
                    showDisabled = 1;
                    //icon = PATHTOF(UI\team\team_green_ca.paa); //@todo
                    priority = 2.3;
                    hotkey = "G";
                };
            };
        };
    };
};
