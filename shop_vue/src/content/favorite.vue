<template>
  <div>
    <nav_top :flag_home="false"/><br/>
    <div style="position: fixed;width: 100%;height: 60px; background: white;z-index: 100;">
      <img id="tiangou" src="../assets/tmall.jpg">
      <span id="favorite">收藏夹</span>
    </div>
    <div style="height: 40px;"></div>



    <div v-if="flag_show">

      <div class="listBox">
        <div class="itemBox" v-for="item in dataList"   @click="gotoCommodityPage(item.cID)">
          <div style="width: 100%;border: 1px solid gray" >
            <img :src="item.cPhotoname" style="height: 164px;width:164px" >
          </div>
          <div class="cNameBox"><span>{{item.cName}}</span></div>
          <div><span style="color: #FF4400">￥{{(item.cPrice).toFixed(2)}}</span></div>
        </div>
      </div>

    </div>
    <div v-else>
      <div class="notData">
        <img src="../assets/search_notdata.png">
        <span class="side">旺~旺~旺~</span>
        <span class="maddle">你的收藏夹还没有商品哟，快去收藏添加吧~</span>
      </div>
    </div>



  </div>
</template>

<script>
  import Nav_top from "@/components/nav_top";
  export default {
    name: "favorite",
    components: {Nav_top},
    data(){
      return{
        dataList:[]
      }
    },
    methods:{
      gotoCommodityPage(cID){

        const {href} = this.$router.resolve({
          name:'commodityPage',
          query:{
            //新页面 参数通过url 参数 不能直接json
            // CommodityMessage:this.$qs.stringify(this.props_CommodityMessage),
            cID:cID
          }
        });
        window.open(href,'_blank');
      }
    },
    computed:{
      flag_show(){
        return this.dataList.length>0;
      },
    },
    created() {
      this.$axios.get('/selFavoriteList')
        .then(res=>{
          if (res.data.success){
            this.dataList = res.data.data;
            for (var i=0;i<this.dataList.length;i++) {
              this.dataList[i].cPhotoname=this.GLOBAL.commodityImagesUrl+this.dataList[i].cPhotoname;
            }
          }else {
            if (res.data.status==this.GLOBAL.ResponseStatus.USER_LOGIN_OVERDUE){
              alert("请先登录");
              this.$router.push({name:'enter'});
            } else {
              this.$router.push({name:'error',params:{response_data:res.data}});
            }
          }
        })
    }
  }
</script>

<style scoped>

  .listBox{
    width: 1000px;
    margin: 20px auto;
  }

  .itemBox{
    cursor: pointer;
    height: 226px;
    width: 165px;
    float: left;
    margin-bottom: 14px;
    margin-right: 18px;
    text-align: center;

  }
 .cNameBox{
   overflow: hidden;
   text-overflow:ellipsis;
   white-space: nowrap;


 }


  #tiangou{
    margin-left: 70px;
    height: 35px;
    position: relative;
    bottom: 5px;
  }
  #favorite{
    font-weight: 600;
    font-size: 25px;
  }



  .notData{
    margin-top: 50px;
    background: #FFF8F6;
    border: 1px solid #F7EAE7;
    height: 90px;
    padding-left: 250px;
  }
  .notData img{
    height: 60px;
    margin: 15px;
  }
  .maddle{
    color: #790103;
    font-weight: bold;
  }
</style>
