<template>
    <div>
        <div class='h4'>
            <h3>{{settings.title}}</h3>
        </div>
        <div id='main'>
            <div class='tr' v-if='controlBox'>
                <button @click="addArticle()">글쓰기</button>
            </div>
            <div v-if="openList">
                <table>
                    <tr v-for="article in articleList" :key="article.id">
                        <td>{{article.id}}</td>
                        <td>{{article.title}}</td>
                    </tr>
                </table>
            </div>
            <div v-if="openArticle">
                <h4>글쓰기 등록</h4>
                <div>
                    <input type="text" style="width:58rem">
                    <textarea rows='15' style="width:58rem"></textarea>
                    <div class='tr'>
                        <button @click="closeAddForm()">완료</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
export default {
  data() {
    return {
      controlBox: true,
      openList: true,
      openArticle: false,
      articleList: []
    };
  },
//   mounted() {
//     this.axios
//       .get("https://jsonplaceholder.typicode.com/posts")
//       .then(res => {
//         this.articleList = res.data;
//       });
//   },  
  props: ["settings"],
  methods: {
    addArticle() {
      this.controlBox = false;
      this.openArticle = true;
      this.openList = false;
    },
    closeAddForm() {
      this.controlBox = true;
      this.openArticle = false;
      this.openList = true;
    }
  }
};
</script>
