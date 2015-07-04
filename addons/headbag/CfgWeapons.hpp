class CfgWeapons
{
    class InventoryItem_Base_F;
    class ItemCore;

    class HeadgearItem: InventoryItem_Base_F {
        allowedSlots[] = {901, 605}; /// defines where can be the cap placed, it is small enough to fit in backpack
        type = 605;		/// standard slot for the cap is on head
        hiddenSelections[] = {};	/// default caps don't have any changeable selections
        hitpointName = "HitHead";	/// what hitpoint is covered with the cap to have additional protection
    };

    class ace_burlapSack: ItemCore {
        scope = 2; /// scope needs to be 2 to have a visible class
        displayName  = "Head Bag"; /// how would the stuff be displayed in inventory and on ground
        Author= "joko // Jonas && Jrudy";
        picture = QUOTE(PATHTOF(data\headbag_ca.paa)); /// this looks fairly similar
        model = QUOTE(PATHTOF(data\burlapsack.p3d));
        hiddenSelections[]= { "camo" };
        hiddenSelectionsTextures[]= { QUOTE(PATHTOF(data\burlapsack_co.paa)) };
        GVAR(Display) = QUOTE(PATHTOF(UI\overlayScreen_ca.paa));

        class ItemInfo: HeadgearItem {
            mass = 10; /// combined weight and volume of the cap, this equals to single magazine
            uniformModel = QUOTE(PATHTOF(data\burlapsack.p3d));	/// what model is used for this cap
            allowedSlots[] = {801, 901, 701, 605};	/// this cap is so small and flexible that it fits everywhere
            modelSides[] = {6}; /// available for all sides
            armor = 0;	/// this cap doesn't provide any protection
            passThrough = 1; /// this cap doesn't provide any protection
            hiddenSelections[] = {"camo"}; /// what selection in model could have different textures
        };
    };
    class ace_burlapSack_FuckOf: ace_burlapSack {
        displayName  = "Head Bag (Fuck Of)";
        hiddenSelectionsTextures[]= { QUOTE(PATHTOF(data\burlapsackFuckOf_co.paa)) };
    };
    class ace_burlapSack_Smiley: ace_burlapSack {
        displayName = "Head Bag (Smiley)";
        hiddenSelectionsTextures[]= { QUOTE(PATHTOF(data\burlapsackSmiley_co.paa)) };
    };
};
