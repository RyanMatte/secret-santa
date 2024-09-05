### 2023 Secret Santa

This website is deployed in fly.io, however you can easily download this repo and start with a free tier.

# Requirements 
- Ruby 3.2.2
- Rails 7.0.7
- SQLite 1.4
  
# Deployment
Prior to deploying, the signup page has been rendered unusable until next year. If you wish to make this a working site, you can copy the sign_in form. 

Insure you have Ruby 3.2.2 and Rails 7.0.7 installed prior to any installation. 

1. After cloning this REPO locally, run bundle/install and bundler should install the necessary components.
2. running ./bin/dev should load up a development environment on localhost:3000
3. if you want to deploy this to a server, this is configured to work with fly.io. Confiruing fly.io and running 'fly deploy' should utilize the appropriate docker files and utilize a fly.dev domain.

That's really it! 

If you need to access the rails console in fly the following command should work. 
```
 fly ssh console --pty -C "/rails/bin/rails console"
```

