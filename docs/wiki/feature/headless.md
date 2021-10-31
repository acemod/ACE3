---
layout: wiki
title: Headless
description: Automatic passing of AI groups to Headless Clients.
group: feature
category: general
parent: wiki
mod: acex
version:
  major: 3
  minor: 0
  patch: 0
redirect_from: "/wiki/featurex/headless.html"
---

## 1. Overview

Enables automatic passing of AI groups to (up to 3) Headless Clients using round-robin system, with automatic Headless Client recognition. Due to the fully event-based transferring (on unit spawn and on Headless Client connect and disconnect) the performance impact is minimal. It also transfers *groups* of units instead of each unit separately.

## 2. Dependencies

{% include dependencies_list.md component="headless" %}
