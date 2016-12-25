RailsLti2Provider::Tool.create!(uuid: ENV['LTI_CONSUMER_KEY'], 
                                shared_secret: ENV['LTI_CONSUMER_KEY'], 
                                lti_version: ENV['LTI_VERSION'], 
                                tool_settings:'none')