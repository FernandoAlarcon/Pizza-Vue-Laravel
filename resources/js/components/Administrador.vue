<template>
   <div class="container" >
        <div class="row" >
            <div class="col-sm-12" ><br> 
                <div class="pedidos" >
                    <Pedidos-component></Pedidos-component>
                </div>
                <hr> 
            </div>
            <div class="col-sm-6" >                
                <Ingredientes-component></Ingredientes-component>
            </div>
            <div class="col-sm-6" >
                <Pizzas-component></Pizzas-component>
            </div>
        </div>
   </div>   
</template>
 
<script>
    Vue.component('Ingredientes-component', require('./Ingredientes.vue').default);
    Vue.component('Pedidos-component', require('./Pedidos.vue').default);
    Vue.component('Pizzas-component', require('./Pizzas.vue').default);


    export default {
        name: 'Administrador',
        mounted() { 
        },
        created: function(){  
        },
        data(){return { 
        }},
        methods:{
             
        }
    }
</script>
