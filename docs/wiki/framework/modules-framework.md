---
layout: wiki
title: Modules Framework
description: The ACE3 Modules framework provides a module base class that lets you initialize modules in unscheduled execution space.
group: framework
order: 5
parent: wiki
---

## 1. Overview

The ACE3 Modules framework provides a module base class that lets you initialize modules in unscheduled execution space. This lets us ensure that modules placed in the editor run when they are supposed to.

## 2. How it Works

It provides a nearly identical interface too the [Arma 3 modules framework](https://community.bistudio.com/wiki/Arma_3_Module_Framework){:target="_blank"}. The biggest issue with the Arma 3 modules is that they run in scheduled space. This means that there is no guarantee when a module initializes.

To solve this, we have build a framework on top of the Arma 3 modules framework. For the Arma 3 framework, your modules inherit from `Module_F`. To make use of the ACE3 Module framework, you will need to inherit from `ACE_Module`.

## 3. Limitations

Because we at the moment do not need all the functionality from the Arma 3 Modules framework within ACE, we officially only support modules that execute once (on mission start). Our prime use case are settings modules.

Other use cases may work, however are not supported by us. Use at your own risk.

## 4. Examples

```cpp
class CfgVehicles {
    class ACE_Module;
    class ACE_bananaModule: ACE_Module {
        scope = 2;
        displayName = "Spawn Banana";
        category = "ACE";
        function = "ace_fnc_bananaModuleInit";
        functionPriority = 10;
        isGlobal = 0;
        isTriggerActivated = 0;
        isDisposable = 0;
        author = "Monkey123";
    };
};
```
