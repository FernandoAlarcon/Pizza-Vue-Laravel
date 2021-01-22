<template>
    <div class="container" >
                <div class="d-flex justify-content-between align-items-center" > 
                    <h4>Tus Pedidos</h4>
                    <b-button id="show-btn" class="btn btn-primary btn-sm" @click="MostrarModal_Pedidos">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bookmark-plus-fill" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M2 15.5V2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.74.439L8 13.069l-5.26 2.87A.5.5 0 0 1 2 15.5zm6.5-11a.5.5 0 0 0-1 0V6H6a.5.5 0 0 0 0 1h1.5v1.5a.5.5 0 0 0 1 0V7H10a.5.5 0 0 0 0-1H8.5V4.5z"/>
                        </svg>
                    </b-button> 
                    <b-modal ref="modal-Pedidos" hide-footer title="Nuevo Pedidos">                                                
                        <div class="row" >
                            <div class="col-md-12" >
                                <div>
                                    <label>(Tipo Pizza)</label>
                                    <select class="form-control" 
                                            name="Tamano"
                                            v-model="PedidosListo.SizePizza" 
                                             > 
                                        <option  
                                            v-for="Size of TamanoPizza" 
                                            :value="Size.id_size" >
                                            {{Size.size}} ({{Size.precio_base}}) 
                                        </option>
                                    </select><hr>
                                </div>
                                <div>
                                    <label>(Ingrediente)</label> 
                                    <div v-for="ListI of ListIngredientes" >
                                        <input  type="radio"
                                                name="Ingredientes"
                                                :id="ListI.id_ingrediente" 
                                                :value="ListI.id_ingrediente"
                                                v-model="PedidosListo.Ingrediente"                                                
                                                 >
                                        <label :for="ListI.id_ingrediente">
                                            {{ListI.ingrediente}} (${{ListI.costo}}) 
                                        </label>
                                    </div>
                                    <hr>
                                </div>
                                  
                            </div>
                            <div class="col-md-5" >
                                <b-button class="mt-2" variant="outline-warning" block @click="AgregarPedido">
                                    Guardar 
                                </b-button>
                            </div>
                            <div class="col-md-5" >
                                <b-button class="mt-2" variant="outline-danger" block @click="CerrarModelPedidos">
                                    Cerrar Modal
                                </b-button>
                            </div>
                        </div>
                        
                    </b-modal>
                </div>
                <div class="row" ><br>
                        <input class="form-control" placeholder="Mejora tu Busqueda" type="text"
                               v-model="busqueda_Pedidos" v-on:keyup="VerPedidos()" /><br>
                        <div class="col-md-12 accordion row Tabla_pedidos" 
                             style="height: 500px; overflow: auto;" >  
                            <table class="table table-hover table-striped " >
                                <thead>
                                <tr>
                                    <th scope="col">Nombre </th>
                                    <th scope="col">Pizza</th>
                                    <th scope="col">Ingredientes</th>
                                    <th scope="col">Estado</th>
                                    <th scope="col">Total</th>
                                    <th scope="col">
                                        <center>
                                            Fecha Pedido
                                        </center>
                                    </th>
                                    <th colspan="2" >
                                        <center>
                                            Acciones
                                        </center>
                                    </th>
                                </tr>
                                </thead> 
                                <tbody>
                                    <tr v-for="pedido of DataPedidos" >
                                        <td> {{pedido.name}}          </td>
                                        <td> {{pedido.size}}          </td>
                                        <td> {{pedido.ingrediente}}   </td>
                                        <td> {{pedido.Estado_Pedido}} </td>
                                        <td> {{pedido.precio}}        </td>
                                        <td> {{pedido.fecha_pedido}}  </td>

                                        <td  colspan="2"  width="10px"  >                                            
                                            
                                            <center>
                                                <button type="button" 
                                                        v-if="pedido.Estado_Pedido === 'Preparacion' && 
                                                            pedido.tipo_pedido   === 'Cliente' " 
                                                        class="btn btn-warning"
                                                        v-on:click.prevent="EstadoPedidos(pedido.id_pedido,'Cancelado')" name="button">
                                                    Cancelar 
                                                </button>
                                                <button type="button" 
                                                            v-if="pedido.Estado_Pedido === 'Preparacion' && 
                                                                pedido.tipo_pedido   != 'Cliente' " 
                                                            class="btn btn-secondary"
                                                            name="button" style="background:grey;">
                                                       Orden Ajena
                                                </button>                                         
                                                <button type="button" 
                                                        v-if="pedido.Estado_Pedido === 'Cancelado' && 
                                                              pedido.tipo_pedido   === 'Cliente' "
                                                        class="btn btn-danger"
                                                        v-on:click.prevent="EstadoPedidos(pedido.id_pedido,'Eliminado')" name="button">
                                                    Eliminar de la lista
                                                </button>
                                                <button type="button" 
                                                        v-if="pedido.Estado_Pedido === 'Realizado'"
                                                        class="btn btn-primary"
                                                        disabled
                                                        name="button">
                                                    Pedido Entregado
                                                </button>  
                                                                                         
                                            </center>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>

                            
                        </div>
                </div>
    </div>
