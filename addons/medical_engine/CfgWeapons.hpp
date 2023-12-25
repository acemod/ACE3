
class CfgWeapons {
    // Remove medical item property, prevent AI from healing using these
    class ItemCore;
    class FirstAidKit: ItemCore {
        type = TYPE_ITEM;
    };
    class Medikit: ItemCore {
        type = TYPE_ITEM;
    };
};
