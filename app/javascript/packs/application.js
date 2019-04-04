import 'stylesheets/application';
import Vue from 'vue/dist/vue.esm'

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#app',
    components: {
      'feed-listing': () => import('../feed-listing/FeedListing'),
      'feed-category': () => import('../feed-listing/FeedCategory')
     }
  })
})