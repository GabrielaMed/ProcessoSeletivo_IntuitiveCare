<template>
  <div class="home">
    <h1>LISTA DE OPERADORAS</h1>
    <div class="input" id="input">
      <input type="search" v-model="textSearch" placeholder="Buscar operadora"/>
      <button @click="handleSearch">Buscar</button>
      <p>{{operadora}}</p>
    </div>
    <SearchOperadora v-for="operadora in operadoras" :key="operadora.razaoSocial" :operadora="operadora"/>
  </div>
</template>

<script>
import SearchOperadora from './components/searchOperadora.vue'

export default {
  name: 'App',
  components:{
    SearchOperadora
  },
  data(){
    return{
      operadoras: [],
      textSearch: ""
    };
  },
  methods:{
    handleSearch: function(){
      fetch(`http://127.0.0.1:5000/search?razaoSocial=${this.textSearch.toUpperCase()}`)
      .then(response => response.json().then(json => 
      { 
        console.log(json.operadoras)
        this.operadoras = json.operadoras
      }))
    }
  },
  mounted(){
    fetch(`http://127.0.0.1:5000/`).then(response => response.json().then(json => this.operadoras = json.operadoras))
  }
};

</script>

<style>
  .home{
    display: flex;
    flex-direction: column;
  }

  h1{
    font-size: 24px;
    color: '#111111';
    text-align: center
  }

  .input{
    width: 100%;
    display: flex;
    justify-content: flex-end;
    margin: 16px 0;
  }

  input{
    width: 300px;
    height: 40px;
    padding: 8px;
    border: 1px solid black;
    border-radius: 20px;
    margin-right: 8px;
    outline: none;
    font-size: 12px;
  }

  button{
    width: 90px;
    padding: 8px;
    border: 1px solid black;
    border-radius: 20px;
    margin-right: 16px;
    background-color: aliceblue;
    cursor: pointer;
  }
</style>
