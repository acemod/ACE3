class SlotInfo;
class PointerSlot: SlotInfo {
    compatibleItems[] += {
        "ACE_acc_pointer_IR_flashlight"
    };
};

class CfgWeapons {
    class ItemCore;
    class acc_pointer_IR: ItemCore {
        class ItemInfo;
    };
    class ACE_acc_pointer_IR_flashlight: acc_pointer_IR {
        author = ECSTRING(common,ACETeam);
        displayName = "ACE IR flashlight"; // TODO: stringtable

        class ItemInfo: ItemInfo {
            class Flashlight {
                color[] = {180,160,130};
                ambient[] = {0.9,0.81,0.7};
                intensity = 100;  // Brightness
                size = 1;         // TODO: OwO what's this?
                innerAngle = 5;   // Can't really tell if there are actually two cones?
                outerAngle = 10;
                coneFadeCoef = 8; // Higher value = sharper outline
                position = "laser pos";
                direction = "laser dir";
                useFlare = 1;
                flareSize = 1.4;
                flareMaxDistance = 100;
                dayLight = 0;
                scale[] = {0};

                class Attentuation {
                    start = 0;
                    constant = 0.5;
                    linear = 0.1;
                    quadratic = 0.2;
                    hardLimitStart = 27;
                    hardLimitEnd = 34;
                };
            };
        };
    };
};
