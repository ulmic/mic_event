Configus.build Rails.env do
  env :production do
    site "mic-events.ru"
    admin_email "it@ulmic.ru"
  end
  env :development, parent: :production
  env :test, parent: :development
end
