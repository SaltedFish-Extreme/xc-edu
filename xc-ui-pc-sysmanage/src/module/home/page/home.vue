<template>
  <el-row class="container">
    <p-head></p-head>
    <el-col :span="24" class="main">
      <aside :class="collapsed?'menu-collapsed':'menu-expanded'">
        <!--导航菜单-->
        <el-menu :default-active="$route.path" @close="handleclose" @open="handleopen" @select="handleselect"
                 background-color="#EFEFF4"
                 class="el-menu-vertical-demo" router unique-opened v-show="!collapsed">
          <template v-for="(item,index) in $router.options.routes" v-if="!item.hidden">
            <el-submenu :index="index+''" v-if="!item.leaf">
              <template slot="title"><i :class="item.iconCls"></i>{{item.name}}</template>
              <el-menu-item :index="child.path" :key="child.path" v-for="child in item.children" v-if="!child.hidden">
                {{child.name}}
              </el-menu-item>
            </el-submenu>
            <el-menu-item :index="item.children[0].path" v-if="item.leaf&&item.children.length>0"><i
              :class="item.iconCls"></i>{{item.children[0].name}}
            </el-menu-item>
          </template>
        </el-menu>
        <!--导航菜单-折叠后-->
        <ul class="el-menu el-menu-vertical-demo collapsed" ref="menuCollapsed" v-show="collapsed">
          <li class="el-submenu item" v-for="(item,index) in $router.options.routes" v-if="!item.hidden">
            <template v-if="!item.leaf">
              <div @mouseout="showMenu(index,false)" @mouseover="showMenu(index,true)" class="el-submenu__title"
                   style="padding-left: 20px;"><i :class="item.iconCls"></i></div>
              <ul :class="'submenu-hook-'+index" @mouseout="showMenu(index,false)" @mouseover="showMenu(index,true)"
                  class="el-menu submenu">
                <li :class="$route.path==child.path?'is-active':''" :key="child.path" @click="$menu.push(child.path)" class="el-menu-item"
                    style="padding-left: 40px;" v-for="child in item.children"
                    v-if="!child.hidden">{{child.name}}
                </li>
              </ul>
            </template>
            <template v-else>
          <li class="el-submenu">
            <div :class="$route.path==item.children[0].path?'is-active':''"
                 @click="$menu.push(item.children[0].path)"
                 class="el-submenu__title el-menu-item" style="padding-left: 20px;height: 56px;line-height: 56px;padding: 0 20px;">
              <i :class="item.iconCls"></i></div>
          </li>
</template>
</li>
</ul>
</aside>
<section class="content-container">
  <div class="grid-content bg-purple-light">
    <el-col :span="24" class="breadcrumb-container">
      <strong class="title">{{$route.name}}</strong>
      <el-breadcrumb class="breadcrumb-inner" separator="/">

      </el-breadcrumb>
    </el-col>
    <el-col :span="24" class="content-wrapper">
      <transition mode="out-in" name="fade">
        <router-view></router-view>
      </transition>
    </el-col>
  </div>
</section>
</el-col>
</el-row>
</template>

<script>
  import PHead from '@/base/components/head.vue';

  export default {
    components: {
      PHead
    },
    data() {
      return {
        collapsed: false,
        sysUserName: '',
        sysUserAvatar: '/static/images/small.jpg',
        form: {
          name: '',
          region: '',
          date1: '',
          date2: '',
          delivery: false,
          type: [],
          resource: '',
          desc: ''
        }
      }
    },
    methods: {
      onSubmit() {
        console.log('submit!');
      },
      handleopen() {
        //console.log('handleopen');
      },
      handleclose() {
        //console.log('handleclose');
      },
      handleselect: function (a, b) {
      },
      //折叠导航栏
      collapse: function () {
        this.collapsed = !this.collapsed;
      },
      showMenu(i, status) {
        this.$refs.menuCollapsed.getElementsByClassName('submenu-hook-' + i)[0].style.display = status ? 'block' : 'none';
      }

    },
    created() {
      console.log(this.$router.options.routes)
    }
  }

</script>

<style lang="scss" scoped>
  @import '~scss_vars';

  .container {
    position: absolute;
    top: 0px;
    bottom: 0px;
    width: 100%;

    .header {
      height: 60px;
      line-height: 60px;
      background: $color-primary;
      color: #fff;

      .userinfo {
        text-align: right;
        padding-right: 35px;
        float: right;

        .userinfo-inner {
          cursor: pointer;
          color: #fff;

          img {
            width: 40px;
            height: 40px;
            border-radius: 20px;
            margin: 10px 0px 10px 10px;
            float: right;
          }
        }
      }

      .logo {
        //width:230px;
        height: 60px;
        font-size: 22px;
        padding-left: 20px;
        padding-right: 20px;
        border-color: rgba(238, 241, 146, 0.3);
        border-right-width: 1px;
        border-right-style: solid;

        img {
          width: 40px;
          float: left;
          margin: 10px 10px 10px 18px;
        }

        .txt {
          color: #fff;
        }
      }

      .logo-width {
        width: 250px;
      }

      .logo-collapse-width {
        width: 60px
      }

      .tools {
        padding: 0px 23px;
        width: 14px;
        height: 60px;
        line-height: 60px;
        cursor: pointer;
      }
    }

    .main {
      display: flex;
      // background: #324057;
      position: absolute;
      top: 60px;
      bottom: 0px;
      overflow: hidden;

      aside {
        flex: 0 0 230px;
        width: 230px;
        // position: absolute;
        // top: 0px;
        // bottom: 0px;
        .el-menu {
          height: 100%;
        }

        .collapsed {
          width: 60px;

          .item {
            position: relative;
          }

          .submenu {
            position: absolute;
            top: 0px;
            left: 60px;
            z-index: 99999;
            height: auto;
            display: none;
          }

        }
      }

      .menu-collapsed {
        flex: 0 0 60px;
        width: 60px;
      }

      .menu-expanded {
        flex: 0 0 230px;
        width: 230px;
      }

      .content-container {
        background: #fff;
        flex: 1;
        // position: absolute;
        // right: 0px;
        // top: 0px;
        // bottom: 0px;
        // left: 230px;
        overflow-y: scroll;
        padding: 20px;

        .breadcrumb-container {
          //margin-bottom: 15px;
          .title {
            width: 200px;
            float: left;
            color: #475669;
          }

          .breadcrumb-inner {
            float: right;
          }
        }

        .content-wrapper {
          background-color: #fff;
          box-sizing: border-box;
        }
      }
    }
  }
</style>
