# Pin npm packages by running ./bin/importmap

pin "application"
pin "mode_switch", to: "mode_switch.js"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "bootstrap", to: "bootstrap.bundle.min.js"
pin_all_from "app/javascript/theme", under: "theme"
