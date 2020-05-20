class SlotInfo;
class PointerSlot: SlotInfo {
    compatibleItems[] += {
        "ACE_acc_pointer_IR_flashlight",
        "ACE_acc_pointer_IR_flashlight2",
        "ACE_acc_pointer_IR_flashlight3",
        "ACE_acc_pointer_IR_flashlight4"
    };
};
class PointerSlot_Rail: PointerSlot {
    class compatibleItems {
        ACE_acc_pointer_IR_flashlight = 1;
        ACE_acc_pointer_IR_flashlight2 = 1;
        ACE_acc_pointer_IR_flashlight3 = 1;
        ACE_acc_pointer_IR_flashlight4 = 1;
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
                intensity = 5000;  // Brightness
                size = 1;         // TODO: OwO what's this?
                innerAngle = 10;   // Can't really tell if there are actually two cones?
                outerAngle = 12;
                coneFadeCoef = 2; // Higher value = sharper outline
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
                    quadratic = 0.1;
                    hardLimitStart = 500;
                    hardLimitEnd = 600;
                };
            };
        };
    };
    class ACE_acc_pointer_IR_flashlight2: acc_pointer_IR {
        class ItemInfo: ItemInfo {
            class Flashlight {
                color[] = {180,160,130};
                ambient[] = {0.9,0.81,0.7};
                intensity = 5000;  // Brightness
                size = 1;         // TODO: OwO what's this?
                innerAngle = 10;   // Can't really tell if there are actually two cones?
                outerAngle = 12;
                coneFadeCoef = 4; // Higher value = sharper outline
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
                    quadratic = 0.1;
                    hardLimitStart = 500;
                    hardLimitEnd = 600;
                };
            };
        };
    };
    class ACE_acc_pointer_IR_flashlight3: acc_pointer_IR {
        class ItemInfo: ItemInfo {
            class Flashlight {
                color[] = {180,160,130};
                ambient[] = {0.9,0.81,0.7};
                intensity = 5000;  // Brightness
                size = 1;         // TODO: OwO what's this?
                innerAngle = 10;   // Can't really tell if there are actually two cones?
                outerAngle = 12;
                coneFadeCoef = 6; // Higher value = sharper outline
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
                    quadratic = 0.1;
                    hardLimitStart = 500;
                    hardLimitEnd = 600;
                };
            };
        };
    };
    class ACE_acc_pointer_IR_flashlight4: acc_pointer_IR {
        class ItemInfo: ItemInfo {
            class Flashlight {
                color[] = {180,160,130};
                ambient[] = {0.9,0.81,0.7};
                intensity = 5000;  // Brightness
                size = 1;         // TODO: OwO what's this?
                innerAngle = 10;   // Can't really tell if there are actually two cones?
                outerAngle = 12;
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
                    quadratic = 0.1;
                    hardLimitStart = 500;
                    hardLimitEnd = 600;
                };
            };
        };
    };
};
