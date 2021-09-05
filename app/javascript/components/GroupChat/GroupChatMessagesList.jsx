import React from 'react'
import GroupChatMessage from './GroupChatMessage'
import PropTypes from 'prop-types'

class GroupChatMessagesList extends React.Component {
  render(){
    return <div className='group-chats' id='chat-box'>
      { this.renderMessagesList() }
    </div>
  }

  renderMessagesList(){
    const { messages } = this.props
    const { currentUserId } = this.props

    return messages.map((message) =>
      <div className={ message.user.id == currentUserId ? 'group-chat group-chat-right' : 'group-chat group-chat-left' } key={ message.id }>
        <GroupChatMessage message={ message } />
      </div>
    );
  }
}

GroupChatMessagesList.propTypes = {
  currentUserId: PropTypes.number,
  messages: PropTypes.array
}

export default GroupChatMessagesList
