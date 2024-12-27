class ItemInfo;

class CfgWeapons
{
    // Importing the parent class for the uniforms we want to change, so we can inherit from it.
    class vn_b_uniform_base;
    // creating the macro
    #define S_70(className)\
    class className : vn_b_uniform_base { class ItemInfo : ItemInfo { containerClass = "Supply70"; }; };\

    S_70(vn_b_uniform_macv_04_01)
    S_70(vn_b_uniform_macv_04_02)
    S_70(vn_b_uniform_macv_04_05)
    S_70(vn_b_uniform_macv_04_06)
    S_70(vn_b_uniform_macv_04_07)
    S_70(vn_b_uniform_macv_04_08)
    S_70(vn_b_uniform_macv_04_15)
    S_70(vn_b_uniform_macv_04_16)
    S_70(vn_b_uniform_macv_04_17)
    S_70(vn_b_uniform_macv_04_18)
};