import consumer from "./consumer";

const initChatroomCable = () => {
    const messagesContainer = document.getElementById('messages');
    if (messagesContainer) {
        const id = messagesContainer.dataset.chatroomId;
        console.log("je suis ici", messagesContainer, id)
        consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
            received(data) {
                messagesContainer.insertAdjacentHTML('beforeend', data);
                messagesContainer.lastChild.scrollIntoView(false)
            }
        });
    }
}

export { initChatroomCable };