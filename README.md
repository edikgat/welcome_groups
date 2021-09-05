# WelcomeGroups
## Used Technologies
- Ruby (2.7.2)
- [Rails 6.0.4](https://github.com/rails/rails) - this version was released at June 15, 2021
- [React](https://reactjs.org/) For JS part group chats
- [Bootstrap 5](https://getbootstrap.com/) as UI framework
- [Pundit](https://github.com/varvet/pundit) for authorization system
- [Devise](https://github.com/heartcombo/devise) for simple UI authentication
- [Roar](https://github.com/ruby-grape/grape-entity) for api representers (serializers)
- [RSpec](https://github.com/rspec/rspec) For Unit & API Tests
- [Capybara](https://github.com/teamcapybara/capybara) For UI tests
- [Pry](https://github.com/pry/pry) For Easy Debugging And Code Inspecting
- [MySQL](https://www.mysql.com/) for relative database
- Webpacker for modern style js packaging (with yarn, babel, etc)

## Patterns & Rails Enhancements
- Form Objects - for creating user messages (other types of usual things like Service Objects are not needed for current functionality)
- Representers - for serialization of data (representers is correct name that is recommended by the Roar authors)
- ActionCable for real time events
- ActiveJob for message broadcasting
- Customized Bootstrap styles for `Group Chat` page
- Customized Devise views with adding bootstrap styles

## What Does It Do?
- Welcome Groups is a simple group chat application
- Users are able to sign up and sign in with using `devise` - everybody can sign up, confirmations, and other not required functionality are disabled
- To sign up, users need to enter their login & email & password. Login is visible to other users, and should be unique as well as email
- User is able to update credentials & login at UI
- Each user is able to create groups
- User is able to remove or update the name of the group that he/she created
- Everybody can see all groups, and can write messages to all groups
- When a user enters the group `show` page, he/she see `Group Chat` - where the current user's messages are on the right, and other users' messages are on the left side
- Group Chat is using React for js side
- Action Cable is responsible for the dynamic part of the `Group Chat`
- When a user sends a message to group, other users that are inside such `Group Chat` will see it
- When the Group Owner renames the `Group Chat`,users that are inside this `Group Chat` will see it without page reloading
- When the Group Owner removes the Group Chat` - users that are inside this `Group Chat` will be redirected to the root page

## How does it work?
- When User go to `Group Chat` he subscribes to `GroupChatChannel` by using `GroupChatChannelFactory` at the client side. Such subscription activates just when the user go to `Group Chat` page
- React part is using several components: base, chat message, message list and chat name
- Existing messages for the `Group Chat` will be loaded when the user goes to the `Group Chat` - without additional API - just on the page
- All broadcasting is done inside background jobs
- System has seeds for basic data

## Code Analysis
- Tests Coverage 98% by [SimpleCov](https://github.com/colszowka/simplecov), including specs for browser requests, representers, background jobs, models, channels specs, policies and forms
- Code Inspected by [RuboCop](https://github.com/rubocop-hq/rubocop), no offenses detected. Styles Unified by the creating `rubocop.yml` and fixing all related styles issues
- Code Inspected for security vulnerabilities by [Brakeman](https://github.com/presidentbeef/brakeman), no warnings found

## Requirements
- Ruby = 2.7.2
- MySQL
- Node.js >= 12

## Setup
- Go to the project's folder in your terminal
- Configure `config/database.yml` with your local credentials
- Run `bundle`
- Run `rake db:setup`
- Run `yarn install`

## Run
- Start server `rails s`
- Go to `http://localhost:3000/`
- Use `email1@mail.com` with `123456` password or Sign up

## Seeds
- `rake db:seed`

## Running tests
- `rspec spec/`

## Tests Coverage Report
- run `COVERAGE=true rspec ./spec`

## Code Quality Report
- Run `rubocop`

## View Code From the `Rails New`
- 'https://github.com/edikgat/welcome_groups/compare/rails_new...develop?expand=1'