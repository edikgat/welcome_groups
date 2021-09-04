import React from 'react'
import GroupChatMessagesList from './GroupChatMessagesList'
import GroupChatName from './GroupChatName'
import GroupChatChannelFactory from '../../services/GroupChatChannelFactory'

class GroupChat extends React.Component {
  constructor(props) {
    super(props)

    this.chatFactory = new GroupChatChannelFactory()
    this.state = {
      groupName: props.group_chat.name,
      currentUserId: props.current_user_id,
      messages: props.group_chat.messages,
      errors: []
    }
  }
  groupRenamed(data){
    this.setState({groupName: data.name})
  }
  newMessage(message){
    const { messages } = this.state
    const msgs = [...messages]
    if(msgs.length >= 30) {
      msgs.shift()
    }
    msgs.push(message)
    this.setState({messages: msgs, errors: []})
  }
  postMessage(event){
    event.preventDefault()
    this.chatChannel.perform('create_message', { group_id: this.props.group_chat.id, content: this.refs.content.value })
    this.refs.content.value = ''
  }
  addErrors(errors){
    this.setState({errors: errors})
  }
  componentWillUnmount(){
    this.chatChannel.unsubscribe()
  }
  groupRemoved(){
    window.location.assign("../")
  }
  componentDidMount(){
    this.chatChannel = this.chatFactory.create(this.props.group_chat.id, this)
  }
  errorMessages(){
    const { errors } = this.state
    if (errors.length) {
      return errors.map((error, index) => <div key={index}> {error} </div>)
    }
  }
  renderForm(){
    return (
      <div className='panel-footer'>
        <form onSubmit={ this.postMessage.bind(this) }>
          <div className='input-group'>
            <input type='text' ref='content' className='form-control' placeholder='Say something'></input>
            <span className='input-group-btn'>
              <button type='submit' className='btn btn-primary'>Send</button>
            </span>
          </div>
          <div className='invalid-feedback d-block'>
            { this.errorMessages() }
          </div>
        </form>
      </div>
    )
  }
  render() {
    const { messages } = this.state
    const { currentUserId } = this.state
    const { groupName } = this.state

    return (
      <div className='group-chat-container panel' id='group-chat'>
        <GroupChatName name={ groupName } />
        <div className='panel-body'>
          <GroupChatMessagesList messages={ messages } currentUserId={ currentUserId } />
        </div>
        { this.renderForm() }
      </div>
    )
  }
}

export default GroupChat
