class CfgWeapons {
    class ACE_ItemCore;
    class CBA_MiscItem_ItemInfo;

    class ACE_TransmitterItem_406MHz: ACE_ItemCore {
        ACE_attachable = "ACE_transmitter_406MHz"; // the CfgVehicle
        author = ECSTRING(common,ACETeam);
        scope = 2;
        displayName = CSTRING(locatorBeacon406);
        descriptionShort = CSTRING(locatorAttachToActivate);
        // model = QPATHTOF(data\x.p3d); // todo?
        model = "\A3\Structures_F\Items\Tools\MultiMeter_F.p3d";
        // picture = QPATHTOF(UI\irstrobe_item.paa); // todo
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 1;
        };
    };
};
