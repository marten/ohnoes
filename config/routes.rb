Ohnoes::Engine.routes.draw do
  post 'notifier_api/notices' => 'frontend_exceptions#create'

end
