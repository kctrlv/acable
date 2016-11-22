class User < ApplicationRecord
  has_secure_password

  def connect
    update_attribute(:status, 'online')
    broadcast_user_action('connect')
  end

  def disconnect
    update_attribute(:status, nil)
    broadcast_user_action('disconnect')
  end

  private

  def broadcast_user_action(action)
    broadcast({ action: action,
                model: 'user',
                uid: id,
                name: name })
  end
end
