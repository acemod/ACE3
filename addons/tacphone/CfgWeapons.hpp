class CfgWeapons {
    class ACE_ItemCore;
    class CBA_MiscItem_ItemInfo;
    
    class ACE_Tacphone: ACE_ItemCore {
        author = CSTRING(ACETeam);
        scope = 2;
        displayName = CSTRING(tacphoneDisplayName);
        descriptionShort = CSTRING(tacphoneDescr);
        model = QPATHTOF(data\phone.p3d);
        picture = QPATHTOF(data\tx\icon_phone_ca.paa);
        icon = "iconObject_circle";
        mapSize = 0.034;
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 1;
        };
    };
};