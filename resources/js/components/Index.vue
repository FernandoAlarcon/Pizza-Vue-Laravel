<template>
   <div>
        <div class="card-header">
            <h1>Pizzas - Fernando</h1>
        </div>
     
        <div v-for="Data of DataUser.Roll" >
            <div v-if="Data.nombre_roll == 'Administrador' " >
                <Administracion-component></Administracion-component>
            </div>
            <div v-if="Data.nombre_roll == 'Cliente' " >
                <Cliente-component></Cliente-component>
            </div>
        </div>        
   </div>   
</template>
<script>
//import Administracion-component from './Administracion-component.vue';
Vue.component('Administracion-component', require('./Administrador.vue').default);
Vue.component('Cliente-component', require('./Cliente.vue').default);


    export default { 
        mounted() { 
        },
        created: function(){
            this.getData();
        },
        data(){return {
            DataUser:[],
        }},
        methods:{
            getData: function(){
                var urlProducts = '/DataUser';
                axios.get(urlProducts).then(response=>{                        
                    this.DataUser = response.data; 
                });               
            }
        }
    }
</script>
