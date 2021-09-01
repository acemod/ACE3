class CfgWeapons {
    class ACE_ItemCore;
    class CBA_MiscItem_ItemInfo;

    class ACE_IR_Strobe_Base: ACE_ItemCore {
        author = ECSTRING(common,ACETeam);
        scope = 1;
        displayName = CSTRING(IrStrobe_Name);
        descriptionShort = CSTRING(IrStrobe_Description);
        model = QPATHTOF(data\ace_IRStrobe.p3d);
        picture = QPATHTOF(UI\irstrobe_item.paa);
        ACE_AttachToLocation[] = {{-0.05,-0.2,0.2}, "head"};
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 1;
        };
        ACE_ItemUsed = "ACE_IR_Strobe_Item";

    };
    class ACE_IR_Strobe_Item: ACE_IR_Strobe_Base {
        ACE_attachable_children[] = {"ACE_IR_Strobe_Item_One", "ACE_IR_Strobe_Item_Two","ACE_IR_Strobe_Item_Three","ACE_IR_Strobe_Item_Four"};
        // ACE_attachable_children[] = {"ACE_IR_Strobe_Item_One"};
        ACE_attachable = "ACE_IR_Strobe_one_Effect";
        scope = 2;
    };
    class ACE_IR_Strobe_Item_One : ACE_IR_Strobe_Base{
        selectName = "IR Mode 1";
        ACE_attachable_children[] = { "ACE_IR_Strobe_Item_One_High","ACE_IR_Strobe_Item_One_Medium","ACE_IR_Strobe_Item_One_Low"};
        ACE_attachable = "ACE_IR_Strobe_one_Effect";
    };
    class ACE_IR_Strobe_Item_One_High : ACE_IR_Strobe_Base{
        selectName = "IR Mode 1 - High";
        ACE_attachable = "ACE_IR_Strobe_one_Effect";
    };
    class ACE_IR_Strobe_Item_One_Medium : ACE_IR_Strobe_Base{
        selectName = "IR Mode 1 - Medium";
        ACE_attachable = "ACE_IR_Strobe_one_medium_Effect";
    };
    class ACE_IR_Strobe_Item_One_Low : ACE_IR_Strobe_Base{
        selectName = "IR Mode 1 - Low";
        ACE_attachable = "ACE_IR_Strobe_one_low_Effect";
    };
    class ACE_IR_Strobe_Item_Two : ACE_IR_Strobe_Base{
        selectName = "IR Mode 2";
        ACE_attachable_children[] = {"ACE_IR_Strobe_Item_Two_High","ACE_IR_Strobe_Item_Two_Medium","ACE_IR_Strobe_Item_Two_Low"};
        ACE_attachable = "ACE_IR_Strobe_two_Effect";
    };
    class ACE_IR_Strobe_Item_Two_High : ACE_IR_Strobe_Base{
        selectName = "IR Mode 2 - High";
        ACE_attachable = "ACE_IR_Strobe_two_Effect";
    };
    class ACE_IR_Strobe_Item_Two_Medium : ACE_IR_Strobe_Base{
        selectName = "IR Mode 2 - Medium";
        ACE_attachable = "ACE_IR_Strobe_two_medium_Effect";
    };
    class ACE_IR_Strobe_Item_Two_Low : ACE_IR_Strobe_Base{
        selectName = "IR Mode 2 - Low";
        ACE_attachable = "ACE_IR_Strobe_two_low_Effect";
    };
    class ACE_IR_Strobe_Item_Three : ACE_IR_Strobe_Base{
        selectName = "IR Mode 3";
        ACE_attachable_children[] = {"ACE_IR_Strobe_Item_Three_High","ACE_IR_Strobe_Item_Three_Medium","ACE_IR_Strobe_Item_Three_Low"};
        ACE_attachable = "ACE_IR_Strobe_three_Effect";
    };
    class ACE_IR_Strobe_Item_Three_High : ACE_IR_Strobe_Base{
        selectName = "IR Mode 3 - High";
        ACE_attachable = "ACE_IR_Strobe_three_Effect";
    };
    class ACE_IR_Strobe_Item_Three_Medium : ACE_IR_Strobe_Base{
        selectName = "IR Mode 3 - Medium";
        ACE_attachable = "ACE_IR_Strobe_three_medium_Effect";
    };
    class ACE_IR_Strobe_Item_Three_Low : ACE_IR_Strobe_Base{
        selectName = "IR Mode 3 - Low";
        ACE_attachable = "ACE_IR_Strobe_three_low_Effect";
    };
    class ACE_IR_Strobe_Item_Four : ACE_IR_Strobe_Base{
        selectName = "IR Mode 3";
        ACE_attachable_children[] = {"ACE_IR_Strobe_Item_Four_High","ACE_IR_Strobe_Item_Four_Medium","ACE_IR_Strobe_Item_Four_Low"};
        ACE_attachable = "ACE_IR_Strobe_four_Effect";
    };
    class ACE_IR_Strobe_Item_Four_High : ACE_IR_Strobe_Base{
        selectName = "IR Mode 4 - High";
        ACE_attachable = "ACE_IR_Strobe_four_Effect";
    };
    class ACE_IR_Strobe_Item_Four_Medium : ACE_IR_Strobe_Base{
        selectName = "IR Mode 4 - Medium";
        ACE_attachable = "ACE_IR_Strobe_four_medium_Effect";
    };
    class ACE_IR_Strobe_Item_Four_Low : ACE_IR_Strobe_Base{
        selectName = "IR Mode 4 - Low";
        ACE_attachable = "ACE_IR_Strobe_four_low_Effect";
    };
};
