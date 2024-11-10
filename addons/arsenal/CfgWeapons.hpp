class CfgWeapons {
    class ItemCore;
    class ToolKit: ItemCore {
        ACE_isTool = 1; // sort in Tools Tab
    };

    class ChemicalDetector_01_base_F: ItemCore {
        ACE_asItem = 1;
        ACE_isTool = 1; // sort in Tools Tab
    };

    class DetectorCore;
    class MineDetector: DetectorCore {
        ACE_isTool = 1; // sort in Tools Tab
    };
};
