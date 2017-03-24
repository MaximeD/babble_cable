document.addEventListener('turbolinks:load', () => {

    const roomId = document.querySelector('#room_id');
    const messageInput = document.querySelector('#message');
    const editorInput = document.querySelector('#editor');
    const sendButton = document.querySelector('#send');
    const messageTemplate = document.querySelector('#message-template');
    const messagesList = document.querySelector('#messages');

    App.room = App.cable.subscriptions.create(
        {
            channel: "RoomChannel",
            room_id: roomId.value
        }, {

            // Called when subscription is ready for use on the server.
            connected() {
            },

            // Called when subscription has been terminated by the server.
            disconnected() {
            },

            // When a new message is received, display it on page.
            received(data) {
                let message = messageTemplate.cloneNode(true);
                message.firstChild.innerHTML = data.message;
                message.classList.remove('hidden');
                messagesList.insertBefore(message, messagesList.firstChild);
            },

            // Send a message to channel.
            speak(message) {
                this.perform('speak', {
                    message: message,
                    room_id: roomId.value
                });
            }
        });

    sendButton.addEventListener('click', (event) => {
        if (editorInput.value.length) {
            App.room.speak(editorInput.value);
            editorInput.value = '';
        }
        event.preventDefault();
    });
});
