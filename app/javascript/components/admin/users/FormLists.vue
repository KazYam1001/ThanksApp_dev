<template>
  <form class="form">
    <input class="name" type="text" placeholder="name" v-model="data.user.name">
    <input class="email" type="text" placeholder="email" v-model="data.user.email">
    <select name="status" class="status" v-model="data.user.status">
      <option class="status" value="管理者">管理者</option>
      <option class="status" value="一般">一般</option>
    </select>
    <input class="group" v-model="data.parent_group.name">
    <input class="group" v-model="data.children_group.name">
    <input class="group" v-model="data.grandchildren_group.name">
    <button class="change_btn" type="submit" @click="changeStatus">変更</button>
    <button class="delete_btn" type="submit" @click="deleteStatus">削除</button>  
  </form>
</template>

<script>
import axios from 'axios'
export default {
  props: ['user'],
  data: function () {
    return{
      data: this.user,
      parent_groups: [],
      children_groups: [],
      grandchildren_groups: []
    }
  },
  // created() {
  //   axios
  //   .get("/api/lists/groups/index.json"
  //     ,{
  //       params: {
  //         company_id:       this.data.company.id,
  //         parent_id:        this.data.parent_group.id,
  //         children_id:      this.data.children_group.id,
  //         grandchildren_id: this.data.grandchildren_group.id
  //       }
  //     }
  //   )
  //   .then(response => {
  //     if (Object.keys(response.data).length != 0){
  //       for(let data of response.data){
  //         this.$data.users.push(data)
  //       }
  //     }
  //   });
  // },
  mounted:function(){
    axios.defaults.headers.common = {
      'X-Requested-With': 'XMLHttpRequest',
      'X-CSRF-TOKEN' : document.querySelector('meta[name="csrf-token"]').getAttribute('content')
    };
  },
  methods: {
    changeStatus: function(){
      axios
      .patch('/api/admin/users/update.json', {
        user_id: this.$data.data.user.id,
        status: this.$data.data.user.status,
        company_id: this.$data.data.company_id
      })
      .then(response => {
        if(response.data.error){
          console.log(response.data.error.text)
        }
        else{
          for(let user of this.$data.users){
            if(user.id == response.data.user.id){
              user.status = response.data.user.status
            }
          }
        }
      });
    },
    deleteStatus: function(){
      axios
      .patch('/api/admin/users/destroy.json', {
        user_id:      this.$data.data.user.id,
        status:       this.$data.data.user.status,
        company_id:   this.$data.data.company_id,
        request:      this.$data.data.user.request
      })
      .then(response => {
        if(response.data.error){
          console.log(response.data.error.text)
        }
        else{
          for(let user of this.$data.users){
            if(user.id == response.data.user.id){
              user.status = response.data.user.status
            }
          }
        }
      });
    }
  }
}
</script>

<style scoped>
  .form{
    width: 100%;
  }
  input{
    display: inline-block;
    text-align: center;
    border:1px solid #BDBDBD;
    height: 2em;    
  }
  select{
    display: inline-block;
    text-align: center;
    border:1px solid #BDBDBD;
    height: 2em;    
  }
  option{
    display: inline-block;
    text-align: center;
    border:1px solid #BDBDBD;
    height: 2em;
  }
  .name{
    width: 20%;
  }
  .email{
    width: 30%;
  }
  .status{
    width: 8%;
  }
  .group{
    width: 10%;
  }

  .border_none{
    border: none;
  }
  .change_btn{
    width: 5%;
    color: white;
    border: none;
    margin: 0 6px;
    border-radius: 10px;
    background: linear-gradient(121.55deg, #F9516F 11.31%, #FF8F6B 87.66%);
  }
  .delete_btn{
    width: 5%;
    color: white;
    border: none;
    border-radius: 10px;
    background:#BDBDBD;
  }
</style>
