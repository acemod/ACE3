
class SlotInfo;
class PointerSlot: SlotInfo {
    compatibleItems[] += {"ACE_acc_pointer_red","ACE_acc_pointer_green_IR","ACE_acc_pointer_green"};
};

class CfgWeapons {
    class ItemCore;
    class InventoryFlashLightItem_Base_F;

    class acc_pointer_IR: ItemCore {
        ACE_nextModeClass = "ACE_acc_pointer_red";
        ACE_modeDescription = "$STR_ACE_Laserpointer_IRLaser";

        displayName = "$STR_ACE_Laserpointer_red";
        descriptionUse = "$STR_ACE_Laserpointer_useLaser";
    };

    class ACE_acc_pointer_red: ItemCore {
        ACE_nextModeClass = "acc_pointer_IR";
        ACE_modeDescription = "$STR_ACE_Laserpointer_Laser";

        ACE_laserpointer = 1;

        author = "$STR_ACE_Common_ACETeam";
        _generalMacro = "ACE_acc_pointer_red";
        scope = 1;
        displayName = "$STR_ACE_Laserpointer_red";
        descriptionUse = "$STR_ACE_Laserpointer_useLaser";
        picture = "\A3\weapons_F\Data\UI\gear_accv_pointer_CA.paa";
        model = "\A3\weapons_f\acc\accv_pointer_F";
        descriptionShort = "$STR_ACE_Laserpointer_Description";

        class ItemInfo: InventoryFlashLightItem_Base_F {
            mass = 6;

            class Pointer {};

            class FlashLight {
                color[] = {0,0,0};
                ambient[] = {0,0,0};
                intensity = 0;
                size = 0;
                innerAngle = 0;
                outerAngle = 0;
                coneFadeCoef = 5;
                position = "flash dir";
                direction = "flash";
                useFlare = 0;
                flareSize = 0;
                flareMaxDistance = "100.0f";
                dayLight = 0;

                class Attenuation {
                    start = 0;
                    constant = 0;
                    linear = 0;
                    quadratic = 0;
                    hardLimitStart = 0;
                    hardLimitEnd = 0;
                };

                scale[] = {0};
            };
        };

        inertia = 0.1;
    };

    class ACE_acc_pointer_green_IR: acc_pointer_IR {
        ACE_nextModeClass = "ACE_acc_pointer_green";
        ACE_modeDescription = "$STR_ACE_Laserpointer_IRLaser";

        author = "$STR_ACE_Common_ACETeam";
        _generalMacro = "ACE_acc_pointer_green";
        scope = 1;
        displayName = "$STR_ACE_Laserpointer_green";
    };

    class ACE_acc_pointer_green: ACE_acc_pointer_red {
        ACE_nextModeClass = "ACE_acc_pointer_green_IR";
        ACE_modeDescription = "$STR_ACE_Laserpointer_Laser";

        ACE_laserpointer = 2;

        author = "$STR_ACE_Common_ACETeam";
        _generalMacro = "ACE_acc_pointer_green";
        scope = 2;
        displayName = "$STR_ACE_Laserpointer_green";
    };
};
