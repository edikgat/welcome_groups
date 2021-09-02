// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import Button from 'react-bootstrap/Button'

const Hello = props => (
  <Button>Hello {props.name}!</Button>
)

Hello.defaultProps = {
  name: 'David'
}

Hello.propTypes = {
  name: PropTypes.string
}

class GroupChat extends React.Component {
  render() {
    return (
      <div className="group-chat-container panel" id="group-chat">
        <div className="panel-body">
          <div className="group-chats">
            <div className="group-chat">
              <div className="group-chat-body">
                <div className="group-chat-content">
                  <div className="friend-name">
                     <strong>JaneDoe</strong>
                  </div>
                  <p>
                    Good morning, sir.
                  </p>
                  <time className="group-chat-time">11:37:08 am</time>
                </div>
              </div>
            </div>
            <div className="group-chat group-chat-left">
              <div className="group-chat-body">
                <div className="group-chat-content">
                  <div className="friend-name">
                     <strong>JaneDoe</strong>
                  </div>
                  <p>Well, I am just looking around.</p>
                  <time className="group-chat-time">11:39:57 am</time>
                </div>
              </div>
            </div>
            <div className="group-chat">
              <div className="group-chat-body">
                <div className="group-chat-content">
                  <div className="friend-name">
                     <strong>JaneDoe</strong>
                  </div>
                  <p>
                    If necessary, please ask me.
                  </p>
                  <time className="group-chat-time">11:40:10 am</time>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div className="panel-footer">
          <form>
            <div className="input-group">
              <input type="text" className="form-control" placeholder="Say something"></input>
              <span className="input-group-btn">
                <button className="btn btn-primary" type="button">Send</button>
              </span>
            </div>
          </form>
        </div>
      </div>
    )
  }
}

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <GroupChat name="React" />,
    document.body.appendChild(document.createElement('div')),
  )
})
