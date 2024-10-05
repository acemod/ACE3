---
title: Functions
layout: default
group: subNav
order: 1
short: wiki
parent: wiki
---

<style type="text/css">
  ul.columns {
    columns: 2;
  }
</style>

<div class="row">
    <div class="large-12 columns">
        <h1>Functions</h1>
        <p>Public API functions for use by mission makers and other mods to interface with ACE3. Backwards compatibility is supported for the following functions as much as possible.</p>
    </div>
</div>
<div class="row">
    <div class="large-12 columns">
        <nav>
            <ul class="columns">
                {% assign pages_list = site.pages | sort_natural: "title" %}
                {% assign group = 'functions' %}
                {% include pages_list %}
            </ul>
        </nav>
    </div>
</div>
