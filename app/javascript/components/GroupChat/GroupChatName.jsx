import React from 'react'

class GroupChatName extends React.Component {
  render(){
    const { name } = this.props

    return (
      <h3 className='text-center' id='group-chat-name'>
        { name }
      </h3>
    )
  }
}

export default GroupChatName
