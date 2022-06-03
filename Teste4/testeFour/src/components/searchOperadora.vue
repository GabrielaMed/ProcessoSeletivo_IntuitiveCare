<template>
  <div class='operadoras'>
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
  .operadoras{
    display: flex;
    padding: 0 10px;
    line-height: 2px;
  }

  .operadora{
    font-size: 13px;
  }
</style>
