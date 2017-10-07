import ActionCable from 'actioncable'
import auth from 'src/auth'

function cableConnect (store) {
  document.cookie = `Authorization=${auth.getToken()};path=/`
  const cable = ActionCable.createConsumer()
  cable.subscriptions.create(
    { channel: 'ProjectsChannel' },
    {
      received: data => {
        console.log(data)
      },
    }
  )
}

export default cableConnect
