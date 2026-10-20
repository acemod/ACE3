class SPE_Bomb_base;
class SPE_NC250_Bomb: SPE_Bomb_base {
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 166000;
    EGVAR(frag,charge) = 130000;
    EGVAR(frag,gurney_c) = 2750;
    EGVAR(frag,gurney_k) = 1/2;
    EGVAR(frag,classes)[] = {"ACE_frag_medium","ACE_frag_large","ACE_frag_huge"};
};
class SPE_NC50_Bomb: SPE_Bomb_base {
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 25000;
    EGVAR(frag,charge) = 24400;
    EGVAR(frag,gurney_c) = 2750;
    EGVAR(frag,gurney_k) = 1/2;
    EGVAR(frag,classes)[] = {"ACE_frag_medium","ACE_frag_large"};
};
class SPE_SC500_Bomb: SPE_Bomb_base {
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 200000;
    EGVAR(frag,charge) = 275000;
    EGVAR(frag,gurney_c) = 2750;
    EGVAR(frag,gurney_k) = 1/2;
    EGVAR(frag,classes)[] = {"ACE_frag_medium","ACE_frag_large","ACE_frag_huge"};
};
class SPE_US_500lb_Bomb: SPE_Bomb_base {
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 100000;
    EGVAR(frag,charge) = 124000;
    EGVAR(frag,gurney_c) = 2700;
    EGVAR(frag,gurney_k) = 1/2;
    EGVAR(frag,classes)[] = {"ACE_frag_medium","ACE_frag_large","ACE_frag_huge"};
};
class SPE_US_1000lb_Bomb: SPE_Bomb_base {
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 200000;
    EGVAR(frag,charge) = 158000;
    EGVAR(frag,gurney_c) = 2700;
    EGVAR(frag,gurney_k) = 1/2;
    EGVAR(frag,classes)[] = {"ACE_frag_medium","ACE_frag_large","ACE_frag_huge"};
};
