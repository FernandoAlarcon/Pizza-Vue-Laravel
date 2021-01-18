<template>
   <div class="container" >
        <div class="row" >
            <div class="col-sm-12" ><br>
                <h3> Pedidos Realizados </h3><br>
                <div class="pedidos" >
                </div>
            </div>
            <div class="col-sm-6" >
                Ingredientes
            </div>
            <div class="col-sm-6" >
                Pizzas
            </div>
        </div>
   </div>   
</template>
<styles scoped>
    .pedidos{
        overflow:hide;
        height:500px;
        border:1px solid black;
    }
</styles>
<script>
    export default {
        name: 'Administrador',
        mounted() {
            console.log('Component Administracion')
        },
        created: function(){ 
        },
        data(){return {
            DataPedidos:[]
        }},
        methods:{
            
        }
    }
</script>
