
class SlotInfo;
class PointerSlot: SlotInfo {
    compatibleItems[] += {"ACE_acc_pointer_red","ACE_acc_pointer_green_IR","ACE_acc_pointer_green"};
};

class CfgWeapons {
    class ItemCore;
    class InventoryFlashLightItem_Base_F;

    class acc_pointer_IR: ItemCore {
        MRT_SwitchItemNextClass = "ACE_acc_pointer_red";
        MRT_SwitchItemPrevClass = "ACE_acc_pointer_red";
        MRT_switchItemHintText = CSTRING(IRLaser);

        displayName = CSTRING(red);
        descriptionUse = CSTRING(useLaser);
    };

    class ACE_acc_pointer_red: ItemCore {
        MRT_SwitchItemNextClass = "acc_pointer_IR";
        MRT_SwitchItemPrevClass = "acc_pointer_IR";
        MRT_switchItemHintText = CSTRING(Laser);

        ACE_laserpointer = 1;

        author = ECSTRING(common,ACETeam);
        _generalMacro = "ACE_acc_pointer_red";
        scope = 1;
        displayName = CSTRING(red);
        descriptionUse = CSTRING(useLaser);
        picture = "\A3\weapons_F\Data\UI\gear_accv_pointer_CA.paa";
        model = "\A3\weapons_f\acc\accv_pointer_F";
        descriptionShort = CSTRING(Description);

        class ItemInfo: InventoryFlashLightItem_Base_F {
            mass = 6;

            class Pointer {
                irLaserPos = "laser pos";
                irLaserEnd = "laser dir";
                irDistance = 5;
            };

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
        MRT_SwitchItemNextClass = "ACE_acc_pointer_green";
        MRT_SwitchItemPrevClass = "ACE_acc_pointer_green";
        MRT_switchItemHintText = CSTRING(IRLaser);

        author = ECSTRING(common,ACETeam);
        _generalMacro = "ACE_acc_pointer_green";
        scope = 1;
        displayName = CSTRING(green);
    };

    class ACE_acc_pointer_green: ACE_acc_pointer_red {
        MRT_SwitchItemNextClass = "ACE_acc_pointer_green_IR";
        MRT_SwitchItemPrevClass = "ACE_acc_pointer_green_IR";
        MRT_switchItemHintText = CSTRING(Laser);

        ACE_laserpointer = 2;

        author = ECSTRING(common,ACETeam);
        _generalMacro = "ACE_acc_pointer_green";
        scope = 2;
        displayName = CSTRING(green);
    };
};
