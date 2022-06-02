<template>
   <input type="text" v-model="input" placeholder="Procurar Operadora..." />
  <div class="item fruit" v-for="fruit in filteredList()" :key="fruit">
    <p>{{ fruit }}</p>
  </div>
</template>

<style>
* {
  padding: 0;
  margin: 0;
  box-sizing: border-box;
}

body {
  padding: 20px;
  min-height: 100vh;
  background-color: rgb(234, 242, 255);
}

</style>