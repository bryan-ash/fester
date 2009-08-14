# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_yougojumping_session',
  :secret      => 'b4e391cefffb2e57b6ba26dfbc98ab2974d4eebfed09437e34bd53f8a881d33bcb08542995d97dfea806e979a71873c0b583b9fd7218d02ca71037d76c5519cd'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
