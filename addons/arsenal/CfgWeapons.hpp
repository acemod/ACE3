class CfgWeapons {
    class ItemCore;
    class ToolKit: ItemCore {
        ACE_isTool = 1; // sort in Tools Tab
    };
    class DetectorCore;
    class MineDetector: DetectorCore {
        ACE_isTool = 1; // sort in Tools Tab
    };
};
