---
title: News
layout: default
group: mainNav
order: 2
short: posts
parent:
---

<div class="row">
    <div class="large-12 columns">
        <h1>ACE Posts</h1>
    </div>
</div>

<div class="row">
    <div class="large-12 columns">
        <ul class="article-list">
            {% for post in site.posts %}
            <li>
                <article>
                    <header>
                        <h1><a href="{{ post.url }}">{{ post.title }}</a></h1>

                        <div class="meta">
                            <time>{{ post.date | date: "%Y-%m-%d"}}</time>
                        </div>
                    </header>
                    {{ post.excerpt }}
                    <footer>
                        <a class="button button--icon small" href="{{ post.url }}">
                           <span>Read more</span>
                           <i class="icon icon--white" aria-hidden="true">
                                <svg>
                                    <use href="/dist/icons.svg#chevronright" />
                                </svg>
                            </i>
                        </a>
                    </footer>
                </article>
                <hr/>
            </li>
            {% endfor %}
        </ul>
    </div>
</div>
