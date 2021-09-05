import consumer from "../channels/consumer"

class GroupChatChannelFactory {

  create(group_id, callback) {
    return(
      consumer.subscriptions.create({
        channel: 'GroupChatChannel',
        group_id: group_id,
      }, {
        received: ({type, data}) => {
          switch (type) {
            case 'message_new':
              callback.newMessage(data)
              break
            case 'message_error':
              callback.addErrors(data)
              break
            case 'group_removed':
              callback.groupRemoved()
              break
            case 'group_renamed':
              callback.groupRenamed(data)
              break
            default:
              console.error({type, data})
          }
        }
      })
    )
  }
}

export default GroupChatChannelFactory
