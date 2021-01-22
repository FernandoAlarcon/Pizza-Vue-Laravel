<template>
    <div class="container" >
                <div class="d-flex justify-content-between align-items-center" > 
                    <h4> Pizzas</h4>
                    <b-button id="show-btn" class="btn btn-primary btn-sm" @click="MostrarModal_Pizza">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bookmark-plus-fill" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M2 15.5V2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.74.439L8 13.069l-5.26 2.87A.5.5 0 0 1 2 15.5zm6.5-11a.5.5 0 0 0-1 0V6H6a.5.5 0 0 0 0 1h1.5v1.5a.5.5 0 0 0 1 0V7H10a.5.5 0 0 0 0-1H8.5V4.5z"/>
                        </svg>
                    </b-button> 
                    <b-modal ref="modal-Pizza" hide-footer title="Agranda la Carta de Pizza">
                        <div class="d-block text-center">
                            <h3>Nueva Pizza</h3>
                        </div>
                        
                        <div class="row" >
                            <div class="col-md-1" ></div>
                            <div class="col-md-10" > 
                                    <input  type="number" 
                                            class="form-control"
                                            v-model="Pizza.costo"
                                            placeholder="Precio" ><br>
                                    <input  type="text" 
                                            class="form-control"
                                            v-model="Pizza.Pizza"
                                            placeholder="Nombre Pizza" ><br>
                            </div>
                            <div class="col-md-1" ></div>

                            <div class="col-md-5" >
                                <b-button class="mt-2" variant="outline-warning" block @click="AgregarPizza">
                                    Guardar 
                                </b-button>
                            </div>
                            <div class="col-md-5" >
                                <b-button class="mt-2" variant="outline-danger" block @click="CerrarModelPizza">
                                    Cerrar Modal
                                </b-button>
                            </div>
                        </div>
                        
                    </b-modal>
                </div>
                <div class="row" ><br>
                        <input class="form-control" placeholder="Mejora tu Busqueda" type="text"
                               v-model="busqueda_Pizza" v-on:keyup="VerPizza()" /><br>
                        <div class="col-md-12 accordion row"  style="height: 400px; overflow: auto;" >   
                            <div v-for="Data of DataPizza" class="col-md-6" >                                 
                                <p>
                                    <h5>
                                        {{Data.size}} = ${{Data.precio_base}} 
                                    </h5>
                                    <b-button id="show-btn" class="btn btn-danger btn-sm" 
                                              @click="Eliminar_Pizza(Data.id_size)">
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
        name: 'Pizza',
        mounted() { 
        },
        created: function(){ 
            this.VerPizza();
        },
        data(){return {
            Pizza:{
                'Pizza': '',
                'costo':''
            },
            busqueda_Pizza : '',
            DataPizza:[]
        }},
        methods:{
            Eliminar_Pizza(Info){
                if(confirm('Desea Eliminar este ingrediente')){
                    axios.get('/DeletePizza',{ params: 
                        {   Id_Ing : Info  }}).then(response => {
                            this.DataPizza = response.data;
                            this.VerPizza();
                        });
                }
            },
            VerPizza : function(){ 
                axios.get('/DataPizza',{ params: 
                {   DataIng : this.busqueda_Pizza  }}).then(response => {
                    this.DataPizza = response.data;
                })
            },
            AgregarPizza(){ 
                var url = `/NewPizza`;
                axios.post(url,{
                        Nombre:this.Pizza.Pizza, 
                        costo:this.Pizza.costo
                }).then(response=>{
                    let Event = response.data.Informacion.Event
                    if(Event == 'successfull'){
                        alert('Ingrediente Agregado');
                        this.VerPizza();
                        this.CerrarModelPizza();
                        this.Pizza.Pizza  = '';
                        this.Pizza.costo  = ''; 
                    }else{
                        alert('Algo paso');
                    }
                });
            },
            MostrarModal_Pizza() {
            this.$refs['modal-Pizza'].show()
            },
            CerrarModelPizza() {
                this.$refs['modal-Pizza'].hide()
            },
            toggleModal() {
                // We pass the ID of the button that we want to return focus to
                // when the modal has hidden
                this.$refs['modal-Pizza'].toggle('#toggle-btn')
            }
        }
    }
</script>