</template>

<script> 
//@change="CalcularPrecio"
    export default {
        name: 'Pedidos',
        mounted() { 
        },
        created: function(){ 
            this.VerPedidos();
            this.TamanosPizza();
            this.IngredientesList();
            this.ListaUsuarios();
        },
        data(){return { 
            Ingrediente: [],
            SizePizza:[],
            PedidosListo:{
                'Ingrediente': '',
                'SizePizza':'',
                'Usuario':''
            },
            Usuario:'',
            busqueda_Pedidos : '',
            DataPedidos:[],
            TamanoPizza:[],
            ListIngredientes:[],
            ListUsers:[],
            PrecioTotal:''

        }},
        methods:{ 

            EstadoPedidos(id_pedido, estado){
                axios.get('/EstadoPedido',{ params:{ 
                        IdPedido     : id_pedido,
                        EstadoPedido : estado
                        }}).then(response => {
                    let Event = response.data.Informacion.Event
                    if(Event == 'successfull'){
                        alert('Pedido '+estado); 
                        this.VerPedidos();     
                    }else{
                        alert('Algo paso');
                    }
                })
            },
            ListaUsuarios(){
                axios.get('/ListUsuarios').then(response => {
                    this.ListUsers = response.data; 
                })
            },
            IngredientesList(){
                axios.get('/ListIngredientes').then(response => {
                    this.ListIngredientes = response.data; 
                })
            },
            TamanosPizza(){
                axios.get('/SizesPizza').then(response => {
                    this.TamanoPizza = response.data; 
                })
            },
            VerPedidos(){
                axios.get('/PedidosCliente',{ params:{PedidoA:this.busqueda_Pedidos}}).then(response => {
                    this.DataPedidos = response.data; 
                })
            },
            AgregarPedido(){ 
                var url = '/NuevoPedido';
                console.log('Esto se va '+ this.PedidosListo.Ingrediente);
                axios.post(url,{
                        Ingrediente : this.PedidosListo.Ingrediente,
                        SizePizza   : this.PedidosListo.SizePizza,  
                }).then(response=>{ 
                    let Event = response.data.Informacion.Event
                    if(Event == 'successfull'){
                        alert('Ingrediente Agregado');
                        this.CerrarModelPedidos();
                        this.VerPedidos();
                        this.PedidosListo.Ingrediente  = '';
                        this.PedidosListo.SizePizza  = '';
                        this.PedidosListo.Usuario  = '';
                    }else{
                        alert('Algo paso');
                    }
                });
            },
            MostrarModal_Pedidos() {
                this.VerPedidos();
                this.TamanosPizza();
                this.IngredientesList();
                this.ListaUsuarios();
                this.$refs['modal-Pedidos'].show()
            },
            CerrarModelPedidos() {
                this.$refs['modal-Pedidos'].hide()
            },
            toggleModal() {
                // We pass the ID of the button that we want to return focus to
                // when the modal has hidden
                this.$refs['modal-Pedidos'].toggle('#toggle-btn')
            }
        }
    }
</script>