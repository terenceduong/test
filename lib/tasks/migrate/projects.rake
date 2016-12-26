namespace :migrate do
  desc 'Migrate projects from iQualify backend to CIE backend'
  task projects: :environment do
    http = Curl.get(ENV["IQUALIFY_API_BASE"] + "/offerings/current") do |http|
      http.headers['Authorization'] = ENV['IQUALIFY_KEY']
    end
    
    h = JSON.parse http.body_str
    h.each do |offering|
      if (offering['name'].include? "Project")
        
        # create project if not already existing
        if Project.find_by_iqualifyId(offering['id']).nil?
          Project.create iqualifyId: offering['id'], name: offering['name'], start: offering['start'], end: offering['end']
          print "Created project: #{offering['name']} \n"
        end
        
        # now grab the users for the project
        http_users = Curl.get(ENV["IQUALIFY_API_BASE"] + "/offerings/#{offering['id']}/users" ) do |http_users|
          http_users.headers['Authorization'] = ENV['IQUALIFY_KEY']
        end
        h_users = JSON.parse http_users.body_str
        h_users.each do |user|
          if IqualifyUser.find_by_iqualifyId(user['id']).nil?
            @new_user = IqualifyUser.new
            @new_user.iqualifyId = user['id']
            @new_user.firstName  = user['firstName']
            @new_user.lastName   = user['lastName']
            @new_user.email      = user["email"]
            if user.has_key?("profile") and user["profile"].has_key?("mobile")
              @new_user.mobile = user["profile"]["mobile"]
            end
            if user.has_key?("studentId")
              @new_user.studentId = user["studentId"]
            end
            @new_user.save!
            print "Added new user: #{@new_user.firstName} #{@new_user.lastName} (#{@new_user.email})"
          end
        end

      end
    end

  end
end