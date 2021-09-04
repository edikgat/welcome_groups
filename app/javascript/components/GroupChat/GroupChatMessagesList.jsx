import React from 'react'
import GroupChatMessage from './GroupChatMessage'

class GroupChatMessagesList extends React.Component {
  render(){
    return <div className='group-chats' id='chat-box'>
      { this.renderMessagesList() }
    </div>
  }

  renderMessagesList(){
    const { messages } = this.props
    const { currentUserId } = this.props

    return messages.map((message, _) =>
      <div className={ message.user.id == currentUserId ? 'group-chat' : 'group-chat group-chat-left' } key={ message.id }>
        <GroupChatMessage message={ message } />
      </div>
    );
  }
}

export default GroupChatMessagesList
