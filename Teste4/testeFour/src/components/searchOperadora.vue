<template>
  <div class='input-div'>
    <p class="operadora">
      {{ operadora }}
    </p>
  </div>
</template>

<script>

export default {
  name: 'SearchOperadora',
  props: ["operadora"]
}
</script>

<style scoped>
  .input-div{
    display: flex;
    padding: 0 10px;
    line-height: 2px;
    font-family: Arial, Helvetica, sans-serif;
  }

  .operadora{
    font-size: 13px;
  }
</style>
