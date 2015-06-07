Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer   unless Rails.env.production?
  provider :vkontakte, '4948903', 'OTGVclh6IsaxA33nAvpk', scope: 'email'
  provider :facebook, '366826560173548', '2da5e2ed39e1427f29a7e278619dde84', scope: 'email'
end
