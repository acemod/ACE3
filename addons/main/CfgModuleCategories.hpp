class CfgFactionClasses {
    class NO_CATEGORY;
    class ACE: NO_CATEGORY {
        displayName = "ACE";
        priority = 2;
        side = 7;
    };
    class ACE_Logistics: ACE {
        displayName = CSTRING(Category_Logistics);
    };
};
