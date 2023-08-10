#!/bin/bash

cd /root/anonym_resend_bot

/root/.rbenv/shims/bundle exec rake resendbot:run RAILS_ENV=production
