<template>
  <div>
    <el-breadcrumb separator="/">
      <el-breadcrumb-item :key="index" :to="item.path" v-for="(item,index) in realList">{{item}}</el-breadcrumb-item>
    </el-breadcrumb>
  </div>
</template>
<script type="text/javascript">
  export default {
    data() {
      return {
        realList: []
      }
    },
    methods: {},
    mounted() {
      this.realList = this.$route.meta.routeList;
      console.log(this.realList)
    }
  }
</script>
<style lang="scss" scoped>

</style>
