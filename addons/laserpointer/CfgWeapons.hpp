
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

        class ItemInfo: InventoryFlashLightItem_Base_F {
            class Pointer;
        };
    };

    class ACE_acc_pointer_green_IR: acc_pointer_IR {
        MRT_SwitchItemNextClass = "ACE_acc_pointer_green";
        MRT_SwitchItemPrevClass = "ACE_acc_pointer_green";

        author = ECSTRING(common,ACETeam);
        _generalMacro = "ACE_acc_pointer_green";
        scope = 1;
        displayName = CSTRING(green);
        baseWeapon = "ACE_acc_pointer_green";
    };

    class ACE_acc_pointer_red: acc_pointer_IR {
        MRT_SwitchItemNextClass = "acc_pointer_IR";
        MRT_SwitchItemPrevClass = "acc_pointer_IR";
        MRT_switchItemHintText = CSTRING(Laser);

        author = ECSTRING(common,ACETeam);
        _generalMacro = "ACE_acc_pointer_red";
        scope = 1;
        descriptionShort = CSTRING(Description);
        baseWeapon = "acc_pointer_IR";

        class ItemInfo: ItemInfo {
            class Pointer: Pointer {
                isIR = 0; // visible laser
                irDotSize = 0.1; // default size
                beamThickness = 0; // no visible beam
                dotColor[] = {1024, 0, 0};
                beamColor[] = {0, 0, 0};
            };
        };
    };

    class ACE_acc_pointer_green: ACE_acc_pointer_red {
        MRT_SwitchItemNextClass = "ACE_acc_pointer_green_IR";
        MRT_SwitchItemPrevClass = "ACE_acc_pointer_green_IR";

        _generalMacro = "ACE_acc_pointer_green";
        scope = 2;
        displayName = CSTRING(green);
        baseWeapon = "ACE_acc_pointer_green";

        class ItemInfo: ItemInfo {
            class Pointer: Pointer { // properties can't be inherited
                isIR = 0;
                beamThickness = 0;
                dotColor[] = {0, 1024, 0};
                beamColor[] = {0, 0, 0};
            };
        };
    };
};
