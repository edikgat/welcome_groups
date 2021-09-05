import React from 'react'
import PropTypes from 'prop-types'

class GroupChatMessage extends React.Component {
  render(){
    const { message } = this.props

    return (
      <div className='group-chat-body'>
        <div className='group-chat-content'>
          <div className='friend-name'>
             <strong>{ message.user.login }</strong>
          </div>
          <p>
            { message.content }
          </p>
          <time className='group-chat-time'>{ message.created_at_text }</time>
        </div>
      </div>
    )
  }
}

GroupChatMessage.propTypes = {
  message: PropTypes.object
}

export default GroupChatMessage
