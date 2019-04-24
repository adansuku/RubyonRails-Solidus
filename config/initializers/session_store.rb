# Be sure to restart your server when you modify this file.

Rails.application.config.session_store :cookie_store,
                                       key: '_florentino_session',
                                       secure: Rails.env.production? || Rails.env.staging? # flags cookies as secure only in production
