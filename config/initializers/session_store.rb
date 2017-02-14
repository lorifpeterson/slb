# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_slb_session',
  :secret      => 'a9420e3c284adcba1e5aa20ecbfb5a7aa7ee6f6a7f72b0f76332d3e39ec6b65ff92059f2a7c3cd553daebfd755872711e80b93a18cd46fc8b6d554322022e7dd'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
ActionController::Base.session_store = :active_record_store