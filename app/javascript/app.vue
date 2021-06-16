<template>
  <div id="app">
    <div id="main-content">
      <main>
        <section class="calender-show">
          <div>
            <h2 class="main-title center">TODOリスト</h2>
          </div>
          <div class="form1">
            <div class="form1-group">
              <input v-model="title" placeholder="title" class="form1-control">
            </div>
            <button @click="addList" class = 'btn'>メモを追加</button>
          </div>
          <div class="flex1">
            <div v-for="(list, index) in lists" :key="list.id" class="card1">
              <div class="card1-body">
                <div class="card1-title">
                  <input type="checkbox" v-model="list.is_done" v-on:click="update(list.id, index)">
                  <span v-bind:class="{done: list.is_done}">{{ list.title }}</span>
                </div>
                <button @click="deleteList(list.id, index)" class = 'btn'>削除</button>
              </div>
            </div>
            <div class='calender__btn'>
              <a href="javascript:history.back()" class = 'btn'>戻る</a>
            </div>
          </div>
        </section>
      </main>
    </div>
    <Footer></Footer>
  </div>
</template>

<script>
import axios from 'axios';
import Footer from './packs/components/footer.vue'
export default {
  data: function () {
    return {
      lists: [],
      title:'',
    }
  },
  components: {
    Footer
  },
  mounted () {
    this.setList();
  },
  methods: {
    setList: function () {
      axios.get(`/api/lists`)
      .then(response => (
        this.lists = response.data.lists
      ))
    },
    addList: function() {
      if(this.title == '') return;

      axios.post(`/api/lists`, { title: this.title}).then(response => {
        this.title = '',
        this.setList();
      });
    },
    deleteList: function(list_id, index) {
      axios.delete('/api/lists/' + list_id).then((response) => {
        this.lists.splice(index, 1);
      }, (error) => {
        console.log(error, response);
      });
    },
    update: function (list_id) {
      axios.put('/api/lists/' + list_id).then((response) => {
      }, (error) => {
        console.log(error);
      });
    }
  }
}
</script>

<style lang="scss" scoped>
//  .form1 {
//    display: flex;
//    flex-direction: column;
//    justify-content: center;
//    align-items: center;
//    margin: 32px;
//    &-group {
//      margin-bottom: 1rem;
//    }
//    &-control {
//      width: 300px;
//      min-height: 24px;
//      font-size: 1rem;
//      border: 1px solid #ced4da;
//      padding: 4px 8px;
//    }
//   }

//   button {
//     width: 200px;
//   }

//   .flex1 {
//     display: flex;
//     flex-direction: row;
//     flex-wrap: wrap;
//     justify-content: center;
//   }

//   .card1 {
//     width: 238px;
//     border: 1px solid rgba(0,0,0,.125);
//     border-radius: .25rem;
//     margin: 16px;
//     &-body {
//       padding: 1.25rem;
//     }
//     &-title {
//       margin-bottom: .75rem;
//       font-weight: 600;
//       span.done {
//         text-decoration: line-through;
//       }
//     }
//   }
</style>
