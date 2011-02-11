# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_gmap_session',
  :secret      => '5855653bf61c2c00cd9041a69d28b250f4b306be21d509a1f485b754e6ef7ca4098a41f8f8c69e923d6eb6cd1ccf5e6f40dada7a635879d0eff6cab5f02f7030'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
