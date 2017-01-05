# == Route Map
#
#                               Prefix Verb   URI Pattern                                     Controller#Action
#                             callback POST   /callback(.:format)                             collaboration_callbacks#confirm_url
#                                      DELETE /callback(.:format)                             collaboration_callbacks#confirm_url
#                                 root GET    /                                               guide#home
#                           xml_config GET    /xml_config(.:format)                           guide#xml_config
#                          xml_builder GET    /xml_builder(.:format)                          guide#xml_builder
#                     tool_proxy_index POST   /tool_proxy(.:format)                           tool_proxy#create
#                    learner_dashboard POST   /messages/learner_dashboard(.:format)           message#learner_dashboard
#          content_item_request_launch POST   /messages/content-item(.:format)                message#content_item_selection
#                  content_item_launch POST   /messages/content-item(.:format)                message#basic_lti_launch_request
# messages_signed_content_item_request POST   /messages/signed_content_item_request(.:format) message#signed_content_item_request
#                              youtube POST   /messages/youtube(.:format)                     message#youtube
#                    tool_registration POST   /register(.:format)                             registration#register
#                  tool_reregistration POST   /reregister(.:format)                           registration#register
#                    save_capabilities POST   /submit_capabilities(.:format)                  registration#save_capabilities
#                         submit_proxy GET    /submit_proxy/:registration_uuid(.:format)      registration#submit_proxy
#                  rails_lti2_provider        /rails_lti2_provider                            RailsLti2Provider::Engine
#                              default POST   /default(.:format)                              message#basic_lti_launch_request
#
# Routes for RailsLti2Provider::Engine:
# tool_proxy_registration POST   /tool_proxy/register(.:format)                               rails_lti2_provider/tools#register
#            submit_proxy GET    /tool_proxy/submit_registration/:registration_uuid(.:format) rails_lti2_provider/tools#submit_proxy
#               show_tool GET    /tool_proxy/:tool_proxy_id(.:format)                         rails_lti2_provider/tools#show
#      rereg_confirmation PUT    /tool_proxy/:tool_proxy_guid(.:format)                       rails_lti2_provider/tool#apply_rereg
#                         DELETE /tool_proxy/:tool_proxy_guid(.:format)                       rails_lti2_provider/tool#delete_rereg
#

LtiToolProvider::Application.routes.draw do

  post 'callback', to: 'collaboration_callbacks#confirm_url'
  delete 'callback', to: 'collaboration_callbacks#confirm_url'

  root to: 'guide#home'

  get 'xml_config', to: 'guide#xml_config', as: :xml_config
  get 'xml_builder', to: 'guide#xml_builder', as: :xml_builder

  resources :tool_proxy, only: [:create]

  post 'messages/learner_dashboard', to: 'message#learner_dashboard', as: 'learner_dashboard'
  post 'messages/content-item', to: 'message#content_item_selection', as: 'content_item_request_launch'
  post 'messages/content-item', to: 'message#basic_lti_launch_request', as: 'content_item_launch'
  post 'messages/signed_content_item_request', to: 'message#signed_content_item_request'
  post 'messages/youtube', to: 'message#youtube', as: 'youtube'

  post 'register', to: 'registration#register', as: :tool_registration
  post 'reregister', to: 'registration#register', as: :tool_reregistration
  post 'submit_capabilities', to: 'registration#save_capabilities', as: 'save_capabilities'
  get 'submit_proxy/:registration_uuid', to: 'registration#submit_proxy', as: 'submit_proxy'

  mount RailsLti2Provider::Engine => "/rails_lti2_provider"

end
