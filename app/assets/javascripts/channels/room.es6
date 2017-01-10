document.addEventListener('turbolinks:load', () => {

  const roomId = document.querySelector('#room_id');
  const messageInput = document.querySelector('#message');
  const messageTemplate = document.querySelector('#message-template');
  const messagesList = document.querySelector('#messages ul');

  App.room = App.cable.subscriptions.create(
    {
      channel:"RoomChannel",
      room_id: roomId.value
    }, {

    // Called when subscription is ready for use on the server.
    connected() {},

    // Called when subscription has been terminated by the server.
    disconnected() {},

    // When a new message is received, display it on page.
    received(data) {
      let message = messageTemplate.cloneNode();
      message.innerHTML = data.message;
      message.classList.remove('hidden');
      messagesList.insertBefore(message, messagesList.firstChild);
    },

    // Send a message to channel.
    speak(message) {
      this.perform('speak', {
        message: message,
        room_id: room_id
      });
    }
  });

  // Bypass `Enter` key to broadcast message.
  messageInput.addEventListener('keypress', (event) => {
    if (event.keyCode === 13) {
      if(event.target.value.length) {
        App.room.speak(event.target.value);
        event.target.value = '';
      }
      event.preventDefault();
    }
  });
});
