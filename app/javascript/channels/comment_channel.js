import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html = `<p class="comment"><strong><a href="#">${data.nickname}</a>：  </strong>${data.content.text}</p>`;
    const comments = document.getElementById('comments_menu');
    const newComment = document.getElementById('comment_text');
    comments.insertAdjacentHTML('afterend', html);
    newComment.value='';
  }
});
