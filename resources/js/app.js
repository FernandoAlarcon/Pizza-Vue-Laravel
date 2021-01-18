/// documento creado por erick fernando alarcon duran
/// +57 3232853878
require('./bootstrap');

window.Vue = require('vue').default;

Vue.component('index-component', require('./components/Index.vue').default);


const app = new Vue({
    el: '#app',
    created: function(){ 
    }
   
}); 
