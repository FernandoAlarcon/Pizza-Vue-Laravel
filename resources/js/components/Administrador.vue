<template>
   <div class="container" >
        <div class="row" >
            <div class="col-sm-12" ><br>
                <h3> Pedidos Realizados </h3><br>
                <div class="pedidos" >
                </div>
                <hr></hr>
            </div>
            <div class="col-sm-6" >                
                <div class="d-flex justify-content-between align-items-center" > 
                    <h4>Ingredientes</h4>
                    <b-button id="show-btn" class="btn btn-primary btn-sm" @click="MostrarModal_Ingredientes">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bookmark-plus-fill" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M2 15.5V2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.74.439L8 13.069l-5.26 2.87A.5.5 0 0 1 2 15.5zm6.5-11a.5.5 0 0 0-1 0V6H6a.5.5 0 0 0 0 1h1.5v1.5a.5.5 0 0 0 1 0V7H10a.5.5 0 0 0 0-1H8.5V4.5z"/>
                        </svg>
                    </b-button>                   

                    <b-modal ref="modal-ingredientes" hide-footer title="Agranda la Carta de Ingredientes">
                        <div class="d-block text-center">
                            <h3>Info Ingredientes</h3>
                        </div>
                        <div class="container row" >
                            <div class="col-md-6" >
                                <b-col>
                                    <b-img thumbnail fluid 
                                           :src="Ingredientes.foto" 
                                           alt="Foto Ingrediente">
                                    </b-img>
                                </b-col>
                            </div>
                            <div class="col-md-6" >
                                    <input  type="text" 
                                            class="form-control"
                                            v-model="Ingredientes.foto"
                                            placeholder="URL Fotografia" ><br>
                                    <input  type="number" 
                                            class="form-control"
                                            v-model="Ingredientes.costo"
                                            placeholder="Precio" ><br>
                                    <input  type="text" 
                                            class="form-control"
                                            v-model="Ingredientes.ingrediente"
                                            placeholder="Ingrediente" ><br>
                            </div>
                            <div class="col-md-5" >
                                <b-button class="mt-2" variant="outline-warning" block @click="AgregarIngrediente">
                                    Guardar 
                                </b-button>
                            </div>
                            <div class="col-md-5" >
                                <b-button class="mt-2" variant="outline-danger" block @click="CerrarModelIngredientes">
                                    Cerrar Modal
                                </b-button>
                            </div>
                        </div>
                        
                    </b-modal>
                </div>
                <div>
                </div>
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
            this.AgregarIngrediente();
        },
        data(){return {
            Ingredientes:{
                'ingrediente': '',
                'costo':'',
                'foto':''
            },
            DataIngredientes:[]
        }},
        methods:{
            AgregarIngrediente(){
                axios.get('/NewIngrediente',{params:{Ingredientes}}).then(response=>{
                    this.DataIngredientes = response.data
                })
            },
            MostrarModal_Ingredientes() {
            this.$refs['modal-ingredientes'].show()
            },
            CerrarModelIngredientes() {
                this.$refs['modal-ingredientes'].hide()
            },
            toggleModal() {
                // We pass the ID of the button that we want to return focus to
                // when the modal has hidden
                this.$refs['modal-ingredientes'].toggle('#toggle-btn')
            }
        }
    }
</script>
