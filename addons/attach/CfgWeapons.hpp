class CfgWeapons {
    class ACE_ItemCore;
    class CBA_MiscItem_ItemInfo;

    class ACE_IR_Strobe_Item: ACE_ItemCore {
        ACE_attachable = "ACE_IR_Strobe_Effect";
        author = ECSTRING(common,ACETeam);
        scope = 2;
        displayName = CSTRING(IrStrobe_Name);
        descriptionShort = CSTRING(IrStrobe_Description);
        model = QPATHTOF(data\ace_IRStrobe.p3d);
        picture = QPATHTOF(UI\irstrobe_item.paa);

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 1;
        };
    };
};
