import Rails from '@rails/ujs'
import Turbolinks from 'turbolinks'
import * as ActiveStorage from '@rails/activestorage'
import 'channels'
require('jquery')
require('bootstrap')
require('@fortawesome/fontawesome-free/js/all')

Rails.start()
Turbolinks.start()
ActiveStorage.start()
