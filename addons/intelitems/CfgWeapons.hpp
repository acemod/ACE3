class CfgWeapons {
    class ACE_ItemCore;
    class CBA_MiscItem_ItemInfo;

    // Since base game doesn't support misc. items, this is needed to filling inventories in the editor
    class GVAR(notepad_Item): ACE_ItemCore {
        displayName = CSTRING(Notepad_DisplayName);
        author = ECSTRING(common,ACETeam);
        scope = 2;
        scopeArsenal = 0;
        descriptionShort = CSTRING(Notepad_Description);
        picture = QPATHTOF(ui\notepad_ca.paa);
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 0.1;
        };
    };
};
