<template>
  <div>
    <div v-for="row in rows" class="row">
      <div class="card">
        <div class="card-body">
          <div class="float-right">
            {{ row.attributes.pub_date | moment  }}
            <p>{{ row.attributes.category }}</p>
          </div>
          <h3 class="card-title" style="font-size: 1.7rem">
            <a :href="row.attributes.link">
              <span v-html="row.attributes.title"></span>
            </a>
          </h3>

          <div class="row">
            <div class="col-md-12">
              <div class="col-auto">
                <div v-html="row.attributes.description"></div>
              </div>
              <div class="col">
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>

import axios from 'axios'
import moment from 'moment/src/moment'

export default {
  data: function () {
    return {
      columns: ['Category', 'Media', 'Title', 'Description', 'Pub date', 'Guid', 'Link'],
      rows: [],
    }
  },
  async mounted() {
    const data = await axios.get('/ajax/feeds.json');
    console.log(data.data.data);
    this.rows = data.data.data;
  },
  filters: {
    moment: function(date) {
      return moment(date).format('MMMM Do YYYY, h:mm:ss a');
    }
  },
}
</script>

<style>
  #feed-listing-vue h1, #feed-listing-vue h2, #feed-listing-vue h3, #feed-listing-vue h4, #feed-listing-vue h5 { 
    font-size: 1rem;
  }
</style>
