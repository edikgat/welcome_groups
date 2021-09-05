import React from 'react'
import PropTypes from 'prop-types'

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

GroupChatName.propTypes = {
  name: PropTypes.string
}

export default GroupChatName
