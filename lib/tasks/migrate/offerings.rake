namespace :migrate do
  desc 'Migrate offerings from iQualify backend to CIE backend'
  task offerings: :environment do
    http = Curl.get(ENV["IQUALIFY_API_BASE"] + "/offerings/current") do |http|
      http.headers['Authorization'] = ENV['IQUALIFY_KEY']
    end
    
    h = JSON.parse http.body_str
    h.each do |offering|

      # create offering if not already existing
      if Offering.find_by_iqualifyId(offering['id']).nil?
        @current_offering = Offering.create iqualifyId: offering['id'], name: offering['name'], start: offering['start'], end: offering['end']
        print "Created offering: #{offering['name']} \n"
      else
        @current_offering = Offering.find_by_iqualifyId(offering['id'])
      end
      
      # now grab the users for the offering
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
          @current_offering.enrolments << Enrolment.create(iqualify_user: @new_user)
          print "Added new user: #{@new_user.firstName} #{@new_user.lastName} (#{@new_user.email})"
        else
          @current_offering.enrolments << Enrolment.create(iqualify_user: IqualifyUser.find_by_iqualifyId(user['id']))
        end
      end
    end

  end
end