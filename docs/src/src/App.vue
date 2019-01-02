<template>
    <div id="app" class="container">
        <SiteHeader></SiteHeader>
        <HelloWorld msg="Welcome to Your Vue.js App"/>
        <SiteFooter></SiteFooter>
    </div>
</template>

<script>
import "./css/main.css";
import HelloWorld from "./components/HelloWorld.vue";
import SiteHeader from "./components/Header.vue";
import SiteFooter from "./components/Footer.vue";

export default {
  name: "app",
  components: {
    HelloWorld,
    SiteHeader,
    SiteFooter
  }
};
</script>

<style lang="scss">

</style>
