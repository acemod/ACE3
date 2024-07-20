class asdg_SlotInfo;
class asdg_FrontSideRail: asdg_SlotInfo {
    class compatibleItems {
        ACE_acc_pointer_red = 1;
        ACE_acc_pointer_green = 1;
        ACE_acc_pointer_green_IR = 1;
    };
};

class SlotInfo;
class PointerSlot: SlotInfo {
    compatibleItems[] += {
        "ACE_acc_pointer_red",
        "ACE_acc_pointer_green_IR",
        "ACE_acc_pointer_green"
    };
};

class PointerSlot_Rail: PointerSlot {
    class compatibleItems {
        ACE_acc_pointer_red = 1;
        ACE_acc_pointer_green = 1;
        ACE_acc_pointer_green_IR = 1;
    };
};
