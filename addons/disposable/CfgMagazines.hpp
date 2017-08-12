class CfgMagazines {
    class NLAW_F;
    class ACE_PreloadedMissileDummy_Base: NLAW_F {  // The base dummy magazine
        author = ECSTRING(common,ACETeam);
        allowedSlots[] = {701,801,901};
        scope = 1;
        scopeArsenal = 1;
        displayName = CSTRING(PreloadedMissileDummy);
        picture = QPATHTOEF(common,UI\blank_CO.paa);
        model = "\A3\weapons_f\empty";
        modelSpecial = "";
        weaponPoolAvailable = 0;
        mass = 0;
        initSpeed = 5;
        maxLeadSpeed = 23;
    };
    class ACE_FiredMissileDummy: ACE_PreloadedMissileDummy_Base {
        count = 0;
    };
    class ACE_PreloadedMissileDummy_NLAW: ACE_PreloadedMissileDummy_Base { // Dummy NLAW magazine.
        initSpeed = 40;
        maxLeadSpeed = 40;
    };
    class ACE_PreloadedMissileDummy: ACE_PreloadedMissileDummy_NLAW {};  // Technically a breaking change without this.
};
