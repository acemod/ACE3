class CfgWeapons {
    class ACE_ItemCore;
    class CBA_MiscItem_ItemInfo;

    class ACE_microDAGR: ACE_ItemCore {
        author = ECSTRING(common,ACETeam);
        scope = 2;
        displayName = CSTRING(itemName);
        descriptionShort = CSTRING(itemDescription);
        model = QPATHTOF(data\MicroDAGR.p3d);
        picture = QPATHTOF(images\microDAGR_item.paa);
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 2;
        };
    };
};
