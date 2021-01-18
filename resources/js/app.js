/// documento creado por erick fernando alarcon duran
/// +57 3232853878
require('./bootstrap');

window.Vue = require('vue').default;

Vue.component('index-component', require('./components/Index.vue').default);

import { BootstrapVue, IconsPlugin } from 'bootstrap-vue'

// Import Bootstrap an BootstrapVue CSS files (order is important)
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'

// Make BootstrapVue available throughout your project
Vue.use(BootstrapVue)
// Optionally install the BootstrapVue icon components plugin
Vue.use(IconsPlugin)

const app = new Vue({
    el: '#app',
    created: function(){ 
    }
   
}); 
