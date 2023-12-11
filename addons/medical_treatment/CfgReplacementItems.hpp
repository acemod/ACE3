// This config accepts both item type numbers and item class names
// Item type numbers need the prefix ItemType_, so for example ItemType_401
// Class names need no special prefix
class EGVAR(medical,replacementItems) {
    DOUBLES(ItemType,TYPE_FIRST_AID_KIT)[] = {
        {"ACE_fieldDressing", 1},
        {"ACE_packingBandage", 1},
        {"ACE_morphine", 1},
        {"ACE_tourniquet", 1}
    };
    DOUBLES(ItemType,TYPE_MEDIKIT)[] = {
        {"ACE_fieldDressing", 1},
        {"ACE_packingBandage", 2},
        {"ACE_epinephrine", 1},
        {"ACE_morphine", 1},
        {"ACE_salineIV_250", 1},
        {"ACE_tourniquet", 1},
        {"ACE_splint", 2}
    };
    ACE_atropine[] = {
        {"ACE_adenosine", 1}
    };
};
