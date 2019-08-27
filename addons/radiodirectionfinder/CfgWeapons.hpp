class CfgWeapons {
    class ACE_ItemCore;
    class CBA_MiscItem_ItemInfo;

    class ACE_TransmitterItem_406MHz: ACE_ItemCore {
        ACE_attachable = "ACE_transmitter_406MHz";
        author = ECSTRING(common,ACETeam);
        scope = 2;
        // displayName = CSTRING(IrStrobe_Name);
        displayName = "406MHz Locator Bacon";
        // descriptionShort = CSTRING(IrStrobe_Description);
        // model = QPATHTOF(data\x.p3d);
        model = "\A3\Structures_F\Items\Tools\MultiMeter_F.p3d";
        // picture = QPATHTOF(UI\irstrobe_item.paa);

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 1;
        };
    };
};
