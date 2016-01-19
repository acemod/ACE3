#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {ace_common, ace_interaction};
        author[] = {"KoffeinFlummi"};
        authorUrl = "https://github.com/KoffeinFlummi/";
        VERSION_CONFIG
    };
};

#include "CfgEventHandlers.hpp"

class CfgVehicles {
    class UAV_01_base_F;
    class ACE_FastRoping_Helper: UAV_01_base_F {
        scope = 1;
        model = "ace_fastroping\ace_fastroping_helper.p3d";
        isUav = 0;
        explosionEffect = "";
    };

    class Air;
    class Helicopter: Air {
        GVAR(enabled) = 0;
        GVAR(positions)[] = {};
        class ACE_SelfActions {
            class DeployRopes {
                displayName = "$STR_ACE_FastRoping_DeployRopes";
                enableInside = 1;
                condition = QUOTE([_vehicle] call FUNC(canDeployRopes));
                statement = QUOTE([_vehicle] call FUNC(deployRopes));
                showDisabled = 0;
                priority = 1;
                icon = "";
            };
            class FastRope {
                displayName = "$STR_ACE_FastRoping_FastRope";
                enableInside = 1;
                condition = QUOTE([ARR_2(_player,_vehicle)] call FUNC(canFastRope));
                statement = QUOTE([ARR_2(_player,_vehicle)] call FUNC(fastRope));
                showDisabled = 0;
                priority = 1;
                icon = "";
            };
            class CutRopes {
                displayName = "$STR_ACE_FastRoping_CutRopes";
                enableInside = 1;
                condition = QUOTE([_vehicle] call FUNC(canCutRopes));
                statement = QUOTE([_vehicle] call FUNC(cutRopes));
                showDisabled = 0;
                priority = 1;
                icon = "";
            };
        };
    };
    class Plane: Air {
        GVAR(enabled) = 0;
        GVAR(positions)[] = {};
        class ACE_SelfActions {
            class DeployRopes {
                displayName = "$STR_ACE_FastRoping_DeployRopes";
                enableInside = 1;
                condition = QUOTE([_vehicle] call FUNC(canDeployRopes));
                statement = QUOTE([_vehicle] call FUNC(deployRopes));
                showDisabled = 0;
                priority = 1;
                icon = "";
            };
            class FastRope {
                displayName = "$STR_ACE_FastRoping_FastRope";
                enableInside = 1;
                condition = QUOTE([ARR_2(_player,_vehicle)] call FUNC(canFastRope));
                statement = QUOTE([ARR_2(_player,_vehicle)] call FUNC(fastRope));
                showDisabled = 0;
                priority = 1;
                icon = "";
            };
            class CutRopes {
                displayName = "$STR_ACE_FastRoping_CutRopes";
                enableInside = 1;
                condition = QUOTE([_vehicle] call FUNC(canCutRopes));
                statement = QUOTE([_vehicle] call FUNC(cutRopes));
                showDisabled = 0;
                priority = 1;
                icon = "";
            };
        };
    };

    class Helicopter_Base_F;
    class Helicopter_Base_H: Helicopter_Base_F {};

    // Ghosthawk
    class Heli_Transport_01_base_F: Helicopter_Base_H {
        GVAR(enabled) = 1;
        GVAR(positions)[] = {{1.2, 2.5, 0.25}, {-1.1, 2.5, 0.25}};
    };

    // Chinook
    class B_Heli_Transport_03_base_F: Helicopter_Base_H {
        GVAR(enabled) = 1;
        GVAR(positions)[] = {{0, 1, -1.9}, {0, -5, 0.5}};
    };

    // Wildcat
    class I_Heli_light_03_base_F: Helicopter_Base_F {
        GVAR(enabled) = 1;
        GVAR(positions)[] = {{1.2, 2.5, 0.25}, {-1.1, 2.5, 0.25}};
    };

    // Merlin
    class Heli_Transport_02_base_F: Helicopter_Base_H {
        GVAR(enabled) = 1;
        GVAR(positions)[] = {{1.4, 2.5, 0.25}, {-1.2, 2.5, 0.25}};
    };

    // Kasatka
    class Heli_Light_02_base_F: Helicopter_Base_H {
        GVAR(enabled) = 1;
        GVAR(positions)[] = {{1.4, 1.4, 0.05}, {-1.4, 1.4, 0.05}};
    };

    // Kajman
    class Heli_Attack_02_base_F: Helicopter_Base_F {
        GVAR(enabled) = 1;
        GVAR(positions)[] = {{1.4, 1.4, 0}, {-1.2, 1.4, 0}};
    };
};

class CfgMovesBasic {
    class DefaultDie;
    class ManActions {
        ACE_FastRoping = "ACE_FastRoping";
    };
};
class CfgMovesMaleSdr: CfgMovesBasic {
    class States {
        class Crew;
        class ACE_FastRoping: Crew {
            file = "ace_fastroping\data\ace_fastroping.rtm";
            interpolateTo[] = {"Unconscious",1};
            disableWeapons = 1;
            disableWeaponsLong = 1;
            canReload = 0;
        };
    };
};
