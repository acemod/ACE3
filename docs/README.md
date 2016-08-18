http://ace3mod.com/

### How to install Jekyll on your local machine:

1. Install Ruby http://rubyinstaller.org/downloads/
5. Install bundler gem: Open a CLI and run `gem install bundler`
6. `cd` to the repo directory
7. Execute `bundle install`

**To run Jekyll:**

```powershell
bundle exec jekyll serve --future --incremental --config _config_dev.yml
```
Then navigate to http://localhost:4000

### How to update the compiled Javascript and CSS files

1. Install Node.js: https://nodejs.org/download/
2. Open a CLI and `cd` to the `src` directory
3. Run `npm install`
4. Run `grunt`
