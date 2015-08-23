---
layout: wiki
title: huntIR framework
description: Explains how to add huntIR support to your weapons
group: framework
order: 5
parent: wiki
---

## 1. Adding huntIR support for your weapons

```c++
class CfgWeapons {
  class Rifle_Base_F;
  class your_rifle_base_class: Rifle_Base_F {
      class your_gl_class: UGL_F {
          magazines[] = {<all of your other UGL mags>,"ACE_HuntIR_M203"};
      };  
  };
};
```
