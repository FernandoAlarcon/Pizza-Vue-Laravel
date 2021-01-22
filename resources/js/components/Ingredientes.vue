<template>
    <div class="container" >
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
                        
                        <div class="row" >
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
                <div class="row" ><br>
                        <input class="form-control" placeholder="Mejora tu Busqueda" type="text"
                               v-model="busqueda_ingredientes" v-on:keyup="VerIngredientes()" /><br>
                        <div class="col-md-12 accordion row"  style="height: 400px; overflow: auto;" >   
                            <div v-for="Data of DataIngredientes" class="col-md-6"  >
                                <b-col>
                                    <center>
                                        <b-img thumbnail fluid 
                                            style="width:100px;height:100px;"
                                            :src="Data.foto" 
                                            alt="Foto Ingrediente">
                                    </b-img>
                                    </center>
                                </b-col>
                                <p>
                                    <h5>
                                        {{Data.ingrediente}} = ${{Data.costo}} 
                                    </h5>
                                    <b-button id="show-btn" class="btn btn-danger btn-sm" 
                                              @click="Eliminar_Ingredientes(Data.id_ingrediente)">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
                                            <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
                                        </svg>
                                    </b-button> 
                                </p>
                                <hr>
                            </div>
                        </div>
                </div>
    </div>
</template>

<script> 
    export default {
        name: 'Ingredientes',
        mounted() { 
        },
        created: function(){ 
            this.VerIngredientes();
        },
        data(){return {
            Ingredientes:{
                'ingrediente': '',
                'costo':'',
                'foto':''
            },
            busqueda_ingredientes : '',
            DataIngredientes:[]
        }},
        methods:{
            Eliminar_Ingredientes(Info){
                if(confirm('Desea Eliminar este ingrediente')){
                    axios.get('/DeleIngredientes',{ params: 
                        {   Id_Ing : Info  }}).then(response => {
                            this.DataIngredientes = response.data;
                            this.VerIngredientes();
                        });
                }
            },
            VerIngredientes : function(){ 
                axios.get('/DataIngredientes',{ params: 
                {   DataIng : this.busqueda_ingredientes  }}).then(response => {
                    this.DataIngredientes = response.data;
                })
            },
            AgregarIngrediente(){ 
                var url = `/NewIngrediente`;
                axios.post(url,{
                        ingrediente:this.Ingredientes.ingrediente,
                        costo:this.Ingredientes.costo,
                        foto:this.Ingredientes.foto
                }).then(response=>{
                    let Event = response.data.Informacion.Event
                    if(Event == 'successfull'){
                        alert('Ingrediente Agregado');
                        this.VerIngredientes();
                        this.CerrarModelIngredientes();
                        this.Ingredientes.ingrediente  = '';
                        this.Ingredientes.costo  = '';
                        this.Ingredientes.foto  = '';
                    }else{
                        alert('Algo paso');
                    }
                });
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