http://ace3mod.com/

### How to install Jekyll on your local machine:

1. Install Ruby 1.9.3 http://rubyinstaller.org/downloads/
2. Install Python 2.7.9 https://www.python.org/downloads/windows/
3. Install Ruby Devkit: http://jekyll-windows.juthilo.com/1-ruby-and-devkit/#install-the-ruby-devkit
4. Install Python Pygments: http://jekyll-windows.juthilo.com/3-syntax-highlighting/#install-python-base-of-pygments
5. Install bundler gem: Open a CLI and run `gem install bundler`
6. `cd` to the repo directory
7. Execute `bundle install`

**To run Jekyll:**

```powershell
bundle exec jekyll serve --baseUrl="/ACE3"
```

### How to update the compiled Javascript and CSS files

1. Install Node.js: https://nodejs.org/download/
2. Open a CLI and `cd` to the `src` directory
3. Run `npm install`
4. Run `grunt`
