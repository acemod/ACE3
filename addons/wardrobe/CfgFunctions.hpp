class CfgFunctions
{
    class ADDON
    {
        class COMPONENT
        {
            file = PATH_TO_FUNC;

            class postInit { postInit = 1; };
            class say3d {};

            class clearOnClose {};
            class checkItem {};
            class getCfgDataRandom {};

        };

        class ace_intel
        {
            file = PATH_TO_FUNC_SUB(ace_intel);
            class getMagIDs {};
            class getIndexFromMagID {};
            class setIndexForMagID {};
        };

        class getItems
        {
            file = PATH_TO_FUNC_SUB(getItems);
            class getItems_all {};
            class getItems_modifiable_all {};
            class getItems_modifiable_current {};
            
        };

        class replace
        {
            file = PATH_TO_FUNC_SUB(replace);

            class replace {};
            class replace_headgear {};
            class replace_facewear {};
            class replace_uniform  {};
        };

        class action
        {
            file = PATH_TO_FUNC_SUB(action);

            class addActions {};
            class addActions_condition {};
            class addActions_children {};

            class getAction_Name {};
            class getAction_Icon {};
        };

        class cache
        {
            file = PATH_TO_FUNC_SUB(cache);

            class cache_db {};

            class cache_get {};
            class cache_set {};

            class cache_clear {};
        };
    };
};