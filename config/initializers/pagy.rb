require 'pagy/extras/i18n'
require 'pagy/extras/plain'

Rails.application.config.assets.paths << Pagy.root.join('javascripts')

Pagy::VARS[:breakpoints] = { 0 => [0,0,0,0],
                             300 => [0,1,1,0],
                             450 => [1,1,1,1],
                             550 => [1,2,2,1],
                             620 => [2,2,2,2],
                             715 => [3,2,2,3],
                             780 => [3,3,2,3],
                             820 => [3,3,3,3],
                             875 => [4,3,3,4] }
